# Linux network commands

## Check network interfaces

```bash
nmcli device status
# Or
sudo lshw -class network -short
```

## Check IP addresses with color

```bash
ip -br -c addr show
ip -br -c link show
```

## Check LISTEN ports

```bash
sudo netstat -tulpn | grep LISTEN
```

## Reset DHCP client

```bash
sudo dhclient -r
```
