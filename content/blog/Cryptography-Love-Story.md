+++
title = "Cryptograpgy: A Love Story"
date = "2025-08-18"
+++
# Cryptograpgy: A Love Story

## Greetings Anons,

Todays write-up is going to be about cryptography, data collection and the movements that are shaping an online revolution.

In the age of corporate surveillance, there is more data points collected on citizens then ever before, serving as the primary commodity for big tech. This relentless pursuit of information casts a shadow over the digital landscape, bluring the line between consumer and product; shrinking the size of our online ecosystem to just a handful of websites owned by the same companies.

## Security and Encryption

OpSec and cryptography go hand-in-hand, its the weapon used for protecting our data as well as our identity. Encryption is the process of securing those assests. But if used wrong, these tools wont mitigate any risks, leaving you just as vulnerable as the average clearnet user.

## Symmetric & Asymmetric Encryption Algorithms

| Symmetric | Asymmetric |
|-----------|------------|
| Block Cipers | RSA ECC DSA |
| AES DES | Diffie-Hellman |
| 128 or 256 bits | Two keys (public/private) |
| Only one key (private) | Slower |
| Faster | 2048 bits |

Symmetric is widely used as the backbone of the internet; securing your connections, passwords, and is known for its speed. Symmetric only uses one private key,. Asymmtric is used for secure communitcations between two people like email and messaging, generating each user a public key and a private key but it is also used with TOR nework, VPNs and TLS.

## Key Derivation Functions

KDFs are used to further enhance security by running another hashing algorithms against keys to add entorpy and make them less predictable. KDFs can take a users password and generate a stronger, more random encryption key, making it more resistant to brute-force attacks. With the advancment in technology, KDFs of yesterday like PBKDF2 used to be the standard for LUKs disc encryption. However HKFD2 has been cracked by lawenforcment proving anyone with the means to rent cloud based GPUs can also do so. For better entorpy it is now recommended to use a better KDF such as argon2. [References](https://blog.dataparty.xyz/blog/wtf-is-a-kdf/)

## Symmetric & Asymmtric (Strong Recommended)

| Symmetric | Asymmetric |
|-----------|------------|
| AES-256 | Diffie-Hellman 3072 bit |
| Serpent-256 | RSA-3072 |
| Threefish-1024 | EXX/EXDH/ECDSA |
| Xchacha20 | CRYSTALS |

Argon2id is recommended with Symmetric and HMAC for Asymmetric

## Hashing vs encryption



Hashing and encryption both provide ways to keep sensitive data safe. However, in almost all circumstances, passwords should be hashed, NOT encrypted.

Hashing is a one-way function (i.e., it is impossible to “decrypt” a hash and obtain the original plaintext value). Hashing is appropiate for password validation. Even if an attacker obtains the hashed password, they cannot enter it into an application’s password field and log in as the victim.

Encryption is a two-way function, meaning that the original plaintext can be retrieved. Encryption is appropriate for storing data suck as a user’s address since this data is displayed in plaintext on the user’s profile. Hasing the address would result in a garbled mess.

Salting A salt is a unique, randomly generated string that is added to each password as part of the hashing process. As the salt is unique for every user, an attacker has to crack the hashes one at a time using the respective salt rather then calculating a hash once and comparing it against every stored hash. Salting also protects against an attacker pr-computing hashes using rainbow tables or databse-based lookups. Argon2id Scrypt HMAC

## The Revolution

Today, we stand at the precipice of an online privacy revolution, one that is reshaping the way we interact with the digital world. In an era of ever-advancing technology, new platforms have emerged to empower individuals to take control of their data and redifine the way we engage with one another. Movements like the fediverse are decentralized and is the way the internet was intended to be. But there is also blogs like mine that make up the indieweb; a movement where individuals own their content and publish it to their own website.
