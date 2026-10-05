# Networking and Network Attacks

## 3.1 IPv4
An **IPv4 address** is a unique 32-bit numeric address divided into four 8-bit octets. It is
displayed in dotted decimal notation but stored as a binary number. 
- Ex: IPv4 address 192.168.12.1 is stored as 11000000.10101000.00001100.00000001.

The **loopback address**, also called **localhost**, is an internal address that routes back to the
local device. The IPv4 loopback address is 127.0.0.1.

### Subnet Mask
A **subnet mask** is a 32-bit number used to divide an IP address into a host portion and network
portion. It defines the range of hosts available within the network. The network portion identifies
the network on which the host resides. The host portion identifies the host within the network.

### Classful Addressing
**Classful addressing** is an IPv4 addressing architecture that classifies IP addresses into
__five__ classes. They are class A, B, C, D, E. First four bits of an IPv4 address determines which
of the five classes it belongs to. A, B, C are used for the devices addresses, D is used for
multicasting, and E is for future use. 

- A **Class A address** is an IPv4 address that uses the first 4 bits for network, remaining on host.
- **Class B address** uses first 16 bits for network.
- **Class C address** uses the first 24 bit for network.
- **Class D address** is used for multicasting.
- **Class E address** is used for future use.

### Public and Private IP Addresses
A **public IP address** is an IP address assigned to a host connected to the internet. It is
assigned by an internet service provider (ISP) and is unique for each host. A **private IP address**
is an IP address assigned to a host on a local network. It communicates inside a specific local
network. An **RFC 1918 address** is an IP address assigned inside a private network.

Initially, ISPs assigns companies classful addresses, which leads to potential IPv4 address waste
(the limit of IPv4 addresses is 2^32). Private IP addressing was developed to alleviate this IPv4
address shortage.

When ISPs assigns one IPv4 address to a company, the company assigns a unique private IPv4 to each
device within a network. All communications from a private IP address to an outside network
destination uses a public IP address assigned to the company's network.

---

## 3.2 Networking Devices
### Layer 1 Devices
The OSI model abstraction layers are used to classify a device based on function. They focus more on
networking devices rather than networked devices. A **networking device** is a device used to
establish network connectivity. A **networked device** is a device connected to a network. Ex: a
switch is a networking device, a personal computer is a networked device.

A layer 1 device is a device used to interact with network media in some way. They are not involved
in the encapsulation or decapsulation of data.
- A **hub** is a legacy networking device used as a central node to provide connectivity for
  multiple networked devices
- A **repeater** is a legacy networking device used to regenerate/repeat a signal transmitted on
  network media.
- A **media converter** is a networking device used as an adapter to connect different network
  mediums.
- A **modulator/demodulator (modem)** is a networking device used to convert a digital data signal
  to or from an analog carrier signal.

### Layer 2 Devices
Layer 2 device typically serves as a central node providing connectivity to multiple networked
devices. They include bridges, switches, and wireless access points.

A **bridge** is a legacy networking device used as a central node providing connectivity to two
network segments. They use the MAC address contained in a frame to determine where to transmit
a payload. 

A **switch** is a networking device serving as a central node for at least two other nodes. It
improved on a bridge's capabilities by providing more ports to connect more devices. 

A **wireless access point (WAP)** is a networking device serving as a central node for at least two
other wireless nodes. 

### Layer 3 Devices
A layer 3 device typically serves as a node used to connect an internal network to an external
network. They can be thought as a gateway and includes routers and controllers.

A **router** is a layer 3 networking device connecting at least two networks. A large network is
usually divided into subnetworks, or subnets, to improve performance. A switch cannot communicate
across subnets, so a router is used to connect an internal network to an external network. A
**routing table** is a rule table determining how a router routes a payload based on the
destination's IP address. 

A **layer 3 switch**, or a layer 3 capable switch, is a switch providing both layer 2 and layer 3
functions. It is considered a **multifunction device (MFD)**, which is a single device capable of
providing multiple functions. 

A **wireless LAN controller (WLC)** is a centralized device used to control and configure multiple
managed WAPs.

### Layer 4 Devices
A layer 4 device is used to make forwarding decisions during payload transport. They include load
balancer, voice gateways, firewalls, etc.

**Load balancing** is the act of distributing network traffic among the multiple devices to improve
performance and prevent overload. A **load balancer** is either a hardware device or software
service used to enforce load-balancing configurations.

**Voice over IP (VoIP)** is a protocol group used to enable analog telephone conversations, or
telephony, to occur over the internet. A **voice gateway** is either a hardware device or software
service used to convert telephony into digital packets for transmission via VoIP.

**Intrusion detection system (IDS)** is a device or a software app that detects a malicious activity
or security policy violation in a system. An **intrusion prevention system (IPS)** is an IDS that
blocks a threat to a network.

A **firewall** is a network device of a software program that controls inbound and outbound traffic
based on a set of rules

A **proxy server** is a network device or a software program intended to protect internal nodes by
acting as an intermediary device for external network resources. 

---

## 3.3 SSH, FTPS, and SFTP
### SSH
**Secure shell protocol (SSH)** is a cryptographic network protocol for securely operating a network
service over an insecure network. They provide a secure channel by connecting an SSH client to an
SSH server using a client-server model. It uses TCP port 22 by default.

SSH provides data confidentiality by using encryption and data integrity by using message
authentication codes (MAC). SSH supports **protocol tunneling**, which is the encapsulation of a
protocol's packets within the packets of another protocol. 

SSH can be used for public key authentication to provision access without requiring a user password
for each login. The authentication protocol facilitates automated, password-less logins and single
sign-on. 

### FTPS and SFTP
**FTPS**, also known as **FTP over SSL** or **FTP Secure**, is an extension to the file transfer
protocol (FTP) that uses SSL/TLS to provide communication security. FTPS supports all the SSL/TLS
cryptographic protocols, including the use of client and server certificates for authentication, AES
and 3DES ciphers for encryption, and SHA1 and MD5 hash functions for data integrity. It uses port TCP
989 for the data channel amd TCP port 990 for the control channel.

**SSH file transfer protocol (SFTP)**, also known as **SSH-FTP** or **Secure FTP**, is an extension
of the SSH protocol that enables secure file transfer capabilities between networked hosts. It
provides remote file system management functionality that enables an application to list the
contents of a remote directory, delete a remote file, and resume an interrupted file transfer. It
uses TCP port 22. 

---

## 3.4 DDoS, DNS Poisoning, and Domain Hijacking
### Distributed denial-of-service
A **denial-of-service (DoS)** attack is an attack against a network resource that aims to prevent,
disrupt, or delay authorized users from accessing the network source. A **distributed
denial-of-service (DDoS)** attack is a DoS attack that is simultaneously launched from multiple
systems.

Three types of DDoS attacks:
- **Network-based DDoS attack**, also known as **volume-based DDoS attack**, is a DDoS that aims to
  exhaust the target system's network bandwidth.
- **Protocol-based DDoS attack**, also known as **state exhaustion DDoS attack**, is a DDoS attack
  that aims to exhaust the target system's network resources or the resources of a network
  infrastructure equipment, like the firewall or load balancer. They exploit weaknesses of layer 3
  and layer 5 protocols.
- **Application layer DDoS attack**, also known as an **OSI layer 7 DDoS attack**, is a DDoS attack
  that aims to exhaust specific functions or features of a program.

A DDoS attack may target **operational technology (OT)**, which is the set of hardware devices and
software programs that monitor and control industrial equipment. They are vulnerable to DDoS attaks
because legacy hardware/software are often used in OT.

DDoS attack methods:
- An **amplified DDoS attack** is a DDoS attack method exploiting the response mechanism of certain
  protocols to amplify (increase) traffic volume towards a target.
- A **reflected DDoS attack** is a DDoS attack method exploiting the response mechanism of certain
  protocols to redirect traffic from third-party services towards a target.

### DNS Attacks
**Domain hijacking** is the act of changing the registration information of domain without the
knowledge or consent of the domain owner. It is performed through technical means such as exploiting
a vulnerability in a DNS system.

**URL redirection** is the act of using URL to divert a user to a malicious website. Can be
performed by sending a potential victim a phishing email that contains a link to a malicious website.

**DNS poisoning**, also known as **DNS cache poisoning** or **DNS spoofing**, is an attack that aims
to redirect a user to malicious website by modifying the user's DNS query. Attackers replace an IP
address in a DNS record with the IP address of a computer under the attacker's control.

### DNSSEC
**Domain Name System Security Extensions**, or **DNS Security Extensions** or **DNSSEC**, is a set
of extensions to DNS that provides a DNS resolver cryptographic authentication of DNS data using
digital signatures. It assigns every DNS zone a public-private key pair. A zone owner uses the
zone's private key to digitally sign DNS data in the zone. The DNS resolver uses a zone's public key
to validate the authenticity of DNS data in the zone. If it can validate the digital signature over
the DNS data, then it returns the DNS data to a client. If it cannot validate the digital signature
over the DNS data, the DNS resolver discards the DNS data and returns an error to the DNS client.

The use of digital signatures in DNSSEC improves DNS security in two ways:
- Data origin authentication: A DNS client is assured that DNS data originated from the zone owner.
- Data integrity: A DNS client is assured that DNS data has not been changed in transit.

---

## 3.5 Mail, Web, and Remote Access Protocols
### Mail Protocol
**Simple Mail Transfer Protocol (SMTP)** is a network protocol for sending, receiving, and relaying
outgoing emails. It is an application layer protocol in layer 7 and uses TCP port 25. SMTPS uses
port 587.

Email systems use SMTP to send emails from servers to servers. There are also other email
applications such as Post Office Protocol (POP) and Instant Message Access Protocol (IMAP). HTTP can
also be used in web-based email system. POP is uses in TCP port 110, IMAP is used in TCP port 143,
and HTTP is used in TCP port 80.

### HTTP
**Hyper Text Transfer Protocol (HTTP)** is a network protocol for distributing graphics, audio,
video, text, and hyperlinks on networks. It is an application layer protocol and uses TCP port 80.

HTTP is a protocol that is mostly used for communication between the browser and the World Wide Web
(WWW). The web browser submits an HTTP request message to a server and the server returns a response
message. The server provides content to the web browser or other functions requested by the web browser.

### HTTPS
**Hypertext Transfer Protocol Secure (HTTPS)**, also known as HTTP over SSL or HTTP over TLS, is an
extension of the hypertext transfer protocol that uses SSL/TLS to establish an authenticated and
encrypted connection between a client and a server. It is used for secure data exchange between a
web browser and a web server. It is also an application layer protocol and uses TCP port 443. 

It relies on cryptographic services provided by the SSL/TLS protocol to secure HTTP data. SSL/TLS
uses digital certificates for authentication, encryption for data confidentiality, and message
authentication codes (MACs) for data integrity. HTTPS supports mutual authentication and protects
against a man-in-the-middle and the eavesdropping and tampering of data exchanged between a web
browser and web server.

### FTP
**File Transfer Protocol (FTP)** is a network protocol for transferring files between two network
devices. FTP is an application layer protocol and uses TCP port 20 and 21.

It is a client/server protocol, using a command and data channel for communications. FTP transfers
files between two devices. **Trivial File Transfer Protocol (TFTP)** is a simpler FTP version used
for transferring networking device configurations using port 69. Preboot Execution Environment (PXE)
uses TFTP to download software. 

### FTPS and SFTP
**FTP over SSL**, or **FTP Secure**, is an extension of the file transfer protocol that uses SSL/TLS
to provide communication security. FTPS supports SSL/TLS cryptographic protocols, including the use
of client and server certificates for authentication, AES, and 3DES ciphers for encryption, and SHA1
and MD5 hash functions for data integrity. It supports X.509 self-signed or trusted public key
certificates.

**SSH File Transfer Protocol (SFTP)**, also known as **SSH-FTP** or **Secure FTP**, is an extension
of the SSH protocol that enables secure file transfer capabilities between networked hosts. SFTP
provides remote file system management functionality that enables an application to list the
contents of a remote directory, delete a remote file, and resume an interrupted file transfer. 

Both FTPS and SFTP are used to securely transfer files between networked hosts. FTPS uses SSL/TLS to
create an authenticated and secure communication link between two hosts while SFTP uses SSH protocol
extensions for authentication and encryption of an FTP session between networked hosts. They are not
compatible with each other, which means that an SFTP client cannot connect to an FTPS server and
vice versa.

---

## 3.6 POPS, IMAP, and S/MIME
### Post Office Protocol (POP)
**Post Office Protocol (POP)** is an Internet standard protocol used by email client to retrieve an
email from a mail server. POP does not support the sending of an email. POP3, or POP version 3, is
the latest version of POP. It is an application layer protocol and uses TCP port 110.

A mailbox or folder is created for an email account on a POP server. When an email is received by
POP server, it is saved to the email's recipient's mailbox. The account owner will use a POP client,
like Outlook, to connect to a POP server and download the account owner's email. The email is
usually then removed after the mail has been downloaded by the POP client. 

POP is not a secure protocol because data is transmitted in plain text. **POP Secure**, also known
as **POPS** or **POP3S**, uses SSL/TLS to secure communications between POP client and POP server.
It provides data privacy and integrity, and uses TCP port 995.

### IMAP
**Internet Message Access Protocol (IMAP)** is an Internet standard protocol used by an email client
to retrieve an email from a mail server. **IMAP4** is the fourth and latest version. It is an
application layer protocol and uses TCP port 143.

IMAP allows for the management of a mailbox by multiple email clients. By default, an email remains
on an IMAP server after the email is downloaded by an IMAP client. It is removed from an IMAP server
only if a user explicitly deletes the email on the IMAP server.

IMAP is not a secure protocol because data is sent in plain text. **IMAP Secure** or **IMAPS** uses
SSL/TLS to secure communications between an IMAP client and an IMAP server. IMAPS uses TCP port 993.

### S/MIME
**Multipurpose Internet Mail Extensions (MIME)** is an Internet standard that extends the format of
an email message to support non-ASCII character sets and multimedia attachments.
**Secure/Multipurpose Internet Mail Extensions (S/MIME)** is an Internet standard for signing and
encrypting MIME data. S/MIME provides authentication, integrity, non-repudiation of origin, and
confidentiality security services for electronic messaging applications. 

S/MIME requires an X.509 certificate for each email client. S/MIME can use RSA, DSA, and ECDSA
digital signature algorithms for message signing, and AES and 3DES for message encryption. S/MIME is
a widely accepted protocol for sending a digitally signed and encrypted message. S/MIME is supported
by most email service providers, but the complexities associated with certificate management and
validation have prevented the widespread adoption of the protocol.

---

## 3.7 ARP Poisoning, MAC flooding, and MAC cloning
### Data Link Layer Attacks
The data link layer is subject to three types of attacks:
- **Address resolution protocol poisoning**, also called ARP cache poisoning or ARP spoofing, is an
  attack in which an attack sends spoofed ARP messages on a local area network (LAN) to associate
  the attacker's MAC address with the IP address of a target host on the LAN. The ARP protocol lacks
  authentication, so any device on the LAN can send an ARP message. It enables an attacker to
  receive all the data packets destined for the target host.
- **Media access control flooding** is an attack in which a large number of invalid MAC addresses
  are sent to a network switch with the aim of overwriting the switch's MAC table. A **MAC table**
  is a table that maps each network device's MAC address to a physical port on a switch. It has
  limited storage, so a MAC flooding attack causes a switch to overwrite legitimate MAC table
  entries with invalid MAC addresses. When a switch receives a packet whose destination MAC address
  is not present in the switch's MAC table, the switch performs **unicast flooding**, which is a
  switch's broadcast of a packet on all the switch's ports, allowing attacker to gain access data
  packets inside a LAN.
- **MAC Cloning**, also known as **MAC spoofing**, is the act of changing the factory-assigned MAC
  address of a network device. MAC address can be changed by a software program without modifying
  device hardware. MAC cloning enables an attacker to bypass a MAC address-based restricted network
  or authentication system and hide a rogue device on a network.

---

## 3.8 On-Path Attacks: Man-in-the-Middle and Man-in-the-Browser
### MITM 
A **Man-in-the-middle** attack is an attack in which an attacker eavesdrops or modifies the
communications between two parties. It operates at the network (layer 3) layer. In an MITM attack,
both parties are in communication with an attacker but each party believes that they are
communicating directly with the other party. 

In a typical MITM attack, an attacker intercepts a message in transit, modifies the message, and
sends the modified message to the recipient. The attacker will impersonate one or both of the two
communicating parties. Data communication over a **secure channel**, which is a communication
channel that guarantees data authenticity and data confidentiality, prevents an MITM attack.

### MITB
A **Man-in-the-Browser** attack is a type of MITM attack that uses malware to intercept or modify
messages exchanged between a web browser and a web server. It operates in the application layer. It
is often used to steal financial information by modifying a user's communications with an Internet
banking website.

In an MITB attack, a web browser vulnerability is exploited by a Trojan horse through a browser
extension or user script. It will modify the user's input on a specific HTML form before sending the
HTML form data to the targeted website. The extension can also selectively modifies data returned
from the targeted website before presenting the data to the user.

A MITB attack is difficult to remove because malware is embedded in an extension and may not be
detected by anti-malware software. Since a malware-infected extension also provides added browser
functionality and only activates when a user visits a targeted website, the malware may remain
undetected on a system for an extended period.
