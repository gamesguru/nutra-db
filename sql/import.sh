#!/bin/bash

DB=nutra
SCHEMA=nt

cd "$(dirname "$0")"
cd ../data/csv/usda

# # Import primary tables
# declare -a ptables=("tenants" "solvers" "simulators" "req_srcs" "scens")
# for table in "${ptables[@]}"
# do
#   echo $table
#   psql -c "\copy $SCHEMA.$table FROM '${table}.csv' WITH csv HEADER" postgresql://$LOGNAME@localhost:5432/$DB
# done

# Import remaining tables
for filename in *.csv; do
  # https://stackoverflow.com/questions/12590490/splitting-filename-delimited-by-period
  table="${filename%%.*}"

  # Skip covered tables
  # if [[ ! " ${array[@]} " =~ " ${ptables} " ]]; then
    echo $table
    cat "$filename" | psql -c "\copy $SCHEMA.$table FROM $table.csv WITH csv HEADER"  postgresql://$LOGNAME@localhost:5432/$DB
  # fi
done
