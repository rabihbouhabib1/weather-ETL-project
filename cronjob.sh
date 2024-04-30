#! /bin/bash

# Define cron syntax: Running everyday at 7:00 AM 
cronjob="0 7 * * * /script.sh"

# Add the cron job to the crontab
echo "$cronjob" | crontab -