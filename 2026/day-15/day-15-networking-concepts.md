### 2. DNS Record Types

| Record Type | Purpose | Example |
| ----------- | ------- | ------- |
| A           | Maps a domain to an IPv4 address | `google.com → 142.250.190.14` |
| AAAA        | Maps a domain to an IPv6 address | `google.com → 2001:4860:4860:0:0:0:0:8888` |
| CNAME       | Alias pointing one domain to another | `www.example.com → example.com` |
| MX          | Specifies mail servers for the domain | `example.com → mail.example.com` |
| NS          | Lists authoritative DNS servers for the domain | `example.com → ns1.example.com, ns2.example.com` |

### 3. Using `dig`
- Command: `dig google.com`  
- Second column shows **TTL** (Time to Live, in seconds). 141 → cache IP for 141 seconds.  
- Last column shows the actual IPv4 addresses (A Records).
  ![dns_hostnames]()

---

