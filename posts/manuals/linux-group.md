# Linux group

## Create new group and add user to it

```sh
export NEW_GID=11000
export NEW_GROUP=my_group
export USER_NAME=username

sudo groupadd -f -g ${NEW_GID} ${NEW_GROUP}
# Or
sudo addgroup --gid ${NEW_GID} ${NEW_GROUP}

# Change primary group of user:
sudo usermod -aG ${NEW_GROUP} -g ${NEW_GROUP} ${USER_NAME}
```

---

## Group commands

### List groups

```sh
# List all groups:
cat /etc/group

# List user groups:
groups [USER_NAME]
# For example:
groups username

# List user groups with GID:
id [USER_NAME]
# For example:
id username
```

### Create new group

```sh
sudo groupadd -f -g [NEW_GID] [NEW_GROUP]
# For example:
sudo groupadd -f -g 11000 new_group

# Or
sudo addgroup --gid [NEW_GID] [NEW_GROUP]
# For example:
sudo addgroup --gid 11000 new_group
```

### Add user to group

Change primary group of user:

```sh
sudo usermod -aG [PRIMARY_GROUP] -g [PRIMARY_GROUP] [USER_NAME]
# For example:
sudo usermod -aG primary_group -g primary_group username
```

Add user to group (secondary/supplementary):

```sh
sudo usermod -aG [SECOND_GROUP] [USER_NAME]
# For example:
sudo usermod -aG second_group username

# Apply group changes:
newgrp [SECOND_GROUP]
# For example:
newgrp second_group

# Or reboot:
# sudo shutdown -r now
```

### Change group name

```sh
sudo groupmod -n [NEW_GROUP] [OLD_GROUP]
# For example:
sudo groupmod -n new_group old_group
```

### Change group ID (GID)

```sh
sudo groupmod -g [NEW_GID] [GROUP_NAME]
# For example:
sudo groupmod -g 11000 group_name
```

### Remove user from group

```sh
sudo gpasswd -d [USER_NAME] [GROUP]
# For example:
sudo gpasswd -d username group
```

### Remove group

```sh
sudo groupdel [GROUP]
# For example:
sudo groupdel group

# Or
sudo delgroup [GROUP]
# For example:
sudo delgroup group
```

---

## References

* [https://linuxize.com/post/how-to-create-groups-in-linux](https://linuxize.com/post/how-to-create-groups-in-linux)
* [https://linuxize.com/post/how-to-add-user-to-group-in-linux](https://linuxize.com/post/how-to-add-user-to-group-in-linux)
* [https://superuser.com/questions/404135/rename-users-group-name](https://superuser.com/questions/404135/rename-users-group-name)
* [https://www.cyberciti.biz/faq/linux-change-user-group-uid-gid-for-all-owned-files](https://www.cyberciti.biz/faq/linux-change-user-group-uid-gid-for-all-owned-files)
* [https://linuxize.com/post/how-to-delete-group-in-linux](https://linuxize.com/post/how-to-delete-group-in-linux)
* [https://linuxize.com/post/how-to-list-groups-in-linux](https://linuxize.com/post/how-to-list-groups-in-linux)
