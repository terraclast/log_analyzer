#!/usr/bin/env bash

# Log Analyzer for LoA Server
LOGFILE="/var/log/syslog" # Default log to analyze
MODE=""
PATTERN=""

# Function to display menu
function display_menu() {
    echo "Log Analyzer Options:"
    echo "1.  Choose a log file"
    echo "2.  Static Log Analysis"
    echo "3.  Real-Time Log Monitoring"
    echo "4.  Exit"
    echo -n "Choose an option: "
    read MODE
}

# Choose the log file to be read
function log_choice() {
    echo -n "Available Log Files:"
    echo "1. Syslogs"
    echo "2. Apache2 Access logs"
    echo "3. Apache2 Error logs"
    echo "4. Nextcloud logs"
    echo "5. Enter custom log file path"
    echo -n "Select a log file (1-5): "
    read LOG_CHOICE

    case $LOG_CHOICE in 
        1) LOGFILE="/var/log/syslog" 
            ;;
        2) LOGFILE="/var/log/apache2/access.log" 
            ;;
        3) LOGFILE="/var/log/apache2/error.log"
            ;;
        4) LOGFILE="/var/www/nextcloud/data/nextcloud.log"
            ;;
        5) 
            echo -n "Enter the full path of the log file: "
            read CUSTOM_PATH
            if [[ -f "$CUSTOM_PATH" ]]; then
                LOGFILE="$CUSTOM_PATH"
            else
                echo "Error: File not found. Using default."
                LOGFILE="/var/log/syslog"
            fi
            ;;
        *)
            echo "Invalid choice. Using default log file."
            LOGFILE="/var/log/syslog"
            ;;
    esac

    echo "Selected log file: $LOGFILE"
}

# Function for Static Log Analysis
function static_analysis() {
    echo -n "Enter regex pattern to search (leave empty for all logs): "
    read PATTERN

    if [[ -z "$PATTERN" ]]; then
      echo "Displaying all logs from $LOGFILE..."
      cat "$LOGFILE"
    else
        echo "Searching for pattern: $PATTERN in $LOGFILE..."
        grep --color=always -i "$PATTERN" "$LOGFILE"
    fi
}

# Function for Real-Time Log Monitoring
function real_time_monitoring() {
    echo -n "Enter regex pattern to monitor (leave empty for all logs): "
    read PATTERN

    if [[ -z "$PATTERN" ]]; then
        echo -n "Monitoring all logs in real-time from $LOGFILE..."
        tail -f "$LOGFILE"
    else
        echo "Monitoring logs for pattern: $PATTERN in real-time from $LOGFILE..."
        tail -f "$LOGFILE" | grep --color=always -i "$PATTERN"
    fi
}

# Main program loop
while true; do
    display_menu
    case $MODE in 
        1) 
            log_choice
            ;;
        2) 
            static_analysis
            ;;
        3)
            real_time_monitoring
            ;;
        4)
            echo "Exiting Log Analyzer. Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done
