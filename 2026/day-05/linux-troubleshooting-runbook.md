🚀 Day 05/90 #90DaysofDevOps | Linux Pre‑Checks

Dived into some real server issues and focused on the pre‑checks part.

🔧 High I/O wait, CPU, or Memory
Spot I/O spikes with sar :- sar -d 1 1 | sar -u 1 1 | sar -r 1 1
Identify heavy processes with top/htop
Check memory usage with free -h and highlight top CPU/memory consumers.

📂 Filesystem Utilization
Verify disk usage with df -h
Drill down with du for directory usage

🔐 SSH Service Issues
Confirm service status with systemctl
Review logs with journalctl for errors -- journalctl -u ssh | tail -n 10
var log:- tail -n 10 /var/log/auth.log

If ssh is not working:
1. review the status of ssh.
2. check for the port 22 is in listening state or not by ss -tulnp | grep 22
3. view the log: journalctl -u ssh | tail -n 10 and tail -n 10 /var/log/auth.log
4. restart the service by sudo systemctl restart ssh
