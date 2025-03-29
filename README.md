# **Linux Administration & Automation**

## **Project Overview**

This project aims to automate common Linux administration tasks, system monitoring, and security hardening using bash scripts. The goal is to create a robust, scalable, and repeatable process for managing Linux servers, ensuring both security and performance monitoring are always active and reliable. The automation includes:

- **System Inventory**: Collects hardware information such as CPU, memory, disk space, and installed services.
- **Network Monitoring**: Monitors network connections, bandwidth usage, and logs network-related issues.
- **Backup Management**: Automates the process of creating regular backups and maintains a rotation policy.
- **System Updates**: Ensures the system is up-to-date by checking and installing updates regularly.
- **Security Hardening**: Implements security measures to harden the system, including configuring SSH and disabling unnecessary services.
  
Additionally, the project sets up cron jobs to automate the execution of these tasks and logs their activities for later review.

---

## **Features**

- **Automation of Linux Server Tasks**: Automates system inventory gathering, network monitoring, backup creation, and system updates.
- **Security Best Practices**: Includes scripts for system hardening, SSH security, and security auditing.
- **Centralized Logging**: Logs all script outputs and errors to centralized log files for easy auditing and troubleshooting.
- **Cron Jobs**: Automatically runs scripts based on a scheduled time.
- **Comprehensive Daily Report**: Generates and logs a daily system health report.
  
---

## **Project Structure**

```bash
linux-admin-automation/
├── scripts/               # Automation scripts
│   ├── system_inventory.sh     # Gathers system info (CPU, memory, disk)
│   ├── network_monitor.sh      # Monitors network activity and logs it
│   ├── backup_manager.sh       # Automates backups with rotation policy
│   ├── system_updates.sh       # Checks and installs system updates
│   ├── daily_report.sh         # Generates daily system report
├── documentation/          # Project documentation
│   └── network_diagram.md   # Network topology and details
├── logs/                   # Log files
│   └── system_inventory.log
│   └── network_monitor.log
│   └── daily_report.log
├── config/                 # Configuration files
│   └── ssh_config
│   └── backup_config
├── README.md               # Project documentation
```

---

## **Getting Started**

### **Prerequisites**

Before running the scripts, ensure that you have the following installed:

- **Linux OS (Ubuntu/Debian)**  
  The scripts are designed to work with most Linux distributions, but they have been tested on Ubuntu/Debian-based systems.
  
- **Bash**  
  The scripts are written in Bash and require Bash to be available in the system’s `$PATH`.
  
- **Cron**  
  For scheduling the execution of scripts, cron must be installed and configured on your system.

### **Clone the Repository**

To get started, clone this repository to your machine:
```bash
git clone https://github.com/Ebube101/linux-admin-automation.git
cd linux-admin-automation
```

### **Make Scripts Executable**

Change the permissions of the scripts so that they can be executed:
```bash
chmod +x scripts/*.sh
```

---

## **Running the Scripts**

### **System Inventory Script**

This script collects hardware information about your system such as CPU, memory, and disk usage.

```bash
bash scripts/system_inventory.sh
```

### **Network Monitoring Script**

The network monitoring script tracks active network connections, logs unusual activity, and checks the health of network interfaces.

```bash
bash scripts/network_monitor.sh
```

### **Backup Management Script**

This script creates backups of important directories and files, ensuring that backups are maintained and rotated regularly.

```bash
bash scripts/backup_manager.sh
```

### **System Updates Script**

This script checks for available updates and installs them to keep the system secure.

```bash
bash scripts/system_updates.sh
```

### **Daily Report Script**

This script generates a daily system health report, including system uptime, disk usage, memory usage, failed login attempts, and package update status.

```bash
bash scripts/daily_report.sh
```

---

## **Automating Tasks with Cron**

For continuous automation, add the scripts to your cron jobs to run periodically.

### **System Inventory (Weekly)**

To run the system inventory script weekly:
```bash
crontab -e
```
Add:
```bash
0 0 * * 0 /path/to/system_inventory.sh >> /var/log/system_inventory.log 2>&1
```

### **Network Monitoring (Hourly)**

To run the network monitoring script every hour:
```bash
crontab -e
```
Add:
```bash
0 * * * * /path/to/network_monitor.sh >> /var/log/network_monitor.log 2>&1
```

### **Backup Management (Daily)**

To back up your important directories every day:
```bash
crontab -e
```
Add:
```bash
0 2 * * * /path/to/backup_manager.sh >> /var/log/backup_manager.log 2>&1
```

### **System Updates (Daily)**

To check and install system updates every day:
```bash
crontab -e
```
Add:
```bash
0 4 * * * /path/to/system_updates.sh >> /var/log/system_updates.log 2>&1
```

### **Daily Report (Daily)**

To generate a daily report:
```bash
crontab -e
```
Add:
```bash
0 6 * * * /path/to/daily_report.sh >> /var/log/daily_report.log 2>&1
```

---

## **Network Documentation**

You can find the network topology and configurations in the `documentation` folder. This includes:

- **Network Topology Diagram**  
  A visual diagram showing how the different systems are connected.

- **IP Addressing Scheme**  
  The IP addresses assigned to the systems involved in the project.

- **Firewall Rules**  
  A list of firewall rules used for securing the network, with an explanation of each rule.

- **Service Ports**  
  A list of ports and services in use, including SSH, HTTP, and others.

---

## **Logging**

Each script logs its output to files in the `/var/log` directory. These logs can be reviewed for troubleshooting, auditing, or ensuring that the tasks were completed successfully.

---

## **Security**

The scripts include security hardening measures such as:

- **SSH Key-Based Authentication**  
  For secure logins, SSH key pairs are used instead of passwords.

- **Disabling Unnecessary Services**  
  Services that are not needed are disabled to reduce attack surfaces.

- **Firewall Configuration**  
  Basic firewall rules are implemented to secure the servers from unwanted traffic.

---

## **Contributing**

Feel free to fork the repository and submit pull requests with improvements or bug fixes. Please follow the existing code style and ensure that all scripts are well-commented.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## **Contact**

If you have any questions or suggestions, feel free to contact me at [Ebube101](https://github.com/Ebube101) or open an issue in the GitHub repository.

---

### **Changelog**

- **v1.0** - Initial release with automation scripts for system inventory, network monitoring, and backup management.
- **v1.1** - Added daily report script and cron job configurations.
- **v1.2** - Improved logging and error handling in all scripts.

