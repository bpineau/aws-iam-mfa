${user} account informations
============================

Username: ${user}
Password (PGP encrypted): ${password}
AWS Access Key ID: ${access_key}
AWS Secret Key ID (PGP encrypted): ${secret_key}

Before you can do anything, you must log into
${aws_url}
then change your password and register your MFA device.

To decrypt the secrets,
```
echo "the secret" | openssl enc -base64 -d | gpg --decrypt -
```
