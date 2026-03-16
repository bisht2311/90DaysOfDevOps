Process Commands:
1. ps: gives the active running processes.
2. ps -aux: gives the list of all the active running processes or threads with detail.
3. ps -p PID: filter out the process corresponding to the given PID.
4. pgrep <process_name>: find the PID of the given process.

System Commands:
1. systemctl status <service_name>: used to check the current status of a service
2. systemctl start <service_name>: used to start the specified servce.
3. systemctl stop <service_name>: used to stop the service.
4. systemctl enable <service_name>: enable service at boot.
5. systemctl disable <service_name>: disable service at boot.
6. systemctl list-units --type=service: list running services.

Log Commands:
1. journalctl -u <service_name>: shows logs for a specific service.
2. tail -n 50 /var/logs/syslog: shows the last 50 log entries from the system log file.
3. tail -n 50 /var/log/auth.log: shows the last 50 log entries from the authentication log file.
4. tail -n 50 /var/log/kern.log: shows the last 50 log entries from the kernal log file.
