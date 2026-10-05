Entered into a shared network so that we can all be on the same network.
ssh into the computer that is on the network. `ssh visitor@192.168.0.225`
On our own computer, create a message that you want to keep secret.
```bash
openssl enc -e -aes-256-cbc -in secret_message.txt -out secret_message.enc
```
Using this, we encrypted our message.
To send message to the computer we ssh into, use:
```bash
scp secret_message.txt visitor@192.168.0.225:~/GROUP99
```
Now, our message is in the computer.

To decrypt, first we send it from the visitor pc to our pc
```bash
scp visitor@192.168.0.225:~/GROUP99/secret_message.enc ./
```
Now it is in our pc.

To decrypt:
```bash
openssl enc -d -aes-256-cbc -in secret_message.enc -out secret_message_decrypted.txt
```

Note: this is a symmetric key encryption, meaning to decrypt the message, we need the key/password
that the person encrypted it with.
