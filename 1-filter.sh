#!/bin/bash

# Define the input file
input_file="email_list.txt"

# Use grep to filter and display email addresses ending with "@gmail.com" (you must use a regular expression for this)
grep -E '\b[A-Za-z0-9._%+-]+@gmail\.com\b' "$input_file"
