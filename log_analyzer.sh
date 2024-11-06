#!/bin/bash

# Define the path to the log file
LOG_FILE="C:\Users\suraj dev yadav\Desktop\LogFileAnalyzer\access.log"  # Replace <your_username> with your WSL username

# Check if the log file exists
if [[ ! -f "$LOG_FILE" ]]; then
  echo "Log file not found at $LOG_FILE"
  exit 1
fi

# Display report header
echo "Log File Analysis Report for $LOG_FILE"
echo "-----------------------------------------"

# Task 1: Count the number of 404 errors
echo "404 Errors Count:"
grep "404" "$LOG_FILE" | wc -l

# Task 2: Find the most requested pages
echo -e "\nMost Requested Pages:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -10

# Task 3: Find the IP addresses with the most requests
echo -e "\nTop 10 IP Addresses by Request Count:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -10

