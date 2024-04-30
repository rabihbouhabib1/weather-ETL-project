#! /bin/bash

# Adding a header to the log file, colums seperated by semicolons
header=$(echo -e "year;month;day;hour;obs_tmp;fc_temp")
echo $header>report.log
# echo -e "year\tmonth\tday\thour\tobs_tmp\tfc_temp">report.log

# Extracting weather data from wttr.in  and inserting it into a timestamped file 'raw_data_YYYYMMDD'
weather_report=raw_data_$(date +%Y%m%d)
city=Nice                        # I chose the city of Nice
curl wttr.in/$city --output $weather_report

# Retreiving relevant data
grep °C $weather_report > temperatures.txt
obs_tmp=$(head -1 temperatures.txt | tr -s " " | xargs | rev | cut -d " " -f2 | rev) 
#returns the temperature of the first line

# Extracting tomorrow's temperature
fc_temp=$(head -3 temperatures.txt | tail -1 | tr -s " " | xargs | cut -d "C" -f2 | rev | cut -d " " -f2 | rev)

# Extracting current year, month, day, and hour
year=$(date +%Y)
month=$(date +%m)
day=$(date +%d)
hour=$(date +%H)
# If the target location has a different timezone, we can use:
# hour=$(TZ='Spain/Madrid' date -u +%H) 
# day=$(TZ='Spain/Madrid' date -u +%d) 
# month=$(TZ='Spain/Madrid' date +%m)
# year=$(TZ='Spain/Casablanca' date +%Y)

# Merging the fields and seperate them with tabs
record=$(echo -e "$year;$month;$day;$hour;$obs_tmp;$fc_temp")
echo $record>>report.log