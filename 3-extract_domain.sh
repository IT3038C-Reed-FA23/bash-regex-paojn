#!/bin/bash

# Define the input file
input_file="email_list.txt"

# Use sed to extract and display domain names
DOMAINS=$(sed -n 's/.*@\(.*\)/\1/p' "$input_file")

# Sort the domain list and display only unique domain names
sorted_domains=$(echo "$DOMAINS" | tr '[:upper:]' '[:lower:]' | sort | uniq)
echo "$sorted_domains"
echo "$DOMAINS"
