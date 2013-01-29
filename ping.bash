#!/usr/bin/env bash
#
# Ping, save and push.
##

while [ 1 ]; do
  # Set date
  DATE=`date '+%Y%m%d'`

  # Ping google.com
  ping -i 9 -q -c 100 74.125.226.229 | awk '/^[0-9]/ { print time,$4 }' "time=$(date '+%s %Y-%m-%d %H:%M')" >> data/${DATE}.csv

  # Plot the latest
  cp data/${DATE}.csv data/latest.csv
  gnuplot plot.plt

  # Save data to GitHub
  MSG=$(date)
  git add data/${DATE}.csv
  git add data/latest.csv
  git add plot.png
  git commit -m "${MSG}"
  git push origin gh-pages
done
