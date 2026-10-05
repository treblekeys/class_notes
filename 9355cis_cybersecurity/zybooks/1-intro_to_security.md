# Introduction to Security

## Security Principles
**Information security** is the practice of protecting information from unauthorized access,
disclosure, disruption, destruction, or modification.

The goal of InfoSec is to preserve three security principles:
- **Confidentiality** is the principle that ensures information is only disclosed or made available
  to authorized users.
- **Integrity** is the principle that ensures information is only modified in an authorized manner.
- **Availability** is the principle that ensures information is accessible by authorized users
  whenever required.

These are also known as the **CIA triad**. The three principles are preserved using hardware and
software systems, like firewalls, anti-virus, and authentication methods. Policies and procedures
are established to make sure the information is handed securely, like instituting password and
security audits. People are trained to securely use hardware and software systems to be able to
recognize threats through security awareness and education programs.

### Confidentiality
Having confidentiality means restricting information access and disclosure to authorized users and
includes measures for protecting proprietary information and personal privacy. 
Threats to confidentiality ranges from stealing passwords and capturing network traffic to
conducting social engineering attacks. On top of threats, there are also confidentiality breaches
such as emailing sensitive information to wrong recipients.

There are confidentiality controls that protect data from unauthorized access and use. Some controls
include encryption, access control lists, and authentication systems. If you encrypt your email,
you protect the confidentiality of the email's content. 

Example: Encryption is a great way to protect confidentiality. The unencrypted data is plaintext. It
is encrypted using an encryption algorithm and key. The output of the algorithm is ciphertext, which
is stored/transmitted instead of plaintext. Only authorized users have access to the decryption key
that is used to decrypt the ciphertext. 

### Integrity
Having integrity means information cannot be changed in an unauthorized manner. Data at rest (data
stored on systems), data in transit (data transmitted between systems), and data in use (data in
processing) should be protected to maintain data integrity. Some threats to integrity could be a
virus that corrupts the contents of a file, or unintentional data loss.

Access control can help prevent authorized users from making unauthorized changes. Has verifications
and digital signatures makes sure transactions are authentic. 

Example: A hash function maps a variable length string to a fixed size value called a hash. The
output of a has function is always the same size regardless of the input string size. Any changes to
a hash function's input string results in a different hash, so a hash function detects data
modification and validates data integrity.

### Availability
Having availability means information must be accessible whenever needed. Threats may include
hardware failures and disruptions or malicious attacks with intention to sabotage and cause harm
through DDoS. Something simple like dust on a motherboard can impact availability because it can
increase the temperature of the motherboard and decrease hardware lifespan.

Availability controls protect timely and uninterrupted access to information. These includes backup
servers, diversifying power sources, and creating hardware redundancies. Software tools can monitor
system performance and network traffic, and firewalls and routers can help mitigate impact of DDoS attacks.

Example: A load balancer can be used to improve data availability by distributing web traffic across
multiple identical web servers. If a web server fails, the load balancer will direct the traffic to
the other web server to preserve data availability.

---

## Vulnerabilities
Ideally, a system could perfectly secure and support a user's needs. However, we have limited time
and resources, and a system will always contain some weaknesses. 

A **vulnerability** is a weakness or a flaw in a system's design, implementation, operation, or
management. 

A **threat** is any event that can potentially impact a system negatively through
unauthorized access, destruction, disclosure, modification of data, and/or denial of service. A
threat exposes a vulnerability.
- Threats can be accidental (software or operator error), intentional (virus, ransomware), or
  natural (earthquakes, hurricanes)

A **threat actor** is a person or group who exploits a vulnerability. They use a threat to damage
the system or access confidential data.

### Impact of Vulnerability Exploitations
A **data breach** is the exposure of data to an unauthorized user. 
**Data loss** is the loss of access to data. 
**Data exfiltration** is the unauthorized transfer of data.

Data breach can result in:
- Identify theft: an attacker uses personal info to apply for loans or medical insurance
- Financial loss: an attacker may request a ransom, or organization may be fined for inadequate security
- Reputation damage: consumers may lose trust in the targeted organization
- Availability loss: employees or customers may be unable to access data to perform tasks

Example: In 2021, T-Mobile's internal system got hacked by an attacker through an unprotected
router. T-Mobile experienced a data breach and the attacker gained access to the servers that store
customer information. T-Mobile experienced data exfiltration because the attacker copied all the
data and listed it for sale on the dark web. Due to this, customers may experience identity theft
and T-Mobile experienced financial loss due to being sued by customers. 

---

## Threat Actors and Attack Vectors
Threat actors exploit vulnerabilities for various reasons, including harming a person,
organization, or government, accessing confidential information, or gaining competitive advantage.
They can have various degree of knowledge and resources and have various goals such as financial
gains or revenge. 

### Security Hacker
A security hacker is a person who uses various techniques to exploit vulnerabilities in computer
systems or networks. There are 3types:
- **White hate hacker** is also known as an ethical hacker and is a non-malicious hacker who is
  tasked by a system's owner to identify a system's vulnerabilities. 
- **Gray hat hacker** is also a non-malicious hacker who attempts to find a system's vulnerabilities
  __without__ the knowledge of the system owner and for purpose of informing the system's owner
  about the threats to the system
- **Black hat hacker** is a __malicious__ hacker who identifies and exploits a system's
  vulnerabilities without the knowledge or consent of the system's owner.

There is also a type called the **script kiddie**, which is an unskilled person who uses malicious
scripts developed by security hackers to exploit a system's vulnerabilities. They lack the skills to
understand how the scripts operate or the consequences of running those scripts.

### Other Threat Actors
**Advanced persistent threat** (APT) is a threat actor who gains unauthorized access to a high-value
target for an extended period of time. They are usually sponsored by nation state or state actor
with the aim for stealing government secrets. **State actor** is someone who is acting on behalf of
the government. 

A **hacktivist** is an activist who uses computer-based techniques to promote the activist's agenda.
They often operate as part of a coordinated group or organization. 

A **cyber syndicate** is a criminal syndicate who uses the internet to engage in criminal conduct.
These include fraud, extortion, ransom, and identity theft. They are organized and well funded and
capable of conducting sophisticated attacks against wide range of targets. 

A **competitor** is a rival organization whose activities have potential to reduce another
organization's share of the market. They may exploit vulnerabilities in the organization's systems
to perform espionage, harm reputation, or deny customer access. 

### Attack Vector and Surface
An **attack vector**, or threat actor, is a path or means by which an attack is realized. For
example, email is an attack vector because email can be used deliver malware to a target user. 

An **attack surface** is the set of the organization's vulnerabilities.

Common attack vectors:
- Direct access: accessing a computer or network directly through physical connection. 
- Wireless: modifying wireless data
- Vulnerable software: accessing computer/network through known vulnerability.
- Unsupported systems and applications: accessing computer/network through system that is no longer
  receiving security updates
- Messaging: attaching malware through a link in email or instant message
- Image: embedding malware within an image file
- Supply chain: modifying malware product as it moves in the supply chain
- Social media: delivering attacks against a target based on their social media posts
- Removable media: delivering malware using removable media such as USB
- Cloud: using cloud computing, network, or storage resources to launch an attack

A **shadow IT** is the information technology systems deployed at a company without the knowledge of
the company's IT department. They bypass limitations of centrally managed IT systems. They are
threats that introduce security and compliance concerns because these systems are not monitored or
configured according to the company's security policies.

---

## Malware
Malware is any software developed to compromise the confidentiality, integrity, or availability of
data. It can be used to steal data, modify files, or deny user access.

Attack methods:
- Spread: malware that infects a device and spreads to other devices
- Block: prevents a user from accessing the data on the infected device
- Spy: collects information from the infected device
- Mislead: malware that seems like a legitimate software like a game
- Hide: malware that evades detection or conceals other malware

### Spread: Virus and Worm
A **virus** is a type of malware that attaches to a legitimate program or file and spreads when the
infected program is executed. Most viruses attach to a file or program, but a **fileless virus** is
a virus that exist in memory only and is impossible to detect by scanning for infected files. 

A **worm** is a type of malware that self-replicates and spreads to other devices over a network. It
infects a device and scans for connected devices with a certain vulnerability.

### Spread: Bots
A **bot** is a device that is infected with malware that enables an attacker to remotely control the
device. It communicates with __command and control__ (C&C) server to receive instruction or send
back information. A group of bots is called a botnet. For the devices that are part of a botnet, the
performance of the device might still feel the same since attackers do not want to be found out.

**Cryptomalware** is a type of malware that uses a target computer's computing resources to mine
cryptocurrency. It is resource intensive, so they might use a botnet to help. 

### Block: Ransomware
**Ransomware** is a type of malware that denies access to computer files and then demands a ransom
to release the files.

### Spy: Spyware and Keylogger
**Spyware** is a type of malware that collects user data without the user's consent. It can collect
browsing habits or shopping trends for targeted advertising. They might also be included in
**bloatware**, which is unwanted software that is preloaded onto a new device. It brings potential
spyware, consumes resources, and introduce vulnerabilities to the device.

A **keylogger** is a type of malware that records the keystrokes on a keyboard. It can be used to
gain personal information like passwords or credit card number. 

### Mislead: Trojan, Remote Access Trojan (RAT), Potentially Unwanted Program (PUP)
A **trojan** is a type of malware that hides as a legitimate program. It performs legitimate
functions, so the user may not realize that the trojan is also stealing information or causing damage. 

One type of trojan is called a **remote access trojan (RAT)** and they give an attacker remote
access to an infected device. 

A **potentially unwanted program (PUP)** is a type of software that a user considers unnecessary but
does not intentionally cause damage. It is usually installed with other software.

### Hide: Backdoor and Logic Bomb
A **backdoor** is a type of malware that enables unauthorized access to a device. It allows
attackers to bypass regular authentication procedures and is usually included as part of a larger
malware package. 

A **logic bomb** is a type of malware that activates an attack when specific conditions are met. 

### Hide: Rootkit
A **rootkit** is a type of malware that provides administrative or root access to a computing device
without permission of detection. It may be designed to install/hide/prevent removal of other
malware, allow attacker to use device to attack other devices, or create a backdoor to access
confidential information. 

There are different types of rootkits that target different locations. A kernel rootkit targets a
device's operating system, an application rootkit alters an application's executable file so that
the rootkit runs when the application is started, and a firmware rootkit executes before the
operating even starts. 

---

## Security Control Types
**Security control** is a mechanism used to protect the confidentiality, integrity, and availability
of an organization's systems and data. They are separated into different categories:
- Technical control: A control performed by a system. 
    - Ex: a firewall rule blocks incoming traffic from a certain IP address
- Managerial control: A control that addresses risk management and governance through established procedures
    - Ex: an organization's password policy states that employees must change passwords every 90 days
- Operational control: A control that is performed by employees. 
    - Ex: employee conducts security awareness training for new employees
- Physical control: A control that secures the physical environment
    - Ex: a security camera records people entering and exiting an office building

### Passive Security Control
A security control is classified by the control's purpose. A passive control aims to minimize the
occurrence of security issues rather than actively responding to security issues.
- Preventive control: A control that prevents a security issue
    - Ex: a locked door to prevent unauthorized individuals from entering a sensitive area
- Deterrent control: A control that deters an individual from violating security policies
    - Ex: adequate lighting placed at all building entrances
- Directive control: A control that gives direction
    - Ex: an organization's laptop Acceptable Use Policy (AUP)

### Active Security Control
These are security controls are that actively doing something in response to a security issue.
- Detective control: A control that detects a security issue
    - Ex: door alarms and motion detectors
- Corrective control: A control that restores normal operations after a security issue occurs
    - Ex: Restoring backup data after a ransomware attack

There are also compensating security controls, which addresses weaknesses of existing controls or
compensates for the ability to meet specific security requirements. For example, if an organization
requires separation of duties but does not have enough employees to implement it, a two person
integrity is implemented for sensitive tasks as a compensating control.

---

## Risk Analysis
When working through managing risks, implement controls will be designed to mitigate those risks.
Three concepts are connected by the way that an organization manages risk:
- The **inherent risk** facing an organization is the original level of risk that exists before
  implementing any controls.
- The **residual risk** is the risk that remains after an organization implements controls designed
  to mitigate, avoid, and/or transfer the inherent risk.
- **Risk awareness** is the raising of understanding within the organization, the risks impacts, and
how to manage the risk.

### Risk Severity Formula
Organizations begin with inherent risk and then add risk management strategies to reduce that risk.
They will continue until the residual risk is at of below the organization's risk acceptable level.

The risk formula is `Risk Severity = Likelihood * Impact`.
- **Likelihood** of occurrence is the probability of the risk occurring.
- **Impact** is expressed as financial cost, incurred as the result of a risk.

### Risk Matrix
A **risk register** is a document that often provides far too much detail for business leaders.
Therefore, you would use a risk matrix to explain these concepts to leaders. A **risk matrix**, or
heat map, approach summarizes risks and allows senior leaders to quickly focus on the most
significant risks facing the organization.

---

## Risk Management
**Risk and control self assessment (RCSA)** is a process used to access and identify the operational risks
and the effectiveness of controls. It is used to make sure all business objectives will be met. They
are in regulatory frameworks to ensure the reliability and integrity of information, confirm
compliance, and protect assets. 

Risk Control Concepts:
- Avoidance: eliminates a risk's possibility
- Separation: separate and diversify to reduce risk impact
- Duplication: create duplicates to minimize risk impact
- Loss prevention: accepts the risk and seeks to limit losses
- Loss reduction: minimizes loss occurrence

**Risk management** is the process of systematically addressing the risks facing an organization. It
provides guidance in prioritizing risks so that the risks with the highest probability and magnitude
are addressed first.

A **risk management strategy** is an organization's plan for managing an identified risk by
determining the optimal response for the risk.

Risk management strategies:
- Transfer: reduce a risk's impact to the organization by placing some or all of the risk's impact
  elsewhere
    - Ex: purchasing cybersecurity insurance
- Accept: accept a risk's potential impact because the cost to avoid/mitigate/transfer are greater
  than the risk's potential impact
    - Ex: accepting minor vulnerability with low chance of exploitation
- Avoid: eliminate the risk's possibility
    - Ex: decommissioning legacy systems with known vulnerabilities
- Mitigate: reduce a risk's likelihood or potential impact
    - Ex: implementing anti-virus software

**Risk identification and analysis** is the process of systematically discovering and accessing
potential risks that could negatively affect an organization's operations. Components include:
- **Risk register** is a central depository for documented risks. 
- **Key risk indicators (KRIs)** are metrics measuring and monitoring the probability or impact of risks. 
- A **risk owner** is someone who is assigned and responsible for managing and mitigating a specific
  task. They oversee the implementation of risk management strategies.
- A **risk threshold** is the limit of risk acceptable to an organization. **Risk appetite** is the
  amount of risk an organization is willing to accept in pursuit of the organization's objectives.
  **Risk tolerance** is the limit of risk that an organization can withstand. 

### Third-party Risk Management
You can choose to have a vendor who will possess security controls and help with risk management.
Once a vendor is chosen, sensitive information will be shared. They will have to be monitored and
questioned to understand how they are providing security for the organization.

There are different agreement types:
- **Service-level agreement (SLA)** is a contract showing minimum service requirements and
  performance metrics agreed upon between a service provider and customer.
- **Master service agreement (MSA)** is a contract that establishes basic terms and conditions for
  all future transactions and agreements between two parties
- **Work order (WO)** or **statement of work (SOW)** is a contract that specifies details of a
  specific project
- **Business partnership agreement (BPA)** is a contract that outlines financial details and rules
  for the business partnership
- **Memorandum of understanding (MOU)** is an informal written agreement of common goal 
- **Memorandum of agreement (MOA)** is a document that outlines cooperation between two parties
  working towards a common goal
- **Non-disclosure agreement (NDA)** is a contract used to protect disclosure of information

**Gap analysis** is a method for assessing differences between actual and desired performance or
goals within a system or organization. 

---

## Zero Trust
**Zero trust** is a security framework that enforces continuous authentication, authorization, and
security configuration validation for all users and devices, regardless of proximity to network
perimeter. Aims to prevent internal threats.

### Zero Trust Network Components
Zero trust network includes a control plane and a data plane. **Control plane** is responsible for
managing authentication, authorization, and policy enforcement for network access.
Control plane includes:
- Policy engine: the component that determines the application of policy for each request
- Trust engine: the component that scores device and user trust
- Data stores: the component that store authentication data for the requesting device and user
- Policy administrator: the component that administers policy decisions, establishing or blocking
  connection to protected resources

The **data plane** is responsible for enforcing security policies and controlling data access within
the network. It includes:
- Device and user: the components requesting access to protected resources
- Policy enforcement point (PEP): the component that enforces policy decisions
- Protected resources: the component representing assets secured by policy enforcement

### Zero Trust Authorization
In a zero trust network, fine-grained, dynamic policies control access based on a resource and
user/device trust scores. Applying policy against multiple data sources allows for granular
authentication decisions, which improves the network's overall security and user experience. 
- Ex: a login from an employee's new laptop prompts additional authentication for accessing a
  sensitive database, while allowing access to the employee's calendar. 

All access is granted on a temporary basis, requiring users and devices to undergo regular
reauthorization. Changes in a user's or device's trust score may result in connection blocking or
necessitate additional authentication.

An **air-gapped** network physically isolated a network segment from the internet and all other
unsecured networks, preventing unauthorized access through wired or wireless connections. Physical
isolation is used in high-security environment, such as military facilities.
