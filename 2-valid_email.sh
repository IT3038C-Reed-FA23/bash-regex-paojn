#!/bin/bash

# Define the input file
input_file="email_list.txt"

# Write a regular expression to match valid email addresses.
# An email consists of these parts: username, @ symbol, domain name, top-level domain (TLD) (e.x. user@domain.tld)
# Email rules:
  # 1. Username consists of alphanumeric characters, ., _, %, +, and -
  # 2. Usernames cannot start or end with a special character (. _ % + -)
  # 3. Domain name consists of alphanumeric characters, ., and -
  # 4. Domain name cannot start or end with a special character (. -)
  # 5. TLD consists of lowercase alphabetic characters and has a length of 2 or more
  # 6. The @ symbol separates the username and the domain name
  # 7. The . separates the domain name and the top-level domain (TLD)
  # 8. The regular expression should match the entire email address
email_regex=
# use grep to filter and display valid email addresses using the $email_regex variable
valid_email_count=
# use grep to filter and display invalid email addresses using the $email_regex variable
invalid_emails=

echo "Number of valid email addresses: $valid_email_count"
echo "Invalid email addresses: "
echo "$invalid_emails"
