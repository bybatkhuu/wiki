# Linux user

## [RECOMMENDED] Create new user and add to group

```sh
export PRIMARY_GROUP_ID=11000
export NEW_USER_NAME=new_user_name

sudo useradd -s /bin/bash -m -d /home/${NEW_USER_NAME} -N -g ${PRIMARY_GROUP_ID} ${NEW_USER_NAME}
# Or
sudo adduser --gid ${PRIMARY_GROUP_ID} ${NEW_USER_NAME}

# Set user password:
sudo passwd ${NEW_USER_NAME}
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
sudo useradd -s /bin/bash -m -d /home/[NEW_USER_NAME] -N -g [PRIMARY_GROUP_ID] -G sudo [NEW_USER_NAME]
# For example:
sudo useradd -s /bin/bash -m -d /home/new_user_name -N -g 11000 -G sudo new_user_name

# Or
sudo adduser --gid [PRIMARY_GROUP_ID] --group sudo [NEW_USER_NAME]
# For example:
sudo adduser --gid 11000 --group sudo new_user_name
```

### Set or change user password

```sh
sudo passwd [USER_NAME]
# For example:
sudo passwd user_name

# Or
echo -e "[USER_NAME]:[PASSWORD]" | sudo chpasswd
# For example:
echo -e "user_name:simple_password" | sudo chpasswd
```

### Add user to sudo

Add user to sudo group:

```sh
sudo usermod -aG sudo [USER_NAME]
# For example:
sudo usermod -aG sudo user_name
```

Or add user to sudoers file:

```sh
echo "[USER_NAME] ALL=(ALL) ALL" | sudo tee -a /etc/sudoers.d/[USER_NAME]
# For example:
echo "user_name ALL=(ALL) ALL" | sudo tee -a /etc/sudoers.d/user_name

sudo chmod 0440 /etc/sudoers.d/[USER_NAME]
# For example:
sudo chmod 0440 /etc/sudoers.d/user_name
```

### Rename user name

```sh
sudo usermod -l [NEW_USER_NAME] [OLD_USER_NAME]
# For example:
sudo usermod -l new_user_name old_user_name
```

### Change user ID (UID)

```sh
sudo usermod -u [NEW_UID] [USER_NAME]
# For example:
sudo usermod -u 1000 user_name
```

### Remove user

```sh
sudo userdel -rf [USER_NAME]
# For example:
sudo userdel -rf user_name

# Or
sudo deluser --remove-home --remove-all-files [USER_NAME]
# For example:
sudo deluser --remove-home --remove-all-files user_name
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
