# Cryptography

## 5.1 Cryptography Principles
**Cryptography** is the science of secret writing with the goal of hiding the meaning of a message.
**Cryptanalysis** is the science of breaking cryptography. **Cryptology** is the study of
cryptography and cryptanalysis.

Cryptography provides four main security services:
- **Confidentiality**: data can only be viewed by authorized entities. Also called **secrecy**.
- **Integrity**: data cannot be modified in an unauthorized manner since the data was created,
  stored, or transmitted by an authorized entity. The integrity security service does not prevent
  unauthorized data modifications, but rather provides a mean to detect them.
- **Message authentication**, or **data origin authentication**: a message receiver can verify the
  source of a message. 
- **Non-repudiation**: a message sender cannot deny sending a message. It provides assurance to a
  message receiver that the message originated from the sender.

### Cryptographic Primitives
These are the building blocks of cryptography. They provide a security service. There are four
cryptography primitives:
- **Encryption**: it uses an algorithm and a key to hide the meaning of a message. 
    - **Asymmetric encryption**: two different, but mathematically related keys are used for
      encryption and decryption.
    - **Symmetric encryption**: the same key is used for encryption and decryption.
    - Symmetric can use stream or block ciphers. Stream encrypts data one bit at a time, block
      encrypts data one block of bits at a time.
    - Encryption provides the confidentiality security service.
- **Cryptographic hash function**: it outputs a fixed-length string for variable-length input string. 
    - It provides the data integrity security service.
- **Message authentication code (MAC)**: it uses a cryptographic hash function and symmetric
  encryption to provide the data integrity and authenticity security services.
- **Digital signature**: it uses the cryptographic hash function and asymmetric encryption to
  provide the data integrity, authenticity, and non-repudiation security services.

---

## 5.2 Historical Cryptosystems
Historical cryptosystems predate the computer age. Modern cryptosystems use techniques based on the
difficulty of solving mathematical problems, while historical ones used simple operations to
scramble letters of the alphabet to hide a message's meaning. They not longer provide any meaningful
security due to how easy it is to solve, but they form the basis of modern day cryptography.

### Substitution Cipher
A **substitution cipher** is a cipher which substitutes or replaces one element of plaintext with a
different element to generate a ciphertext. In a **monoalphabetic substitution cipher**, a letter in
a plaintext is replaced by a fixed letter to generate a ciphertext. In a **polyalphabetic
substitution cipher**, a specific litter in a plaintext is replaced by different letters in a ciphertext.

A **shift cipher** is a substitution cipher which replaces a plaintext's letter by a letter that is
a fixed number of positions to the right of the letter in the alphabet. The fixed number of
positions is the encryption key. The **Caesar cipher** is a shift cipher which shifts each
plaintext's letter by 3 positions to the right. That means the encryption key is 3.

A **ROT13 cipher** is a monoalphabetic substitution cipher which rotates each letter of a plaintext
13 places to the right in the alphabet. It is short for rotate 13 and the encryption key is 13. 

### Transposition Cipher (Rail Fence Cipher)
A **transposition cipher**, or **permutation cipher**, is a cipher which reorders elements of a
plaintext in the ciphertext without adding or removing elements. It does not replace an element of a
plaintext in the ciphertext, it just reorders them.

A **rail fence cipher** is a transposition cipher in which a plaintext's letters are written
diagonally downwards on successive rails of an imaginary fence. After reaching the bottom rail, a
plaintext's letters are written diagonally upwards on successive rails until reaching the top rail.
It looks like a zigzag of letters going up and down. The key is the number of rails.

## 5.3 Encryption
**Encryption** is the process of encoding or scrambling a message. **Decryption** is the process of
decoding or unscrambling a message. Both follow a specific sequence of instructions called an
algorithm. A **cipher** is an encryption or decryption algorithm.

An encryption algorithm transforms a plaintext into a ciphertext using a **key**, which is a string
of bits. A **key space** is a set of all possible keys. A **plaintext** is an unencrypted or
unscrambled message. A **ciphertext** is the encrypted message. A decryption algorithm transforms a
ciphertext into a plaintext using a decryption key.

**Key length** is the size of the encryption key measured in bits. Longer the key, more resilient
against attacks. To enhance the encryption strength for shorter or simpler keys, we will need to use
key stretching techniques. **Key stretching** is the process of artificially increasing a key's
length and complexity. 

### Properties of Encryption Algorithms
A secure encryption algorithm should have two properties:
- **Confusion** is a secure encryption algorithm property that ensures that changing a single bit of
  encryption key impacts most of the ciphertext bits. This property hides the relationship between a
  ciphertext and the encryption key.
- **Diffusion** is a secure encryption algorithm property that ensures that changing a plaintext bit
  changes about half of the ciphertext bits and changing a single ciphertext bit changes about half
  of the plaintext bits. This property hides the relationship between plaintext and ciphertext.

### Kerckhoffs's Principles
**Kerckhoffs's principle** states that the security of a cryptographic algorithm should depend on
the secrecy of the key, not on the secrecy of the algorithm. The way a message is encrypted can be
known, but the key used to encrypt the message should be kept hidden.

---

## 5.4 Symmetric Encryption: Stream Cipher
It is an encryption algorithm that uses the same key to encrypt and decrypt data. The key that is
being used is called a **symmetric key** or **secret key**.

Symmetric encryption is faster and more efficient than asymmetric encryption since they use shorter
keys and simpler operations. It is used in cryptographic protocols such as HTTPS and IPSec.

### Stream Cipher
It is a class of symmetric encryption that encrypts data one bit at a time. It converts an
encryption key into a **keystream**, which is a continuous bit stream. A **keystream generator** is
an algorithm that creates a keystream. A data sender and receiver use the same key and keystream
generator to encrypt or decrypt data.

A stream cipher is computationally efficient because the encryption and decryption consist of a
simple operation. Since it encrypts data one bit at a time, an error in encryption does not
propagate; one bit error in encryption results in a one bit error in decryption. It is commonly used
in communication applications that requires fast encryption and decryption of a data stream. For
example, the **A5/1** is a stream cipher used for encrypting data exchanged between a mobile phone
and a base station.

---

## 5.5 Symmetric Encryption: Block Cipher
It is a symmetric cipher that encrypts data block of fixed size one block at a time. For a
variable-length plaintext, the data must first be partitioned into separate blocks. If the length of
a plaintext is not a multiple block cipher's block size, a plaintext's last block is filled with
random bits to make a full block. The process of adding bits to a plaintext's last block is called
**padding**. 
International Data Encryption Algorithm (IDEA) is a block cipher that encrypts data into 64-bit blocks.

### Modes of Operation
A **mode of operation** specifies how a block cipher applies a single-block operation to a plaintext
larger than the block cipher's block size. There are 5 common modes of operation:
- In **Electronic Code Book (ECB)** mode each plaintext block is encrypted separately to generate a
  ciphertext block. It only depends on an encryption key and a plaintext. Identical plaintext blocks
  are encrypted into identical ciphertext blocks. Each plaintext block is encrypted separately, so
  errors in one plaintext block results in errors in only one ciphertext block.
- In **Cipher Block Chaining (CBC)** mode each plaintext block is XORed with the previous ciphertext
  block before being encrypted. As a result, all the ciphertext blocks are computationally chained
  together. To create a unique ciphertext every time the encryption is performed, an
  **initialization vector (IV)** is used in the encryption process of a plaintext's first block. An
  IV is a randomly generated sequence of bits of size equal to the cipher's block size. Since the
  ciphertext blocks are computationally chained, errors propagate in CBC mode. An error in one
  ciphertext block results in error in all the subsequent ciphertext blocks.
- In **Cipher Feedback (CFB)** mode a block cipher operates as a stream cipher. Similar to CBC mode,
  an IV is used in the encryption process of the first plaintext block and ciphertext blocks are
  computationally chained. Each plaintext block is encrypted and XORed with the previous ciphertext
  block to produce the current ciphertext block. The encryption and decryption processes are the
  same in the CFB mode. Errors propagate in CFB mode.
- In **Output Feedback (OFB)** mode a block cipher generates keystream blocks which are XORed with
  the plaintext blocks to create the ciphertext blocks. Chaining dependencies do not exist in OFB
  mode because each block is created independently of plaintext and ciphertext blocks. In OFB mode
  encryption and decryption processes are the same and errors do not propagate. 
- In **Counter (CTR)** mode a block cipher operates as a stream cipher. A data sender and receiver
  use a synchronized counter which computes a new shared value each time a ciphertext block is
  exchanged. The CTR mode has positional dependency because a ciphertext block depends on the
  position of the current plaintext block. Since a ciphertext does not depend on any other blocks,
  errors do not propagate in CTR mode.

### Data Encryption Standard (DES) and 3DES
**Data Encryption Standard (DES)** is a symmetric block cipher which encrypts data in 64-bit blocks.
DES uses 56-bit blocks. It is not considered a secure encryption algorithm because a 56-bit can be
broken with modern cryptanalytic techniques. **Triple Data Encryption Standard (TDES)**, or
**3DES**, is a symmetric block cipher which applies DES three consecutive times, or rounds, to each
64-bit block. One, two, or three identical or different keys can be used at each of the three DES rounds.

Three keying options exist in 3DES:
- Keying option 1: three independent 56-bit keys are used in each DES round, for a total of 3 x 56 =
  168 independent key bits. It is the most secure keying option.
- Keying option 2: two independent 56-bit keys are used in each DES round, for a total of 2 x 56 =
  112 independent key bits.
- Keying option 3: three identical 56-bit keys are used in each DES round. It is the most insecure
  keying option and is for providing backward compatibility with DES.
3DES was designed to improve DES by increasing the encryption key size without the need to design a
new symmetric block cipher.

### Advanced Encryption Standard (AES)
**Advanced encryption standard (AES)** is a symmetric block cipher which encrypts data in 128-bit
blocks. AES uses 128, 192, or 256-bit keys. It is the most widely used block cipher. For example,
AES is used by VPNs to create encrypted tunnels, by wireless networks to encrypt data in transit, by
data storage devices to encrypt data at rest, and by HTTPS to secure communications on the Internet.

An **encryption round** is a set of operations that are consecutively applied to a block of
plaintext bits during an encryption process. The number of encryption rounds in AES is determined by
the encryption key length. A longer key corresponds to a higher number of encryption rounds and a
larger keyspace, both of which make the cipher more resistant to brute force attacks.

## 5.6 Asymmetric Encryption
in **asymmetric encryption** two different, but mathematically related keys are used to encrypt and
decrypt a message. Asymmetric encryption is also known as **public-key encryption**, and the two
related keys are called a public key and a private key, known together as a **key-pair**. A **public
key** is not secret and is openly available. A **private key** is secret and is only available to
the key-pair owner. A message encrypted with a public key can only be decrypted with the related
private key. This key-pair enabled two entities to securely exchange a message. The sender encrypts
a message with a message receiver's public key. The receiver decrypts a message with the related
private key.

### Asymmetric Algorithms
The encryption is based on the properties of **one-way functions**, which is a function that is easy
to compute in one direction, but difficult to compute in the opposite direction. A **trapdoor
one-way function** is a one-way function that is easy to compute in both directions only with
specific knowledge of a function's input or output. The specific knowledge is called a **trapdoor**.
Asymmetric algorithms are based on two classes of trapdoor one-way functions: integer factorization
and discrete logarithm

Three asymmetric encryption algorithms:
- The **RSA algorithm** uses the mathematical properties of prime numbers in generating public and
  private key pairs. The security of the algorithm is based on the difficulty of factoring large
  prime numbers. Encryption and decryption using this algorithm is slow and computationally
  expensive. It is mostly used to set up a secure communication link between two parties for the
  purpose of exchanging a **session key**, which is a symmetric key that is only used for the
  duration of a single communication session. RSA algorithm is used in asymmetric encryption and
  digital signatures.
- The **ElGamal algorithm** uses discrete logarithms for generating public and private keys pairs.
  The security of the algorithm is based on the difficulty of solving discrete logarithms. The
  algorithm is probabilistic, meaning that a plaintext may be encrypted to different ciphertexts.
  The disadvantage of the ElGamal encryption is that the length of a ciphertext generated by the
  algorithm is twice the length of a plaintext, which makes the use of the algorithm inefficient in
  resource-limited devices and communications over low bandwidth networks. Also used in asymmetric
  encryption and digital signatures.
- The **Elliptic Curve Cryptography (ECC) algorithm** uses elliptic curves for generating public and
  private key pairs. An elliptic curve is the set of points that satisfy a specific mathematical
  equation. The security of the algorithm is based on the difficulty of solving Elliptic Curve
  Discrete Logarithm Problem (ECDLP). This algorithm provides the same level of security as RSA but
  with smaller key sizes, which makes it more efficient and used in resource-limited devices. The
  algorithm is used in asymmetric encryption, digital signatures, and key exchange.

### Asymmetric Algorithms for Key Establishment
Asymmetric encryption is also used for establishing symmetric keys. The **Diffie-Hellman (DH)
algorithm** is a key exchange algorithm used for generating a shared symmetric key between two
parties communicating over an insecure network such as the Internet. The algorithm can generate both
a static key and an ephemeral key. A **static key** is a long term key intended to be used over an
extended time period. Example is the private key of a public-private key pair. An **ephemeral key**
is a key which is used in only a single transaction. It is generated for each execution of a
key-establishment process. Two DH methods use ephemeral keys:
- Diffie-Hellman Ephemeral (DHE) or Ephemeral Diffie-Hellman (EDH)
- Elliptic Curve Diffie-Hellman Ephemeral (ECDHE) which uses ephemeral keys generated by Elliptic
  Curve Cryptography (ECC)

The DHE and ECDHE provide for perfect forward secrecy. The **perfect forward secrecy (PFS)**, or
**forward secrecy (FS)**, is a property of a key exchange algorithm which provides the assurance
that a session key will not be compromised if a static key (long term key) used for generating
session key is compromised in the future.

---

## 5.7 Cryptographic Hash Functions
A **cryptographic hash function** is a function which maps a variable length string, or **message**,
to a fixed-size value, or **message digest**. A message digest is also called a **hash**. For
example, the MD5 is a cryptographic hash function that maps a message to a 128-bit hash. The
cryptographic hash function has many applications in information security, including digital
signatures and message authentication code (MAC).

### Properties of Cryptographic Hash Functions
A cryptographic hash function has three properties:
- **Collision resistance**: finding two different inputs to a cryptographic hash function that have
  the same digest is computationally infeasible
- **Preimage resistance**: finding the original message from a message digest is computationally
  infeasible. This property is also called the **one-way property**
- **Second preimage resistance**: finding a second input that has the same digest as any other
  specified input is computationally infeasible

The avalanche effect is a desirable property of a cryptographic hash function. The **avalanche
effect** property in a cryptographic hash function means that a small change to a message should
result in a digest that is significantly different and uncorrelated with the digest of the original
message.

### Collision Attacks
A collision, or hash collision, occurs when a hash function produces the same message digest for two
different messages. A **collision attack** is an attack that attempts to find two different input
messages to a hash function that produce the same message digest. An attacker could try to create
malware with the same hash as a package so that a target believes the malware is authentic.

The birthday paradox is the idea that, given two groups of people, someone from the first group has
the same birthday as someone from the second group. A **birthday attack** is a collision attack
based on the birthday paradox. It increases the chances of finding a collision by creating two
groups of messages and searching for some message in the first group that shares a message digest
with some message in the second group.
