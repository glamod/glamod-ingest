#!/usr/bin/env python

from subprocess import Popen, PIPE


DOMAINS = "land marine".split()
#REPORT_TYPES="0 2 3"
#DOMAINS=$1
#REPORT_TYPES=$2
#VARIABLES=""

variables = {
    'marine': '36 58 85 95 106 107'.split(),
    'land':   '36 44 45 53 55 57 58 85 106 107'.split()
}


def write_yamls():

    for domain in DOMAINS:

        vars_list = variables[domain] 

        """
    if [ $domain = "marine" ]; then REPORT_TYPES="0" fi
    for report_type in $REPORT_TYPES; do

        if [ $domain = "land" ]; 
           if [ $report_type = "0" ]; then VARIABLES="36 57 58 85 106 107"
           elif [ $report_type = "2" ]; then VARIABLES="44 55 85 107"
           elif [ $report_type = "3" ]; then VARIABLES="44 45 53 55 85 106 107"
        else
            VARIABLES="36 58 85 95 106 107"
        fi

"""

        land_vars = {
            'sub-daily': '36 57 58 85 106 107'.split(),
            'monthly': '44 55 85 107'.split(),
            'daily':   '44 45 53 55 85 106 107'.split()
        }
        freq_keys = 'sub-daily daily monthly'.split()

                     
        fout = f'variables-{domain}.yaml'

        with open(fout, 'w') as writer:

            writer.write('variables:\n') 
            csvars = ','.join(vars_list)

            SELECT = 'SELECT variable, name, units, description FROM observed_variable'
            WHERE = f'WHERE ARRAY[variable] <@ ARRAY[{csvars}]'

            p = Popen('psql -t -q -U glamod_root -h localhost cdm -c'.split() + [f'{SELECT} {WHERE};'], stdin=PIPE, stdout=PIPE, stderr=PIPE)
            output, err = p.communicate()
          
            for line in output.split(b'\n'):
                if not line.strip(): break

                code, name, units, description = [_.strip().decode('utf-8') for _ in line.strip().split(b'|')]

                writer.write(f'  {name.title()}:\n')
                writer.write(f'    units: {units}\n')
                writer.write(f'    short_name: {name.lower().replace(" ", "_")}\n') 
                desc = description[0].capitalize()[0] + description[1:] 
                desc = desc.rstrip('.') + '.'

                if name.title() == 'Fresh Snow':
                    desc = 'New snow accumulated between consecutive observations or over reporting period.'

                if domain == 'land':
                    freqs = [_ for _ in freq_keys if code in land_vars[_]]
                    availability = ' (Available at frequencies: ' + ', '.join(freqs) + ')'
                else:
                    availability = ''

                writer.write(f'    description: "{desc}{availability}"\n')
 
write_yamls()
