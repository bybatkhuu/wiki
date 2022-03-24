# Linux group

## [RECOMMENDED] Create new group and add user to it

```sh
export NEW_GID=11000
export NEW_GROUP_NAME=devs
export USER_NAME=user_name

sudo groupadd -f -g ${NEW_GID} ${NEW_GROUP_NAME}
# Or
sudo addgroup --gid ${NEW_GID} ${NEW_GROUP_NAME}

# Change primary group of user:
sudo usermod -aG ${NEW_GROUP_NAME} -g ${NEW_GROUP_NAME} ${USER_NAME}
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
groups user_name

# List user groups with GID:
id [USER_NAME]
# For example:
id user_name
```

### Create new group

```sh
sudo groupadd -f -g [NEW_GID] [NEW_GROUP_NAME]
# For example:
sudo groupadd -f -g 11000 new_group_name

# Or
sudo addgroup --gid [NEW_GID] [NEW_GROUP_NAME]
# For example:
sudo addgroup --gid 11000 new_group_name
```

### Add user to group

Change primary group of user:

```sh
sudo usermod -aG [PRIMARY_GROUP] -g [PRIMARY_GROUP] [USER_NAME]
# For example:
sudo usermod -aG primary_group -g primary_group user_name
```

Add user to group (secondary/supplementary):

```sh
sudo usermod -aG [SECOND_GROUP] [USER_NAME]
# For example:
sudo usermod -aG second_group user_name

# Apply group changes:
newgrp [SECOND_GROUP]
# For example:
newgrp second_group
# Or reboot:
# sudo shutdown -r now
```

### Change group name

```sh
sudo groupmod -n [NEW_GROUP_NAME] [OLD_GROUP_NAME]
# For example:
sudo groupmod -n new_group_name old_group_name
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
sudo gpasswd -d user_name group
```

### Remove group

```sh
sudo groupdel -f [GROUP]
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
