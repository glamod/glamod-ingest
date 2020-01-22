#!/usr/bin/env python

"""
make-create-partition-sqls.py
=============================

Writes sql scripts to create partitions.

"""

import sys


database = sys.argv[1]
schema = sys.argv[2]

stations = {
    'land':   {'report': {0, 2, 3}, 'start': 1761},
    'marine': {'report': {0}, 'start': 1946},
}

inv_stations = {
    'land': 1,
    'marine': 2
}

START_YEAR = 1761

outfile = open('create-observation-children.sql', 'w')

print('\connect {}'.format(database), file = outfile)

# generate child tables
for year in range(START_YEAR, 2019):

    tmin = '{}-01-01 00:00:0.0+0'.format(year)
    tmax = '{}-01-01 00:00:0.0+0'.format(year + 1)
    
    for station, values in stations.items():
    
        if values['start'] > year: continue
    
        for report in values['report']:
        
           table_name = '{}.observations_{}_{}_{}'.format( schema, year, station, report )
           table_short = 'observations_{}_{}_{}'.format( year, station, report )
           station_constraint = inv_stations[station]
           
           print('')
           print( 'create table {}() inherits ( {}.observations );'.format( table_name, schema ), file = outfile )
           print( 'alter table {} add constraint {}_pk primary key (observation_id);'.format( table_name, table_short ), file = outfile )
           print( 'alter table {} add constraint {}_report check( report_type = {});'.format( table_name, table_short, report), file = outfile)
           print( 'alter table {} add constraint {}_station check( station_type = {} );'.format(table_name, table_short, station_constraint) , file = outfile)
           print( "alter table {} add constraint {}_date check(date_time >= TIMESTAMP WITH TIME ZONE '{}' and date_time < TIMESTAMP WITH TIME ZONE '{}' );".format(table_name, table_short, tmin, tmax ) , file = outfile)
           
outfile.close()

outfile = open('create-observation-triggers.sql', 'w')
print('\connect {}'.format(database), file = outfile)

outfile2 = open('validate-observation-triggers.sql','w')
print('\connect {}'.format(database), file = outfile2)

# Insert triggers
print( '' )
print( 'CREATE OR REPLACE FUNCTION {}.observation_insert_trigger()'.format(schema), file = outfile)
print( '    RETURNS TRIGGER AS $$', file = outfile)
print( '    BEGIN', file = outfile)

for year in range(START_YEAR, 2019):

    tmin = '{}-01-01 00:00:0.0+0'.format(year)
    tmax = '{}-01-01 00:00:0.0+0'.format(year + 1)
    print( "        IF NEW.date_time >= TIMESTAMP WITH TIME ZONE '{}' AND NEW.date_time < TIMESTAMP WITH TIME ZONE '{}' THEN".format( tmin, tmax), file = outfile)
    counter = 0
    
    for station, values in stations.items():
    
        if values['start'] > year: continue
    
        station_constraint = inv_stations[station]
        if( counter == 0):
            print('            IF NEW.station_type = {} THEN'.format(station_constraint) , file = outfile)
        else:
            print('            ELSIF NEW.station_type = {} THEN'.format(station_constraint), file = outfile)
            
        counter2 = 0
        for report in values['report']:
            table_name = '{}.observations_{}_{}_{}'.format( schema, year, station, report )
            table_short = 'observations_{}_{}_{}'.format( year, station, report )

            print('CREATE TRIGGER observation_insert_check_{}_{}_{} BEFORE INSERT ON'.format(year, station, report), file = outfile2)
            print('    {}'.format( table_name ), file = outfile2)
            print('FOR EACH ROW', file = outfile2)
            print('    EXECUTE PROCEDURE {}.validate_observations();'.format(schema), file = outfile2)

            if( counter2 == 0):
                print('                IF NEW.report_type = {} THEN'.format(report) , file = outfile)
                print('                    INSERT INTO {} VALUES(NEW.*);'.format(table_name), file = outfile)
            else:
                print('                ELSIF NEW.report_type = {} THEN'.format(report), file = outfile)
                print('                    INSERT INTO {} VALUES(NEW.*);'.format(table_name), file = outfile)
            counter2 += 1
            
        print('                ELSE', file = outfile)
        print("                    RAISE EXCEPTION 'Invalid report type in observation_insert_trigger';", file = outfile)
        print('                END IF;', file = outfile)
        counter += 1
        
    print('            ELSE', file = outfile)
    print("                RAISE EXCEPTION 'Invalid station type in observation_insert_trigger';", file = outfile)
    print('            END IF;', file = outfile)
    print('        END IF;', file = outfile)
    
print( '      RETURN NULL;', file = outfile)
print( '    END', file = outfile)
print( '$$', file = outfile)
print( 'LANGUAGE plpgsql;', file = outfile)
outfile.close()
outfile2.close()

outfile = open('add-observation-triggers.sql','w')
print('\connect {}'.format(database), file = outfile)
print( 'CREATE TRIGGER observation_insert_trigger', file = outfile)
print( 'BEFORE INSERT ON {}.observations'.format(schema), file = outfile)
print( 'FOR EACH ROW EXECUTE PROCEDURE {}.observation_insert_trigger();'.format(schema), file = outfile)
outfile.close()


