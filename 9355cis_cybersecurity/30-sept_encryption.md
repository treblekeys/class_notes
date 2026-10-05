# Encryption
For attackers, you do not win against encryption, you try to bypass it.

**Cryptography**: science that deals with techniques and mechanisms to conceal data. Also provide
ways to authenticate data and guarantee integrity.

Encryption is very important, it ensures data is seen only by those with permission to see it and
ensures that the data is not modified in transit. Also allows accountability, since senders cannot
deny sending message.

Plaintext: the real message
Ciphertext: the encrypted message
Encryption algorithm: the method of encrypting the message. ex: Caesar cipher
Key/Password: the correct combination to decrypt the ciphertext

The key is secret, the algorithm is generally known to everyone (Kerckhoff's principle).

Symmetric keys: efficient, fast, widely used, generally short lived, provides confidentiality.
Issues:
- initial sharing is complex
- difficult to manage and distribute keys

Asymmetric encryption has two keys. The keys are related, but you don't necessarily know one another
based on each other (In practice you use the private to create the public). You encrypt with one of
them and decrypt with the other one.

Everyone sees my public key and uses it to encrypt a message, but only I can decrypt it since only I
have the private key that is used to decrypt it.

You make a public key available via a certificate.
