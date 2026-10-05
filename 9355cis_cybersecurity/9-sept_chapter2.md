# Chapter 2

Risk cannot be eliminated completely. 
Some types of companies can take risks and some cannot. Pharma companies cannot take risks due to
the effect it has on lives, but being to cautious can stagnate the company.

Cybersecurity is a negative deliverable.

Focus on encryption

---
## Networking (in person)

Layer 1: RJ45, DSL, Fiber, FDDI, Physical 
Layer 2: ARP, switch, data link
Layer 3: router, IP, ICMP, network
Layer 4: TCP/UDP, transport
Layer 5: NETBIOS, RPC, manages what goes where, ports, session
Layer 6: JPG, PNG, MP3, unicode, ascii, encoded things, presentation
Layer 7: HTML, SSH, FTP, mail, anything you can actually see, application

ARP: Address resolution protocol

When computer first connects to switch, the switch will get the MAC address and remembers it in the
port for it.

Computer wants to go out in the world, so switch will give the computer an IP address to go out into
the world. The switch doesn't really do anything with the IP, but the router will use the IP address
to let the computer go out into the Internet.

IP addresses will have certain digits that the switch can understand, like 192.168.##.#. If you try
to connect to other devices with the same certain digits in the network, the switch understands. But
if you go out to different IPs, then the router will help.

When you have a phone call with someone, it continues and guaranteed delivering until hung up. That
is TCP, which is reliable. UDP is like sending a message via a pigeon and hoping for the best. UDP
is used when the data you are sending or receiving does not matter, like a video or live streaming.
It does not matter if you miss a pixel or two and it is really fast since it doesn't have to stop
and wait to establish the session like TCP. TCP is best for things where you do not want to miss anything.
