# 2013 Target Attack

## Summary
- November and December 2013
- Attackers gained access to Target's computer network and stole financial/personal data from about
  110 million Target customers and removed this information from Target's network to a server in
  Eastern Europe.
- Key points that Target failed to detect and stop the attack:
    - Target gave network access to a third party vendor, which did not appear to follow accepted IS
      practices.
    - Target failed to respond to multiple automated warnings from the anti-intrusion software that
      the attackers were installing malware on the Target's system.
    - Target did not properly isolate its most sensitive assets since attackers were able to move
      from less sensitive areas to more sensitive ones.

## Data Breach

### Stolen Data
December 19, 2023, Target confirmed that 40 million credit and debit card accounts were exposed in a
breach of its network. Target officials testified before Congress that they were not aware of the
breach until December 12. The breach affected cards used in Target stores between November 27 and
December 18. 

The thieves sold the information from these cards through online black market forums. They listed
card types, expiration dates, track data, country of origin, issuing bank, and successful use rate
for each card. Those who purchased the information can then create and use counterfeit cards with
data stolen from the card's magnetic stripes. Hackers may even try to decrypt the stolen Target PIN
numbers.

It is later disclosed on January 10, 2014, that up to 70 million customers may have had their
non-financial information (name, addresses, phone numbers, emails) stolen during this breach.

### The Attack
On January 12, 2014, Target CEO Gregg Steinhafel confirmed that malware installed on point of sale
(POS) terminals enabled the theft of financial information. The malware used a so-called "RAM
scraping" attack, allowing for the collection of unencrypted, plaintext data as it passed through
the infected POS machine's memory before the transfer of the company's payment processing provider.
A version of the "BlackPOS" malware was installed on Target's POS machines. Some say that this
malware was "unsophisticated" while others say that is was "incredibly sophisticated".

According to some investigators, the attackers installed this on a small number of POS terminals
sometime from the middle to the end of November. A report also shows that another malware was also
installed to move stolen data through Target's network and company's firewall on a Target server.
The attackers installed three variants of this malware at the end of November and updated it a
couple times. Target's FireEye malware intrusion detection system triggered alerts every time it
updated, but Target's security team did not react to the alarms nor allow FireEye to automatically
delete the malware. Target's Symantec antivirus software also detected malicious activity at the end
of November.

The malware started to send the stolen data to an external FTP server via another compromised Target
server on December 2, 2013. Over two weeks, attackers gained 11 GB or stolen information.
Reportedly, the extractions happened during Target's busier shopping hours to hide their work.

The attackers reportedly first gained access to Target's system by stealing credentials from an HVAC
and refrigeration company, Fazio Mechanical Services. Two months before the data breach, the
attackers stole the credentials for accessing Target's network via emails infected with malware.
Once inside, attackers exploited a default account name used by an IT management software product by
BMC Software to move within Target's network. They disguised their data exfiltration malware as a
legitimate BMC Software product.

## The Kill Chain

### The "Kill Chain" as a Cybersecurity Defense Tool
The conventional model of information security relies on static defence, like intrusion detection
systems and antivirus software, and assumes that attackers have an inherent advantage over defenders
due to ever changing technologies and undiscovered vulnerabilities. These conventional defenses are
not enough to protect organizations from sophisticated "advanced persistent threats" (APTs).

A paper was published, proposing an intelligence-driven, threat-focused approach to study the
intrusions from the attacker's POV. Network defenders should continuously monitor their systems for
evidence that attackers are trying to gain access to their systems. Any attempt could reveal the
attacker's tactics and methodologies and could anticipate and mitigate future intrusions. 

To show how network defenders can act on their knowledge of the attacker's tactics, the paper lays
out multiple steps that an attacker must proceed to plan and execute an attack. These steps are the
**kill chain**; while the attacker must complete these steps, the defender only has to stop the
attacker from completing one of these steps to thwart the attack.

Analyzing past attacks, using threat intelligence, and improving defences at all stages of the kill
chain allow a defender to detect and deny future attacks earlier and earlier in the kill chain. It
requires constant attention, but it could theoretically defend against ATPs using zero day exploits.

### Analysis of the Data Breach using the Kill Chain
John Mulligan, Target's Executive VP and CFO, states that the company has multiple layers of
protection, including firewalls, malware detection software, intrusion detection and prevention
capabilities, and data loss prevention tools. He states that Target is also certified as compliant
with the Payment Card Industry Data Security Standards (PCI-DSS), which is required before allowing
merchants to process credit and debit card payments. These were not sufficient enough to prevent the
breach.

#### Reconnaissance
As discussed earlier, attackers sent emails with malware to Fazio. The attackers may have found
information on Target's vendors through simple Internet searches. Files on these sites provided
information for HVAC vendors, which allowed attackers to map Target's internal network. To disrupt
this step in the kill chain, Target could limit the amount of publicly available vendor information.

#### Weaponization
Unconfirmed, but attackers most likely weaponized its malware targeting Fazio in an email
attachment. Fazio can disrupt this step in the kill chain through the use of real-time monitoring
and anti-malware software. However, according to investigators, Fazio used the free version of
Malwarebytes Anti-Malware, which does not provide the sufficient protection against this attack.

#### Delivery
The attackers performed a phishing attack against Fazio. Fazio could have disrupted this step in the
kill chain by training its staff to recognize and report phishing emails. Once again, real time
monitoring and anti-malware software could also potentially detect this.

Unconfirmed, but the malware may have also recorded passwords and provided the attackers with their
key to Target's Ariba external billing system. In this phase of the kill chain, Target could
potentially disrupt the attack by requiring 2FA for its vendors. According to Target's former
manager, Target rarely used 2FA for its low-level contractors. 

However, the attackers actually leveraged their access to this vendor's system to enter Target's
network, less security at the perimeter of Target's network may have contributed to the attackers'
success in breaching the most sensitive area of network. Using Fazio credentials to gain access to
Target's inner network, it appears the attackers then directly uploaded their RAM scraping malware
to POS terminals.

#### Exploitation
Once delivered, the RAM scraping malware and exfiltration malware began recording millions of card
swipes and storing the stolen data for later exfiltration. Target could have blocked the effect of
the exfiltration by either allowing FireEye to delete detected malware or by following up on the
alerts that were triggered. It appears that Target staff could have viewed the alerts as a false
positive if the system was frequently alarming. 

Another protective step could be to pay greater attention to industry and government intelligence
analyses. According to FBI, RAM scraping malware has been observed since 2011. There have also been
reports of warnings about the use of RAM scraping in April and August of the same year. It also
included recommendations for reducing the risk of a successful attack.

#### Installation
The attackers maintained access to Fazio's systems for some time while trying to breach Target's
network. It is unclear how they got deeper into Target's internal network. Brian Krebs and Dell
SecureWorks posit that the attackers may have exploited a default account name used in a BMC
Software information technology management system. If it is true, a protective step would be to
eliminate or alternate unneeded default accounts.

#### Command and Control
Based on the timeline, the attackers had access to Target's internal network for over a month. The
exact method by which the attackers maintained command and control is unknown, but it is clear that
the attackers were able to maintain a line of communication between the outside Internet and
Target's cardholder network.

In this phase of the kill chain, one protective step include the analysis of the location of
credentialed users in the network. If the attackers were still using Fazio's stolen credentials, an
analyst would have reason to be concerned if that credential was being used in an unrelated area of
the Target network.

Another protective step would have been strong firewalls between Target's internal systems and the
outside Internet to help disrupt the attacker's command and control.

#### Actions on Objectives
Attackers transmitted the stolen data to outside servers, one of which was located in Russia, in
plaintext via FTP over the course of two weeks. Protective defensive steps could include white
listing approved FTP servers to which Target's network is allowed to upload data. An analysis of
data transmission on Target's busy network may be extremely difficult but an upload to a server in
Russia would have been flagged as suspicious if discovered. 

Target's FireEye also did detect data exfiltration malware; acting on this information could have
stopped the exfiltration, not only at this last stage, but also during the delivery step on the kill
chain.
