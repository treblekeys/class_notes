# The Fundamentals of Networking

## 2.1 - OSI Model Layers

### Layers 5, 6, and 7
The OSI model follows a top-down approach because encapsulation constructs a payload and
decapsulation deconstructs a payload. Commonly divided into upper level layers and lower level
layers. The upper level layers 5, 6, and 7 focus on applications and do not create a PDU because a
receiving user's application presents data in a desired format. 
The upper layers include:
- **Layer 7** is the OSI model application layer, where a network protocol interacts with a
  network-aware application
- **Layer 6** is the OSI model presentation layer, where data is prepared for transmission between
  the application layer and session layer.
- **Layer 5** is the OSI model session layer, where data transmission channel known as a session is
  established between communicating devices.

### Layers 4
This is one of the OSI model's lower level layers. The lower level layers focus on data transport.
Layer 4 is the OSI model transport layer, where data from the upper level layers is divided into
smaller-sized blocks of data for faster transmission. 
Two network protocols are referenced by Layer 4:
- **Transmission control protocol (TCP)** is a network protocol used to establish a guaranteed,
  connection-oriented communication channel between communicating devices. 
- **User datagram protocol (UDP)** is a network protocol used to provide non-guaranteed,
  connectionless data transport for communicating devices. 

The PDU created by Layer 4 depends on whether TCP or UDP is used for data transport:
- A **segment** is the PDU created by TCP, and includes a TCP header consisting of connection state
  information known as a **TCP flag**.
- A **datagram** is the PDU created by the UDP, and includes a UDP header. 

### Layer 3
Layer 3 is the OSI model network layer, where data receives logical address information needed to
reach the recipient's network. **Internet protocol (IP)** is the network protocol used to address
data sent over the internet or another network. A **packet** is the PDU created by the IP, and
includes an IP header consisting of logical address information.

A packet needs to know the route/path to reach the final destination because not every network is
directly connected. A packet can take one of many routes to a different network and should take the
most efficient route. A **router** is a layer 3 networking device connecting at least two networks.
A **routing protocol** is a network protocol used by a router to determine the mos efficient route
to a destination network.

### Layer 2
Layer 2 is the OSI model data link layer, where data is transmitted to the recipient node. A
**frame** is the PDU created by layer 2 containing data transmission parameters and physical
address. 
Two sublayers are used to construct a frame:
- **Logical link control (LLC)** is a layer 2 sublayer providing data flow control, error detection,
  and error correction.
- **Media access control (MAC)** is a layer 2 sublayer providing physical address and frame
  synchronization.

A **switch** is a layer 2 networking device serving as a central node for at least two other nodes.

### Layer 1
Layer 1 is the lowest lower level layer and is the OSI model physical layer, where a payload is
transmitted across a network medium. A bounded media network uses a physical cable type at layer 1.
The physical cabling transmit a payload as a series of electrical or light pulses. An unbounded
media network uses a wireless signal at layer 1. The wireless signal transmit a payload using a
series of **radio waves**, which is an artificially generated energy that radiates electrical
current into open space. 

A PDU is not created at layer 1. It is where a payload is transmitted as a series of binary numbers
on the network medium.

---

## 2.2 MAC Address
A **media access control (MAC) address** is a unique 48-bit number identifier burned into a network
interface controller. 
A MAC address has two parts:
- An **organizationally unique identifier (OUI)** is a 24-bit number uniquely identifying a
  particular piece of networking equipment from a manufacturer. It is the same for a specific model
  of network controller from a specific manufacturer, but unique between different models. It is the
  first six digits of the MAC address.
- A **device ID**, also known as a **vendor assigned identifier**, is a 24-bit number concatenated
  to the OUI to produce the full MAC address. A device ID is controlled by the manufacturer and can
  be compared to a serial number. Each specific network interface controller is assigned a unique
  device ID, producing a unique MAC address for a network interface controller. A device ID is the
  last six digits of the MAC address.

A MAC address is burned into the network interface controller by the manufacturer and typically
represented as six groups of two hexadecimal digits separated by hyphens or colons or neither. It is
not routable, but a switch uses MAC tables to alleviate traffic and congestion on a local network.

MAC address is mainly used for forwarding data frames between devices on a local network. A **MAC
address table**, or **MAC table**, is a table that maps each network device's MAC address to a
switch's physical port. It contains a VLAN number, MAC address, connection type, and the switch port
number the device is connected to.
The connection could be static, meaning it is manually entered into a MAC table. It can also be
dynamic, which is when it is learned by the switch from the source MAC address of a data frame.

---

## 2.3 Types of Network Addresses
There are three types of network addresses:
- A **physical address**, or **MAC address**, is a unique 48-bit number burned into a network
  interface controller. It identifies a device on the network.
- A **logical address**, or **IP address**, is a 32-bit or 128-bit number assigned to a network
  interface controller. It identifies a device's network connection.
- A **port address** is a 16-bit unsigned number that uniquely identifies a network application or
  service on a host. 

### Port Address
Network connections start and end with a port address. Each port has a specific process or service
that allows a device to recognize different kinds of traffic. IP address allows data to travel to a
specific device, port address allows data to be processed by the corresponding service.

Each service/process follow a set of protocols. A **network protocol** is a set of rules telling you
how data is formatted, processed, and transmitted between devices on a network. It allows devices
with different architecture and operating systems to communicate with one another.

### Port Address Numbers
Port address is 16-bit unsigned number between 0 and 65,535. Three types exist:
- A **well-known port**, also known as **privileged port** or **reserved port**, is a port number
  between 0 and 1,023 that is reserved for commonly used services, such as Hypertext Transfer
  Protocol (HTTP).
- A **registered port** is a port number between 1,024 and 49,151 that is registered with the
  Internet Assigned Number Authority (IANA) for a specific use, like Windows Remote Desktop Protocol
  (RDP).
- An **ephemeral port**, also known as **private port, higher number port**, or **dynamic port**, is
  a port number between 49,152 and 65,535 and is dynamically assigned and used short-term by an application.

---

## 2.4 DNS
A **domain name** is a unique name identifying an internet source. A **domain name system (DNS)** is
a hierarchical, distributed naming system containing information elements for network resources.
Commonly, DNS translate domain names to IP addresses, allowing users to connect to the website's
server resources. Ex: www.mycompany.com => 115.25.10.220

**Domain namespace** is the organized hierarchy of DNS administrative domains throughout the world.
A **DNS zone** is a segment of the domain namespace which is assigned to a legal entity.
A standard DNS deployment can be secured by deploying DNS with an encryption protocol. The options are:
- **DNS over TLS (DoT)** sends TLS protocol encrypted queries attached to the UDP protocol.
- **DNS over HTTPS (DoH)** sends encrypted queries or requests by HTTP or HTTP/2 protocols.

### URL Structure
DNS defines a domain namespace, which specifies top-level domains, second-level domains, and
lower-level domains (subdomains). Each level can be a DNS zone.

**Root domain** is the highest internet hierarchical level. 
**Uniform resource locator (URL)** is also known as **web address** and it specifies the location of
an internet's web reference.
**Hostname** is a domain name with at least one associated IP address. 
**Fully qualified domain name (FQDN)** is a domain name specifying the exact location in the DNS
tree hierarchy.
**Top-level domain (TLD)** is the domain name's right-most label.
**Second-level domain (SLD)** is the subdomain TLD left label.
**Subdomain** is an additional domain's hostname.

### Namespace Database and RR
A DNS system organizes information in a distributed database format for reliability and efficiency.
These databases are called namespace databases and they are stored in text files called DNS zone files.

DNS zone files contain resource records (RR) containing zone information. A **DNS resource record
(RR)** is a unit of information entry in DNS zone files and contains specific information on each zone. 
The fields associated with a DNS resource record are:
- Name: specifies the DNS name
- Time to Live (TTL): the time for any changes to the DNS record to go in effect
- Address class: defines the RR protocol family
- Type: defines the type of this resource record
- Data length: data length in octets
- Data: information in this field is dependent on the record type

---

## DHCP
A networked device requires an IP address and network configuration parameters. They can be set
manually or automatically. **Dynamic host configuration protocol (DHCP)** is a network management
protocol used for automating the assignment of an IP address and network configuration parameters to
devices on an IP network.

The components are:
- **DHCP scope** is an IP address range and network configuration parameters a DHCP server makes
  available to a DHCP client.
- **DHCP server** is a server configured to distribute a DHCP scope to a SHCP client.
- **DHCP client** is any device configured to receive a DHCP scope from a DHCP server.

### DHCP Scope
It defines a range of IP addresses, sometimes called an address pool, along with network
configuration parameters that are assigned to clients on a subnet. During the DHCP process, a client
is leased an IP address and its associated configuration parameters from that scope.

Example: home network client lease and network configuration parameters:
- Leased IP address of 192.168.100.10 from an IP address pool of 192.168.100.200.
- A subnet mask of 255.255.255.0
- A lease duration defining how long the IP address assignment is valid, called **DHCP lease**.
- A DHCP server IP address of 192.168.100.2
- A default gateway IP address of 192.168.100.1
- A DNS server IP address of 8.8.8.8

An IP address range can be excluded from DHCP allocation for various reasons. One example is a
network's default gateway IP address should not be allocated to any other device. A **DHCP exclusion
range** is an IP address range a DHCP server cannot use for DHCP client requests. 

### DHCP Allocation
A DHCP server allocates IP addresses and network configuration parameters using two methods:
- **Dynamic allocation** is a DHCP method used to automatically assign a DHCP scope to a DHCP client.
- **DHCP lease reservation** is a DHCP method used to assign a DHCP scope to a DHCP client based on
  the DHCP client's MAC address.

A DHCP server allocates a DHCP scope to a DHCP client for the time specified in a DHCP lease.
Default lease time is 24 hours. A DHCP client can renew a DHCP lease before the DHCP scope is
returned for future use. 

**Automatic Private IP Addressing (APIPA)** is a Windows feature providing DHCP autoconfiguration
addressing when a DHCP server is unavailable. APIPA assigns a client an IP address from the IP
address pool 169.254.0.0 to 169.254.255.255.

### DHCP Table and Static IP Assignments
Under certain conditions, a static address is beneficial for network devices. A static default
gateway address is usually assigned to a router to provide the DHCP server to hand out the default
gateway address to DHCP clients. It can be hard coded in the network device or a DHCP reservation
can be used. 
**IP Address Management (IPAM)** is the administration tool used to manage DNS and DHCP changes.
IPAM plans, tracks, and manages the network Internet Protocol address space. 

---

## Common Protocols
Three common types of protocols are:
- **Management protocol** defines the policies to monitor, manage, and maintain the network.
- **Communication protocol** defines the data communication's format and rules.
- **Security protocol** defines how to secure data transmission.

### NMP and SMB
**Server Message Block (SMB) Protocol** is a client-server communication protocol and is used for
sharing access to files, printers, and serial ports. They can also carry transaction protocols for
interprocess communication and implemented in Microsoft Windows.

**Network management protocol (NMP)** is a suite of protocols defining processes, procedures, and
policies to manage a network. NMP protocols monitor a network 24/7 in real time and provide network
statistics to a network administrator. These stats provide info to manage and improve network
performance. Two common ones are Internet Control Message Protocol (ICMP) and Simple network
management protocol (SNMP). 
The info that an NMP protocol provides are status of a host, host availability, network latency,
packet loss, and network errors. 

### ICMP
**Internet Control Message Protocol** is a protocol used by network devices to communicate problems
with data transmission. It is part of layer 3, which means no port number (TCP or UDP) are used. It
is a component of the TCP/IP protocol stack. They relay messages as datagrams, containing an IP
header with the ICMP data being transmitted. 
ICMP function is to report any IP operation errors, including:
- Time to Live (TTL): occurs when the datagram TTL value has reach zero, but the datagram has not
  reached its destination yet.
- Destination unreachable: occurs when the IP packet's destination host, network, or port number is
  unreachable.
- Parameter problem: occurs when a device finds a problem that is not covered in any ICMP message type
- Packet too big: occurs when a datagram is too large for the network

### SNMP
**Simple network management protocol (SNMP)** is a network protocol for monitoring networked devices
in an IP network. It is an application layer protocol, meaning it is part of layer 7. It uses TCP
port 161 and 162. 

A **managed device**, or **network element**, is a network node that implements an SNMP interface
that allows access to the network node's information. It can be any type of device, like a switch,
router, cable, etc. An **SNMP manager** is a system that monitors and controls a network element's
activities using the SNMP. An **SNMP agent** is the software that runs on a network element and
collects and maintains information on the network element.

An SNMP manager may request information from a network element or set a configuration parameter on a
network element. An SNMP agent listens for and executes an SNMP command sent by an SNMP manager. An
**SNMP trap** is an alert message sent from an SNMP agent to an SNMP manager to notify the SNMP
manager of an event at a network element.

### ARP
**Address Resolution Protocol (ARP)** is a network protocol for mapping dynamic IP addresses to the
physical device address (MAC). It works between the data link and network layer protocol and does
not use a specific TCP port.

ARP functions with IPv4 addresses. It's functionality in IPv6 is replaced with Network Discovery
Protocol (NDP). Hackers can try to exploit ARP, in which case the **dynamic ARP inspection (DAI)**
is used to detect and reject invalid and malicious ARP packets.
