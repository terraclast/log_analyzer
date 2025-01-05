# Log Analyzer Script

## Overview
The Log Analyzer is a versatile Bash script designed for analyzing log files on a Linux system. It provides static analysis, real-time monitoring, and customizable log file selection, making it an essential tool for troubleshooting and monitoring server activity. The script can handle various log files, including system logs, application logs, and custom log files.

## Features
1. **Log File Selection**: Choose from predefined log files (e.g., syslog, Apache logs, Nextcloud logs) or specify a custom log file path.
2. **Static Log Analysis**: Search for specific patterns in the log file using regular expressions.
3. **Real-Time Log Monitoring**: Monitor log files in real-time with optional filtering by regex patterns.
4. **User-Friendly Menu**: Interactive menu for selecting options and managing logs.

## Prerequisites
- Bash (default on most Linux systems)
- Access to log files (e.g., `/var/log/`)
- Optional: Tools like `grep`, `tail`, and `cat` (standard on Linux)

## Installation
1. Save the script to your desired location:
   ```bash
   nano log_analyzer.sh
   ```
2. Copy and paste the script into the file.
3. Make the script executable:
   ```bash
   chmod +x log_analyzer.sh
   ```

## Usage
Run the script:
```bash
./log_analyzer.sh
```

### Menu Options
1. **Choose Log File**: Select a predefined log file or enter a custom log file path.
   - Predefined options include:
     - `/var/log/syslog`
     - `/var/log/apache2/access.log`
     - `/var/log/apache2/error.log`
     - `/var/www/nextcloud/data/nextcloud.log`
   - If a custom path is provided, the script validates the file's existence before proceeding.

2. **Static Log Analysis**:
   - Search for patterns in the selected log file.
   - Enter a regex pattern or leave empty to display the entire log.

3. **Real-Time Log Monitoring**:
   - Monitor log entries as they are appended to the file.
   - Enter a regex pattern to filter log entries in real-time or leave empty to view all entries.

4. **Exit**: Exit the script.

## Example Scenarios
1. **View Apache Error Logs**:
   - Select `/var/log/apache2/error.log` from the menu.
   - Use static analysis to search for `500` errors.

2. **Monitor Nextcloud Logs in Real-Time**:
   - Select `/var/www/nextcloud/data/nextcloud.log`.
   - Monitor for specific patterns like `DELETE` or `ERROR`.

3. **Analyze Custom Logs**:
   - Enter a custom path (e.g., `/home/user/custom.log`).
   - Search for patterns like `failed` or `timeout`.

## Troubleshooting
1. **Permission Denied**:
   - Ensure the script has execute permissions (`chmod +x log_analyzer.sh`).
   - Verify you have read access to the selected log files.

2. **Invalid Log File**:
   - Check if the file path is correct and the file exists.

3. **No Results for Regex**:
   - Verify the correctness of your regex pattern.
   - Check if the log file contains matching entries.

## Known Limitations
- Real-time monitoring (`tail -f`) requires the log file to grow continuously.
- The script assumes log files are in plain text format.

## Future Enhancements
- **Email Notifications**: Alert users for critical log events.
- **Graphical Visualization**: Export data to tools like Grafana or generate charts.
- **Archiving and Cleanup**: Automate log rotation and cleanup.

## License
This script is released under the MIT License.

---

For questions or feedback, feel free to reach out!


