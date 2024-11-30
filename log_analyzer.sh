#!/usr/bin/env bash

# a simple log analyzer
# Usage: ./log_analyzer.sh /path/to/logs.log

LOGFILE=$1
echo "$LOGFILE" 

# Check if file exists
if [[ ! -f "$LOGFILE" ]]; then
    echo 'Log file not found!'
    exit 1
fi

# Pattern searching
echo "Analyzing log file: $LOGFILE"
echo '----------------------------'

# Count occurances of 'ERROR' and 'WARNING'
ERROR_COUNT=$(grep -c 'ERROR' "$LOGFILE")
WARNING_COUNT=$(grep -c "WARNING" "$LOGFILE")
FAIL_COUNT=$(grep -c "FAIL" "$LOGFILE")
SDA_COUNT=$(grep -c "SDA" "$LOGFILE")

echo "Total ERRORs: $ERROR_COUNT"
echo "Total WARNINGs: $WARNING_COUNT"
echo "Total FAILs: $FAIL_COUNT"
echo "Total SDA logs: $SDA_COUNT"

# Display the last 5 'ERROR' lines for review
echo -e "\nRecent ERRORs:"
grep "ERROR" "$LOGFILE" | tail -n 5

# Display the last 5 'WARNING' lines for review
echo -e "\nRecent WARNINGs:"
grep "WARNING" "$LOGFILE" | tail -n 5

# Display the last five 'FAIL' lines for review
echo -e "\nRecent FAILs:"
grep "FAIL" "$LOGFILE" | tail -n 5

# Display the last five "SDA" lines for review
echo -e "\nRecent SDA activity:"
grep "SDA" "$LOGFILE" | tail -n 5
