#!/bin/bash

## RESULTS look like: 
#  observation_id,data_policy_licence,date_time,date_time_meaning,observation_duration,longitude,latitude,report_type,height_above_surface,observed_variable,units,observation_value,value_significance,platform_type,station_type,primary_station_id,station_name,quality_flag
#  NLM00006253-1-1999-03-02-00:00-85-12,WMO essential,1999-03-02 00:00:00+00:00,beginning,instantaneous,2.067,56.4,SYNOP,2.0,air temperature,K,279.35,Instantaneous value of observed parameter,,Land station,NLM00006253,AUK-ALFA,Passed
#
# COLUMNS are:
# 
# - observation_id
# - data_policy_licence
# - date_time
# - date_time_meaning
# - observation_duration
# - longitude
# - latitude
# - report_type
# - height_above_surface
# - observed_variable
# - units
# - observation_value
# - value_significance
# - platform_type
# - station_type
# - primary_station_id
# - station_name
# - quality_flag

# COUNTS are needed for:
# - domain: land, marine
# - frequency: 0, 2, 3
# - variable: *
# - data_policy_licence: 0, 1 
# - quality_flag: 0, 1 
# - year
# - month
# - day?
# - hour?


#DOMAINS="land marine"
#REPORT_TYPES="0 2 3"
DOMAINS=$1
REPORT_TYPES=$2

VARIABLES=""
DATA_POLICY_LICENCES="0 1"
QUALITY_FLAGS="0 1"

YEARS=$(seq 1753 2022)
MONTHS=$(seq 1 12)

header="domain,report_type,variable,data_policy_licence,quality_flag,year,month,count"
echo $header

for domain in $DOMAINS; do

    if [ $domain = "marine" ]; then
        REPORT_TYPES="0"
        YEARS=$(seq 1946 2022)
    fi

    for report_type in $REPORT_TYPES; do

        if [ $domain = "land" ]; then
           if [ $report_type = "0" ]; then
               VARIABLES="36 57 58 85 106 107"
           elif [ $report_type = "2" ]; then
               VARIABLES="44 55 85 107"
           elif [ $report_type = "3" ]; then
               VARIABLES="44 45 53 55 85 106 107"
           fi
        else
            VARIABLES="36 58 85 95 106 107"
        fi

        for variable in $VARIABLES; do

            for data_policy_licence in $DATA_POLICY_LICENCES; do

                for quality_flag in $QUALITY_FLAGS; do

                    for year in $YEARS; do
                        for month in $MONTHS; do
                
                            month=$(printf "%02d" $month)
                            LAST_DAY=$(cal $month $year | awk 'NF {DAYS = $NF}; END {print DAYS}')
                            SELECT="SELECT COUNT(*) FROM lite.observations_${year}_${domain}_${report_type}"
                    
                            # BETWEEN is inclusive of bounds
                            WHEN="date_time BETWEEN '${year}-${month}-01 00:00:00+00' AND '${year}-${month}-${LAST_DAY} 23:59:59+00'"
                            FILTERS="data_policy_licence = ${data_policy_licence} AND quality_flag = ${quality_flag}"

                            sql="${SELECT} WHERE ${WHEN} AND ${FILTERS} ;"
                            count=$(psql -t -q -U glamod_root -h localhost cdm -c "${sql}")
 
# - domain: land, marine
# - frequency: 0, 2, 3
# - variable: *
# - data_policy_licence: 0, 1
# - quality_flag: 0, 1
# - year
# - month
# - day?
# - hour?

                            echo "$domain,$report_type,$variable,$data_policy_licence,$quality_flag,$year,$month,$count"
                    
                        done
                    done
                done
            done
        done
    done
done
