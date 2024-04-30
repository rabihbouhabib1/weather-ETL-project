# Weather Forcast ETL
*Creating an automated Extract, Transform, Load (ETL) process to extract daily weather forecast and observed weather data and load it into a live report.*

**script.sh does the following tasks:**
- Create a log file and input a header in it
- Extract weather data from wttr.in for the city of Nice in France and store raw data in a local file
- Extract relevant data from our raw data
- Append results to the log file

**cronjob.sh does the following task:**
- Specify a cron syntax and runs `script.sh` everyday at 7:00 AM

## Instructions to run:
- Make sure you are running on WSL, a Linux-based VM or a Linux OS ;)
- `./script.sh`
- `./cronjob.sh`

