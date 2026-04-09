### OSI vs TCP/IP Model

| OSI Layer (7) | OSI Layer Name   | TCP/IP Layer (4) | Key Concepts / Protocols |
|--------------|------------------|------------------|--------------------------|
| 7 | Application | Application | HTTP, HTTPS, FTP, SMTP, DNS |
| 6 | Presentation | Application | SSL/TLS, Encryption, Compression |
| 5 | Session | Application | Session Management |
| 4 | Transport | Transport | TCP, UDP |
| 3 | Network | Internet | IP, ICMP, IPSec |
| 2 | Data Link | Network/Link | Ethernet, ARP, VLAN, MAC |
| 1 | Physical | Network/Link | Cables, NIC, Signals |

---

#### Where **IP**, **TCP/UDP**, **HTTP/HTTPS**, **DNS** sit in the stack

|    Protocol  |       Layer      |
|--------------|------------------|
|     IP       |  Internet Layer  |
|  TCP/UDP     |  Transport Layer |
| HTTP,HTTPS,DNS|  Application Layer|

#### One real example: `curl https://example.com` = App layer over TCP over IP

- Layer 7 (Application): curl creates the HTTP request (GET /index.html).
- Layer 6 (Presentation): Encrypts the data with SSL/TLS (Locked box).
- Layer 5 (Session): Adds Session ID to manage the conversation.
- Layer 4 (Transport): Wraps in TCP for reliability.(Break down into packets).
- Layer 3 (Network): Adds IP addressing (Source -> Destination).
- Layer 2 (Data Link): Adds MAC addresses for the local router.
- Layer 1 (Physical): Converts data to electrical signals/radio waves to travel the wire.

- ---

## Hands-on Checklist 
- **Identity:** `hostname -I` (or `ip addr show`)
- Observation: EC2 instance private IP is 172.31.31.198 (internal AWS VPC network).
  ![hostname]()
- 
