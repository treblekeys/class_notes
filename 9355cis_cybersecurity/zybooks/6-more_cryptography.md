# More on Cryptography

## 6.2 Message Authentication Code (MAC)
A **message authentication code (MAC)** is a cryptographic primitive used for verifying data
integrity and authenticity. It is computed by applying a MAC algorithm to a message in combination
with a symmetric key. A MAC is also called a **tag**.

A message sender computes the MAC for a message using a symmetric key shared with a message
receiver. A message sender appends the MAC to a message before sending a message. A message receiver
performs a two step process:
1. Computes the MAC for the message
2. Compares the computed MAC with the MAC received with the message

If the computed MAC is equal to the MAC received with the message, the message receiver is assured
that the message was sent by the sender and the message was not modified in transit.

### Security Services
A MAC provides two security services:
- Data integrity: if the MAC of a received message is equal to the MAC computed by a message
  receiver, a message receiver is assured that the message was not modified in transit.
- Data origin authentication: a valid MAC can only be created by the symmetric key shared between a
  message sender and a message receiver. Since only a message sender has the shared symmetric key to
  compute the MAC, a message receiver is assured that a message originated from the sender.

A MAC does not provide the non-repudiation security service. Since a message sender and a message
receiver share the same symmetric key, a message sender can only deny sending a message. A message
sender can claim a message receiver forged a valid MAC by using the shared symmetric key.

### Hashed Message Authentication Code (HMAC)
A **hashed message authentication code (HMAC)**, or **hashed-based authentication code**, is a MAC
that uses a symmetric key together with a cryptographic hash function. A message sender uses a
cryptographic hash function to compute a message digest. A message sender encrypts a message digest
with a symmetric key shared with a message receiver.

An HMAC is denoted by the cryptographic hash function an HMAC uses to compute a message digest. Ex:
HMAC-MD5 is an HMAC that uses a message digest computed by the MD5 cryptographic hash function. The
HMAC size is equal to the size of the underlying cryptographic hash function.

---

## 6.3 Digital Signatures
A **digital signature** is a cryptographic primitive that uses a cryptographic hash function and
public key cryptography to verify the authenticity and integrity of a digital message. A message
sender computes the message digest with a cryptographic hash function and applies a signing
algorithm which uses the sender's private key to create a digital signature for the message. It is
sent to the message receiver along with the message.

The message receiver applies a signature verification algorithm which uses the sender's public key
to verify that the message was signed by the sender and not modified in transit.

### Digital Signature Algorithms
A digital signature requires the use of public-key cryptography. A digital signature can be based on
any of the three public-key algorithm families; integer factorization, discrete logarithms, and
elliptic curves. Three commonly used digital signature algorithms:
- The **RSA Digital Signature Algorithm** uses the RSA public-key cryptography. The security of the
  RSA algorithm is based on the difficulty of factoring large prime numbers.
- The **Digital Signature Algorithm (DSA)** uses a variant of the ElGamal public-key cryptography.
  The security of the ElGamal algorithm is based on the difficulty of solving discrete logarithm
  problem.
- The **Elliptic Curve Digital Algorithm (ECDSA)** uses the elliptic curve public-key cryptography.
  The security of the elliptic curve algorithm is based on the difficulty of locating related points
  on an elliptic curve.

A digital signature is identified by combining the name of a digital signature algorithm and the
underlying cryptographic hash function that the digital signature scheme uses to compute a message
hash. For example, ECDSA-SHA12 is an Elliptic Curve Digital Signature Algorithm that uses the Secure
Hash Algorithm 512 (SHA512) hash function to compute a message hash.

### Security Services
A digital signature provides three security services:
- Data integrity: if the message digest of a sent message matches the message digest computed by the
  message receiver, the message receiver is assured that the message was not modified in transit.
- Data origin authentication: a valid digital signature can only be created by a message sender's
  private key. Since only a message has the private key which signed the message, the receiver is
  assured that the message originated from the sender.
- Non-repudiation: a message sender cannot deny, or repudiate, that the message was signed. Only the
  message sender has the private key which signed the message.

A digital signature does not provide the data confidentiality security service. A message sender
only encrypts the message digest. A message is not protected from an eavesdropper.

---

## 6.4 Digital Certificates
A **digital certificate**, or **public key certificate**, is an electronic document which proves the
ownership of a public key. A digital certificate contains the certificate owner's public key and
identity information, such as name, address, and organization. A digital certificate is only valid
for a specific period, known as a certificate's validity period. A certificate is digitally signed
by a certificate issuer, known as a **Certificate Authority (CA)**, that has verified a
certificate's content.

Ex: A digital certificate issued to Google includes the name of the certificate authority that
issued the certificate (Issuer), the certificate's validity period (the dates the certificate is
valid from and valid to), identity information on Google (subject), and Google's public key.

### Digital Certificate Types
A digital certificate is used to securely communicate with a certificate owner, and to validate
documents digitally signed by a certificate owner's private key.

A **web server certificate**, also known as a **domain certificate** or **TLS certificate**, is a
certificate that is used by a web server and a web client to establish a secure connection over a
network. Four types of web servers exist:
- A **domain validation (DV) certificate** only verifies the identity of a domain's owner.
- A **domain extended validation (EV) certificate** verifies the identity of a domain's owner, the
  domain owner's exclusive control over the domain, and the domain owner's legal and physical
  existence. 
- A **wildcard** certificate validates a domain and all the domain's subdomains.
- A **Subject Alternative Name (SAN) certificate** is used by multiple domains owned by the same
  domain owner. A SAN certificate is also known as a **United Communication Certificate (UCC)**.

There are some other types of digital certificates that exist:
- A **root certificate** is created and signed by a CA. A **self-signed** certificate is a
  certificate in which the certificate issuer and the certificate subject are the same. A root
  certificate does not depend on a higher-level authority for authentication. A CA uses a root
  certificate to sign other certificates
- A **code signing certificate** is used by a software developer, or a software publisher, to
  digitally sign software programs. An installation program, or an OS, uses a code signing
  certificate to ensure the integrity of a program before installing the program.
- An **email certificate** is used by an email user to digitally sign emails. An email sender
  encrypts an email with the sender's private key. The email recipient decrypts the email with the
  public key obtained from the sender's email certificate.
- A **machine certificate**, or **computer certificate**, is issued to a hardware device such as a
  computer, a router, or a printer. A machine certificate is used to authenticate a device on a network.

### Digital Certificate Formats
The **X.509** standard defines the format of a public key certificate. An X.509 certificate consists
of key-value pairs. A key represents a field name and a value represents a number, string, or list.

An X.509 certificate is saved in different formats:
- The **Privacy Enhanced Mail (PEM)** ASCII format. The PEM defines methods for encoding binary data
  using **Base64**. The Base64 is a binary-to-text encoding scheme that represents binary data in an
  ASCII string format. Filename extension of a PEM file is '.pem', '.crt', or '.cer'.
- The **Distinguished Encoding Rules (DER)** binary format. The DER is a subset of the **Abstract
  Syntax Notation One (ASN.1)** which is a platform-independent encoding format. The DER encoding
  ensures that the contents of a certificate can only be encoded in one way. The filename extension
  of a DER file is '.der' or '.cer'.
- The **Personal Information Exchange (PFX)** binary format. A PRX file is a password protected
  archive file format that contains the certificate and the corresponding private key. The PFX
  format is used by a server to import a certificate and private key from a single file. The
  filename extension of a PFX file is '.pfx'.
- The **Public Key Cryptography Standards #7 (PKCS #7)** and **Public Key Cryptography Standards #12
  (PKCS #12)** binary format. The PKCS #7 and PKCS #12 format defines a standard sytax for storing
  encrypted and signed data. A PKCS #7 or PKCS #12 is stored in DER binary or PEM ASCII formats. The
  filename extension of a PKCS #7 file is '.p7b' and the filename extension of PKCS #12 file is
  '.p12'.

### Key Escrow
**Key escrow** refers to the secure storage and management of cryptographic keys by a trusted third
party, known as an **escrow agent**. Key escrow ensures encrypted data remains accessible under
specific circumstances, such as legal obligations, instances of key compromise, or secure key
recovery. Key escrow is vital in environments where uninterrupted data availability enables lawful
access and prevents data loss due to misplaced or unavailable keys. 

---

## 6.5 Public Key Infrastructure (PKI)
A **Public Key Infrastructure (PKI)** is a framework for managing digital certificates and public
keys. A PKI enables users of an insecure network, such as the Internet, to securely exchange data by
using public and private cryptographic keys. A PKI includes the hardware, software, people,
policies, and procedures that enable the creation, renewal, renovation, and distribution of digital
certificates. A PKI's components are Certificate Authority (CA), Registration Authority (RA),
Certificate Policy (CP), and Certificate Practice Statement (CPS).
- **Certificate Authority** issues, renews, revokes, and distributes digital certificates. It is a
  third party trusted by both the certificate's owner, subject, and certificate user.
- **Registration Authority** verifies the identity of a digital certificate applicant. A certificate
  applicant sends a **Certificate Signing Request (CSR)** to an RA. It contains the applicant's
  public key and includes the applicant's name, organization, department, physical and email
  addresses. RA validates the applicant's identity and approves or rejects the applicant's CSR. 
- A **Certificate Repository (CR)**, or **central directory**, stores the digital certificates
  issued by a CA. CR also contains the **Certificate Revocation List (CRL)**, which is a list of
  certificates a CA has revoked prior to the certificates' validity periods.
- A **Certificate Policy (CP)** defines the structure of a PKI, describes a PKI's entities and
  roles, and specifies a PKI's procedures and operational requirements.
- A **Certificate Practice Statement (CPS)** describes how a CA issues, renews, revokes, and
  distributes certificates. It helps a certificate user to decide whether or not to trust a PKI's certificates.

### Certificate Life Cycle
The life cycle of a certificate refers to the stages that a certificate may go through during the
certificate's lifetime. The life cycle of a certificate has four stages:
- Issuance: a certificate is issued by a CA after a certificate applicant's identity is validated by
  an RA. Issued certificate is stored in a CR.
- Revocation: a certificate is revoked by a CA before the end of the certificate's validity period.
  A revoked certificate is added to the CRL.
- Suspension: a certificate's validity is temporarily suspended by a CA. The validity of a suspended
  certificate may be re-established, or a suspended certificate may be revoked.
- Expiration: a certificate is expired when the end of the certificate's validity period is reached.
  A PKI's CP defines the process of applying for a new certificate after a certificate has expired.

### PKI Trust Models
A **PKI trust model**, or **PKI Architecture**, describes the type of trust relationship which
exists between a PKI and PKI's certificate users. A PKI trust model enables a certificate user to
determine the legitimacy of a PKI's digital certificates issued to various entities. Three main PKI
trust model exist: single CA, hierarchical, and bridge.

In a **single CA trust model**, one CA issues all certificates. If the CA;s private key is
compromised, all PKI's certificates are revoked. A single CA trust model is not scalable to a
network with a large number of entities.

In a **hierarchical trust model**, a **root CA** issues certificates to an **intermediate CA**, and
an intermediate CA issues certificates to entities. A certificate user trusts the certificates
issued by an intermediate CA because the intermediate CA is trusted by the root CA. The **chain of
trust** describes the trust relationship between a certificate user and the intermediate CA which
issued the certificate. The root CA is called the **trust anchor**. The compromise of an
intermediate CA's private key only impacts the certificates which the intermediate CA issued. The
hierarchical PKI trust model is the most common trust model in use on the Internet.

A **bridge trust model**, or **BCA**, links PKIs with different trust models. The bridge CA only
establishes trust paths between linked PKIs and does not issue certificates to any entities.

### Key Management System
A **key management system (KMS)** is a software solution designed to manage the entire lifecyle of
cryptographic keys, including key generation, distribution, and revocation. A KMS securely manages
both public and private keys, automating encryption processes and strengthening security within PKI
systems. A KMS enhances security by centralizing key management and integrating with trusted
platform modules (TPMs) and hardware security modules (HSMs). 
For example, in a cloud environment, a KMS could be utilized to centrally manage encryption keys,
leveraging integrated TPMs and HSMs for enhanced security in storing and processing sensitive data.

--- 

## 6.6 Blockchain
A **digital ledger** is an electronic system or database used to record and track transactions. They
are utilized in finance, business, and record-keeping applications to monitor and audit
transactions. **Blockchain** is a decentralized and distributed digital ledger that records and
links transactions across a network of computers.

Blockchain enables the creation and maintenance of open public ledgers. An **open public ledger** is
a transparent record-keeping system that is accessible to the public, enabling anyone to verify
recorded transactions.

Blockchain cal be used to secure and track any type of information. For example, a system for
recording property transactions may use blockchain to securely and transparently process the buying
and selling of property, thus reducing the risk of fraud.

### Merkle Tree
A **Merkle tree** is a hierarchical data structure used for verifying the integrity of large data
sets. They facilitate secure data verification in blockchain, digital certificate revocation status
in public key infrastructure (PKI), and file integrity assurance in distributed file systems.

A Merkle tree is organized in a binary tree format. Data elements are initially stored in the tree's
leaves, with each leaf node containing a data element's hash. A Merkle tree is built by repeatedly
hashing child node pairs to create parent nodes until reaching a single top node. A **Merkle root**,
or **root hash**, is the topmost hash in a Merkle tree, uniquely representing the entire dataset's
cryptographic hashes.

A **Merkle path** is the sequence of nodes connecting a data element to the root. A data element's
Merkle path consists of the hashes of sibling nodes along the path from the data element to the
root. A Merkle path verifies a data element's integrity and inclusion in the tree without full
dataset access.

### Blockchain Block Structure
A blockchain functions within a network of computers or nodes, with each node maintaining a copy of
the entire ledger. Transaction data, organized using a Merkle tree structure, is grouped into
distinct blocks. Each block is composed of two components:
- The **block header** is the block component that provides metadata about the block and includes
  the block hash, previous block hash, blockchain protocol version, block creation timestamp, and
  Merkle root of the block transactions.
- The **block body** is the block component that contains the content or payload of the block, which
  depending upon the blockchain's intended purpose, can consist of transactions or
  application-specific data.

Every new block is cryptographically linked to the preceding block through the previous block
hash,forming a chain that is tamper-resistant and difficult to alter retroactively without altering
all subsequent blocks. Once a block is added to the chain, the block becomes immutable, ensuring the
integrity of the block's transactions.

The Merkle root optimizes data transmission and verification within a blockchain network. Nodes can
validate the inclusion of a particular transaction in a block by computing the hashes along the
transaction's Merkle path, removing the need to download and verify the entire set of transactions
within the block.

### Blockchain Consensus Algorithms
Since blockchain is decentralized, network nodes must verify the validity of transactions and reach
consensus before a new block is added to the blockchain. A **consensus algorithm** enables a network
of decentralized nodes to agree on the state of a shared digital ledger. Consensus algorithms are
critical for achieving a common and distributed understanding of the blockchain's transaction
history. Three common consensus algorithms exist:
- **Proof of Work (PoW)** is a blockchain consensus algorithm that requires network participants to
  perform a computationally intensive task, known as mining. A task typically involves fiding a
  value (nonce) which when combined with a block's data, produces a certain hash.
- **Proof of Authority (PoA)** is blockchain consensus algorithm where validators are chosen based
  on the validators' identity and reputation. The authority to create new blocks is only granted to
  known and trusted participants.
- **Proof of Stake (PoS)** is a blockchain consensus algorithm that selects a network participant to
  create a new block based on the amount of assets the participant holds and is willing to stake.
  **Staking** is the act of committing an asset as collateral to participate in the consensus
  process.

### Bitcoin's Environmental Impact
Bitcoin's use of the PoW consensus algorithm requires participants to solve complex mathematical
problem requiring significant amounts of computational power and electricity. The energy consumption
associated with Bitcoin blockchain has become substantial, leading to harmful consequences for the environment. 

---

## 6.7 Obfuscation Techniques
### Steganography
**Steganography** is an obfuscation technique that hides data by embedding data in a host medium
without noticeably altering the medium's appearance or functionality. 

It provides a covert method for protecting and transmitting sensitive data across various
applications. For example, it is used to protect intellectual property by concealing copyright
information within digital content, secure confidential data by embedding data within unsuspecting
images, and enable secret communication by hiding data in network packets.

Steganographic techniques leverage the unique properties of different media types to hide data while
preserving the media's perceptual integrity. For example, text steganography hides data within text
using invisible characters such as tabs and spaces, without altering the text's readability,
structure, formatting, and semantics.

### Tokenization
**Tokenization** is an obfuscation technique that replaces a sensitive data element with a
non-sensitive data element, known as a **token**. A **token vault** is a secure storage system that
maintains the relationship between sensitive data and the corresponding tokens.

A token has no external meaning or exploitable value and serves only as an identifier used for
mapping back to the associated sensitive data. Both tokenization and encryption are methods to
protect sensitive data. However, unlike encrypted data, tokenized data is not reversible and has no
mathematical relationship with the original sensitive data. 
