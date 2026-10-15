#!/bin/bash

# This script is to get weather data from openweathermap.com in the form of a
# json file so that conky will still display the weather when offline even
# though it's not up to date

# Load .env
set -a
source ./.env
set +a

# Check for missing values
[ -z "$API_KEY" ] && { echo "Missing API_KEY"; exit 1; }
[ -z "$CITY_ID" ] && { echo "Missing CITY_ID"; exit 1; }

url="api.openweathermap.org/data/2.5/weather?id=${CITY_ID}&appid=${API_KEY}&cnt=5&units=metric&lang=en"
curl ${url} -s -o ~/.cache/weather.json
