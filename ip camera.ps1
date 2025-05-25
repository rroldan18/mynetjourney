config t
ip routing
ip dhcp pool CAMERA6
host 10._.50.6 255.255.255.0
client-identifier 001a.0709.c268
ip dhcp pool CAMERA8
host 10._.50.8 255.255.255.0
client-identifier 001a.070a.27ed
end
show ip dhcp binding