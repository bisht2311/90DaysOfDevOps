🚀 Day 07/90 – hashtag#90DaysOfDevOps

Today I explored the Linux File System Hierarchy and practiced real-world troubleshooting scenarios. Understanding the Linux file structure is essential because everything in Linux is organized in a logical, directory-based format.

🔹 Key directories
 • / – Root directory, starting point of the system
 • /home – User personal directories
 • /root – Home directory of the root user
 • /etc – System-wide configuration files
 • /var/log – Log files for monitoring & troubleshooting
 • /tmp – Temporary files used by system & applications

🔹 Additional important directories
 • /bin – Essential system binaries
 • /usr/bin – User-level command binaries
 • /opt – Third-party application installations

🔹 Scenario Practice:
 ✔ Service not starting → systemctl status nginx → journalctl -u nginx -n 10
 ✔ High CPU usage → top → htop → ps aux --sort=-%cpu | head -n 10
 ✔ Service logs → systemctl status docker → journalctl -u docker | tail -n 10
 ✔ Permission denied → ls -l → chmod 764 monitoring.sh → ./monitoring.sh
