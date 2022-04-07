# Linux user password

---

## Change password directly

```bash
# Change [USER_NAME] password:
sudo passwd [USER_NAME]
# For example:
sudo passwd username
```

## Encrypting password

```bash
# Install openssl package to encrypt password:
sudo apt-get update --fix-missing -o Acquire::CompressionTypes::Order::=gz
sudo apt-get install -y openssl

# Generate random string:
openssl rand -base64 16

# Encrypting password into the hash password:
echo "[MY_PASSWORD]" | openssl passwd -1 -stdin
# For example:
echo "my_password1" | openssl passwd -1 -stdin
# $1$tqgpm8lk$KiQfge2bKsEacdp9/RM5J0

# Changing Linux user password with hash password:
echo -e "[USER_NAME]:[HASH_PASSWORD]" | sudo chpasswd -e
# For example:
echo -e "username:\$1\$tqgpm8lk\$KiQfge2bKsEacdp9/RM5J0" | sudo chpasswd -e
```

## References

* [https://www.cyberciti.biz/faq/linux-set-change-password-how-to](https://www.cyberciti.biz/faq/linux-set-change-password-how-to)
* [https://sleeplessbeastie.eu/2018/04/09/how-to-securely-change-user-password-using-shell-script](https://sleeplessbeastie.eu/2018/04/09/how-to-securely-change-user-password-using-shell-script)
