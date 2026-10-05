# Chapter One

Two types of topology: logical and physical
Physical is what you see, logical is how it works

Physical:

Bus topology: straight line, lose connection if line breaks, terminators at the end.
Terminators prevent data from bouncing back.
On bus topology, everyone hears all message on the network
Bus usually works with ethernet to be able to connect layer 1 and layer 2.

Ring topology: ends of the line is connected together.
token passing: whoever holding the token can send a message in the ring.

Full Mesh: everyone is connected to everyone.

Partial Mesh: connect some computers to some computers

Star: everyone plugs into a central hub.

Logical:

In a star topology, the box where everything is connected has a bus. Inside works in a bus even
though it is a star topology physically.
Physical star, logical bus

Routers have two or more connections. It can connect to another router.
Default gateway on your network is where data arrives at if it doesn't know exactly where to send the
information to.
For the test, routers connect to other routers and networks. In real life, routers connect to other
networks.

The Internet is the network of networks. They all connect together through routers. Nobody owns the
Internet, even though the textbook will say the ISPs owns it. Nobody/Everybody owns the Internet.

ISP = Internet Service Provider

IoT: connecting things that are not necessarily computers being connected into the Internet.

IETF, IANA, ITU, IEEE
For the test, these are standards-creating organizations.

Networks have clients and servers. Clients request resources from servers, servers serve resources.
DNS is the domain name service that connects the domain name to the IP address
If we search Google, DNS converts the name to IP address. It will see that the client and the Google
web server is not on the same network, then tries to send it to default gateway (router), which
connects to another router, etc.
You have to be connected to the network to use services like printers on Baruch's network.

Slide 19, 24 - 30, 39 - 40, do not pay attention to

Each hop that you see with `tracert` are the routers. Full path is called a route. Each link is
called a data link.

Dynamic and static: static IP address do not change, you set it one way, it will be that way.
Dynamic IP address will change automatically.

Static has flaws; if devices comes and goes often, then you have to manually add or delete IP
addresses. It is also prone to error since you are typing in the IP address. However, some stuff
have to be static because devices depend on them. DNS, DHCP, and default gateway are always static
because other devices need to know what they are at all time.

DHCP: dynamic host configuration protocol. It gives devices IP addresses. It will look for the
device's MAC address and gives it an IP address, subnet mask, and default gateway.

Non-authoritative dns
