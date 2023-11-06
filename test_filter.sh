#!/bin/bash

# Define the location of the filter script
filter_script="./1-filter.sh"

# Run the script to filter and display email addresses
output=$($filter_script)

# Define the expected email addresses in an array
expected_emails=(
  "kathryne92@gmail.com"
  "tom.oberbrunner@gmail.com"
  "imann@gmail.com"
  "fshields@gmail.com"
  "christine.armstrong@gmail.com"
  "vicky.carter@gmail.com"
  "velva.boyle@gmail.com"
  "jalyn13@gmail.com"
)

# Array to store unexpected emails
unexpected_emails=()

# Flag to track if all expected emails are found
all_expected_found=true

# Check if each email address in the script's output is expected
IFS=$'\n'
for line in $output; do
  found=false
  for email in "${expected_emails[@]}"; do
    if echo "$line" | grep -q "$email"; then
      found=true
      break
    fi
  done
  if [ "$found" = false ]; then
    unexpected_emails+=("$line")
    all_expected_found=false
  fi
done

# If any unexpected emails were found, consider the test failed
if [ "$all_expected_found" = false ]; then
  echo "Test Failed: Unexpected email(s) found in the output:"
  for email in "${unexpected_emails[@]}"; do
    echo "$email"
  done
  exit 1
else
  echo "Test Passed: All expected email addresses found in the output."
  exit 0
fi