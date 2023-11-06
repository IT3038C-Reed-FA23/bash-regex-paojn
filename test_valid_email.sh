#!/bin/bash

# Define the location of the filter script
filter_script="./2-valid_email.sh"

# Run the script to validate email addresses and capture the output
output=$($filter_script)

# Define an array of the expected invalid email addresses
expected_invalid_emails=(
  "@invalid-missingusername.com"
  "invalid.email@invalid"
  "foo@.invalid.com"
  "invalid@-hyphen-start.com"
  "heber74.@rohan.org"
  "12345"
  "invalid@underscore_in_domain.com"
  "user@spaces in domain.com"
  "user@.incomplete"
  "user@invalid@com"
  "invalid.com"
  ".@invalid.com"
)

# Initialize an array to store unexpected invalid emails
unexpected_invalid_emails=()

# Check if each expected invalid email address is present in the output
for email in "${expected_invalid_emails[@]}"; do
  if ! echo "$output" | grep -q "$email"; then
    echo "Test Failed: Expected invalid email '$email' not found in the output."
  fi
done

# Iterate through the emails in the output and check if they are unexpected
IFS=$'\n'
for line in $(echo "$output" | grep -oE '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[a-z]{2,}'); do
  found=false
  for email in "${expected_invalid_emails[@]}"; do
    if [ "$line" = "$email" ]; then
      found=true
      break
    fi
  done
  if [ "$found" = false ]; then
    unexpected_invalid_emails+=("$line")
  fi
done

# Define the expected count of valid emails
expected_valid_email_count=38

# Count the valid email addresses in the output
actual_valid_email_count=$(echo "$output" | grep -o "Number of valid email addresses: [0-9]\+" | grep -o "[0-9]\+")

# Check if there are any unexpected invalid emails
if [ "${#unexpected_invalid_emails[@]}" -gt 0 ]; then
  echo "Test Failed: Unexpected valid email(s) found in the output:"
  for email in "${unexpected_invalid_emails[@]}"; do
    echo "$email"
  done

  if [ "$actual_valid_email_count" -eq "$expected_valid_email_count" ]; then
    echo "Test Passed: Valid email count is $actual_valid_email_count as expected."
    exit 0
  else
    echo "Test Failed: Valid email count is $actual_valid_email_count, but it should be $expected_valid_email_count."
    exit 1
  fi
  exit 1
fi

# Check if the count of valid email addresses matches the expected count
if [ "$actual_valid_email_count" -eq "$expected_valid_email_count" ]; then
  echo "Test Passed: Valid email count is $actual_valid_email_count as expected."
  exit 0
else
  echo "Test Failed: Valid email count is $actual_valid_email_count, but it should be $expected_valid_email_count."
  exit 1
fi
