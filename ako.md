## My Cisco Journey 1

### the command below will use python to configure a cisco access point:
~~~

import json
import netmiko
from netmiko import ConnectHandler

# WRITE, CONNECT, PUSH

### WRITE
# WRITE device information and configurations

# Read json file containing aironet settings
with open('wificonfig.json') as file:
    deviceData = json.load(file)

# parse info from json file
aironet = deviceData['aironetInfo']
apConfig = deviceData['aironetConfig']

# Write the script for the device
deviceConfig = [
    f'hostname {apConfig["hostname"]}',
    f'dot11 ssid {apConfig["ssid"]}',
    f'authentication {apConfig["authentication"]}',
    f'authentication key-management {apConfig["key-man"]}',
    f'wpa-psk ascii {apConfig["wifi-pass"]}',
    'guest-mode',
    'default Int Dot11Radio 0',
    'int dot11radio 0',
    'no shut',
    f'channel {apConfig["channel"]}',
    f'encryption mode ciphers {apConfig["encr-mod"]}',
    f'ssid {apConfig["ssid"]}',
    'bridge-group 1',
    'exit'
]

### CONNECT
# Connect to the device's CLI
accessAutoAP = ConnectHandler(**aironet)

# use enable command to enter privilege exec mode
accessAutoAP.enable()

### PUSH 
# Push configurations through global configuration mode
output = accessAutoAP.send_config_set(deviceConfig)

# Print CLI Output on the terminal
print(output)

# close connection
accessAutoAP.disconnect()



# create a show run output file
with open('show_run_output.txt', 'w') as file:
    file.write(output)

~~~
## This jason file will be use:
~~~
{
    "aironetInfo": {
        "device_type": "cisco_ios_telnet",
        "host": "10.51.10.3",
        "username": "admin",
        "password": "pass",
        "secret": "pass"
    },

    "aironetConfig": {
        "hostname": "aironwifi",
        "ssid": "NetDevOpsWIFI-51rr",
        "authentication": "open",
        "key-man": "wpa",
        "wifi-pass": "C1sc0123",
        "channel": "8",
        "encr-mod": "tkip",
        "vlan": "51"
    }
}

~~~
