Continuing on from what we left off on with OSI model and the types of area networks

Only going to focus on the bottom four layers of the OSI model.
Every layer has protocols (rules and standards) that prevent certain stuff from deviating from the
norm. For example, there are protocols to make sure that the IP address will be in the correct form
of ####.####.####.####.

For the MAC address, the first three pairs may be the same depending on the company or manufacturer.
That means a computer made by Dell and a computer made by Apple might have the same last three
pairs, but the MAC address of the devices combined should be unique.

CSMA/CD

When talking on the same network, use MAC address. When talking outside the same network, use IP address.
That is part of layer 2, where the ARP gives each device an IP. 
Data link is how you communicate on the layer, network layer is how you communicate between networks.

Physical layer: bits
Data link layers: frames
Network layer: packets

Three way handshake: verify the connection before sending the message.

User Datagram Protocol (UDP): send a message to everyone, doesn't matter who receives it, not
connection between sender and receiver. Connectionless
- Ex: live steam, video games

Transmission Control Protocol (TCP): connection is reliable, there is a connection between sender
and receiver. Connection oriented
- Ex: text messages, transferring files

Encapsulation of OSI layers is the process of adding headers and trailers to data
as it moves down the layers. The reverse process where you remove these headers and trailers
to access the data is called decapsulation. Encapsulation moves down the layers, decapsulation moves
up the layers.

**Test**: know the different types of network topologies, will match the image to the name in the test.

Two ways to define topology is **physical** and **logical**. Physical means what do you see.

Full mesh means every device is connected to one another. 
Partial mesh means the devices are connected to some computers. 

Physical star, logical ring is called a mau

ARPANET was the first wide-area packet switched network.

**Test**: ubiquitous/ubiquity means the fact that something seems to be everywhere in many places at
the same time. Example is WIFI, it is practically everywhere.

Nobody owns the Internet. People say the ISPs so, but no one owns it since the Internet is a network
of networks. No one controls the Internet either.

IEEE and some other institution are standards creating the organization.
