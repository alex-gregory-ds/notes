=======================
Public-key Cryptography
=======================

Public-key encryption is used to send sensitive data across unsecure networks.

Suppose *Alice* and *Bob* live on different sides of the world. *Alice* has a private message she wants to send to *Bob*. She could encrypt her message and send it over to *Bob* but without telling *Bob* how to decrypt the message, he will not be able to read it. *Alice* cannot send instructions how decrypt her message as anybody who intercepts the message will be able to decrypt and read her message.

This is where **public-key** encryption comes in.

In public-key encryption, *Bob* has a public and a private key (a key pair). *Bob* shares his public key with *Alice* which she uses to encrypt her message. The only way Alice's message can be decrypted is by using *Bob's* private key. So, *Alice* can safely send her message to *Bob* knowing that *Bob* is the only person that will be able to decrypt. A third party that intercepts *Alice's* message will not be able to decrypt it since they do not know *Bob's* private key.

The image below gives a visual representation of this process.

.. raw:: html
   :file: Images/public_key_encryption.svg

-----------------------
File Encryption Example
-----------------------

