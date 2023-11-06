#!/bin/bash

# Define the location of the filter script
filter_script="./3-extract_domain.sh"

# Run the script to filter and display email addresses
output=$($filter_script)

# Define the expected domain names as a multi-line string
expected_output=$(cat <<EOF
batz.com
blanda.com
crist.org
daniel.com
fadel.com
gmail.com
goyette.com
grady.com
hammes.com
herman.com
hermiston.com
hotmail.com
invalid-missingusername.com
invalid.com
nikolaus.biz
pfannerstill.com
rice.com
rohan.org
rowe.com
terry.biz
ullrich.com
ward.com
yahoo.com
EOF
)

# Compare the filtered output to the expected output
if [ "$output" = "$expected_output" ]; then
  echo "Test Passed: Output matches the expected domain names."
  exit 0
else
  echo "Test Failed: Output does not match the expected domain names."
  exit 1
fi
