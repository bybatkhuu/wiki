# Linux user

## Create new user and add to group

```sh
export PRIMARY_GID=11000
export NEW_USER=new_user

sudo useradd -s /bin/bash -m -d /home/${NEW_USER} -N -g ${PRIMARY_GID} ${NEW_USER}
# Or
sudo adduser --gid ${PRIMARY_GID} ${NEW_USER}

# Set user password:
sudo passwd ${NEW_USER}
```

---

## User commands

### List users

```sh
# List all users:
cat /etc/passwd
# Or
sudo cat /etc/shadow
```

### Create new user

```sh
sudo useradd -s /bin/bash -m -d /home/[NEW_USER] -N -g [PRIMARY_GID] -G sudo [NEW_USER]
# For example:
sudo useradd -s /bin/bash -m -d /home/new_user -N -g 11000 -G sudo new_user

# Or
sudo adduser --gid [PRIMARY_GID] --group sudo [NEW_USER]
# For example:
sudo adduser --gid 11000 --group sudo new_user
```

### Set or change user password

```sh
sudo passwd [USER_NAME]
# For example:
sudo passwd username

# Or
echo -e "[USER_NAME]:[PASSWORD]" | sudo chpasswd
# For example:
echo -e "username:simple_password" | sudo chpasswd


# Or changing user password with hash password:
echo -e "[USER_NAME]:[HASH_PASSWORD]" | sudo chpasswd -e
# For example:
echo -e "username:\$1\$tqgpm8lk\$KiQfge2bKsEacdp9/RM5J0" | sudo chpasswd -e
```

### Add user to sudo

Add user to sudo group:

```sh
sudo usermod -aG sudo [USER_NAME]
# For example:
sudo usermod -aG sudo username
```

Or add user to sudoers file:

```sh
echo "[USER_NAME] ALL=(ALL) ALL" | sudo tee -a /etc/sudoers.d/[USER_NAME]
# For example:
echo "username ALL=(ALL) ALL" | sudo tee -a /etc/sudoers.d/username

sudo chmod 0440 /etc/sudoers.d/[USER_NAME]
# For example:
sudo chmod 0440 /etc/sudoers.d/username
```

### Rename user name

```sh
sudo usermod -l [NEW_USER] [OLD_USER]
# For example:
sudo usermod -l new_user old_user
```

### Change user ID (UID)

```sh
sudo usermod -u [NEW_UID] [USER_NAME]
# For example:
sudo usermod -u 1000 username
```

### Remove user

```sh
sudo userdel -rf [USER_NAME]
# For example:
sudo userdel -rf username

# Or
sudo deluser --remove-home --remove-all-files [USER_NAME]
# For example:
sudo deluser --remove-home --remove-all-files username
```

---

## References

* [https://linuxize.com/post/how-to-create-users-in-linux-using-the-useradd-command](https://linuxize.com/post/how-to-create-users-in-linux-using-the-useradd-command)
* [https://linuxize.com/post/how-to-list-users-in-linux](https://linuxize.com/post/how-to-list-users-in-linux)
* [https://linuxize.com/post/how-to-create-users-in-linux-using-the-useradd-command](https://linuxize.com/post/how-to-create-users-in-linux-using-the-useradd-command)
* [https://www.cyberciti.biz/faq/linux-set-change-password-how-to](https://www.cyberciti.biz/faq/linux-set-change-password-how-to)
* [https://askubuntu.com/questions/34074/how-do-i-change-my-username](https://askubuntu.com/questions/34074/how-do-i-change-my-username)
* [https://www.cyberciti.biz/faq/howto-change-rename-user-name-id](https://www.cyberciti.biz/faq/howto-change-rename-user-name-id)
* [https://linuxize.com/post/how-to-delete-users-in-linux-using-the-userdel-command](https://linuxize.com/post/how-to-delete-users-in-linux-using-the-userdel-command)
* [https://www.networkworld.com/article/3639611/using-chpasswd-to-change-account-passwords-on-linux.html](https://www.networkworld.com/article/3639611/using-chpasswd-to-change-account-passwords-on-linux.html)
* [https://linoxide.com/change-passwords-batch-mode-chpasswd](https://linoxide.com/change-passwords-batch-mode-chpasswd)
