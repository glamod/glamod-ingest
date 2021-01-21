#!/bin/bash

if [ ! "$PSQL_PREFIX" ]; then
    echo "[ERROR] Must define PSQL_PREFIX env variable...like..."
    echo "        psql -U <user> -h <host> <database>"
    exit
fi

schema=$1

if [ ! "$schema" ]; then
    echo "[ERROR] Please provide schema as first argument (e.g. 'lite_2_0')"
    exit
fi

DOMAINS=$2

if [ ! "$DOMAINS" ] ; then
    echo "[ERROR] Please provide the domain(s) as second argument ('land' or 'marine')."
    exit
fi

REPORT_TYPES=$3

if [ ! "$REPORT_TYPES" ] ; then
    echo "[ERROR] Please provide the report type(s) as third argument (0, 2 or 3)."
    exit
fi

# Get years as any extra command-line arguments
requested_years=

n=0
for i in $@; do
    if [ $n -lt 3 ]; then
        let n+=1
        continue
    fi
    
    requested_years="$requested_years $i"
done

if [ "$requested_years" ]; then
#    echo "[INFO] Filtering requested years: $requested_years"
     dummy="pass"
fi

#DOMAINS="land marine"
#REPORT_TYPES="0 2 3"

VARIABLES=""
DATA_POLICY_LICENCES="0 1"
QUALITY_FLAGS="0 1"
MONTHS=$(seq 1 12)

header="domain,report_type,variable,data_policy_licence,quality_flag,year,month,count"
echo $header

for domain in $DOMAINS; do

    if [ $domain = "marine" ]; then
        REPORT_TYPES="0"
        YEARS=$(seq 1801 2020)
    else
        YEARS=$(seq 1755 2020)
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

        for year in $YEARS; do

            # Filter years as requested (or default to all)
            if [ "$requested_years" ]; then
                matched_year=

                for requested_year in $requested_years; do
                    if [ $requested_year -eq ${year} ]; then
#                        echo "Matched requested year: $year"
                        matched_year=1
                        break
                    fi
                done
            
                if [ ! "$matched_year" ]; then
                    continue
                fi
            fi

            for variable in $VARIABLES; do

                for data_policy_licence in $DATA_POLICY_LICENCES; do

                    for quality_flag in $QUALITY_FLAGS; do

                        for month in $MONTHS; do
                
                            month=$(printf "%02d" $month)
                            LAST_DAY=$(cal $month $year | awk 'NF {DAYS = $NF}; END {print DAYS}')
                            SELECT="SELECT COUNT(*) FROM ${schema}.observations_${year}_${domain}_${report_type}"
                    
                            # BETWEEN is inclusive of bounds
                            WHEN="date_time BETWEEN '${year}-${month}-01 00:00:00+00' AND '${year}-${month}-${LAST_DAY} 23:59:59+00'"
                            FILTERS="data_policy_licence = ${data_policy_licence} AND quality_flag = ${quality_flag}"

                            sql="${SELECT} WHERE ${WHEN} AND ${FILTERS} ;"

                            count=$($PSQL_PREFIX -t -q -c "${sql}")            

                            if [ $? -eq 0 ]; then
                                echo "$domain,$report_type,$variable,$data_policy_licence,$quality_flag,$year,$month,$count"                
                            fi
                    
                        done
                    done
                done
            done
        done
    done
done
