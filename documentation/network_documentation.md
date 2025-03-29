# **Network Documentation for Linux Administration & Automation Project**

## **1. Network Topology Diagram** 

```
+------------+         +------------+
|  Admin VM  |  <--->  | Target VM  |
| 192.168.1.100 |      | 192.168.1.101 |
+------------+         +------------+
```

---

## **2. IP Addressing Scheme**
| Device        | Role             | IP Address     | Subnet Mask    | Gateway        |
|--------------|-----------------|---------------|---------------|---------------|
| Admin Server | Management       | 192.168.1.100 | 255.255.255.0 | 192.168.1.1   |
| Target Server| Managed Machine  | 192.168.1.101 | 255.255.255.0 | 192.168.1.1   |

---

## **3. Firewall Rule Explanations**
### **Implemented Firewall Rules (Using `ufw`)**
| Rule # | Protocol | Source IP     | Destination IP | Port(s) | Action  | Reason |
|--------|----------|--------------|---------------|--------|--------|--------|
| 1      | TCP      | Any          | 192.168.1.100 | 22     | Allow  | SSH access to Admin |
| 2      | TCP      | 192.168.1.100 | 192.168.1.101 | 22     | Allow  | SSH access from Admin to Target |
| 3      | ICMP     | Any          | Any           | -      | Allow  | Allow ping for troubleshooting |
| 4      | TCP      | Any          | 192.168.1.101 | 80,443 | Allow  | Web server traffic |

### **UFW Commands to Apply Rules**
```bash
sudo ufw allow from 192.168.1.100 to 192.168.1.101 port 22
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow icmp
sudo ufw enable
```
---

## **4. Service Ports in Use**
| Service         | Port | Protocol | Purpose |
|----------------|------|----------|---------|
| SSH           | 22   | TCP      | Remote access |
| Web Server    | 80   | TCP      | HTTP traffic |
| Secure Web    | 443  | TCP      | HTTPS traffic |
| Ping (ICMP)   | -    | ICMP     | Network diagnostics |

