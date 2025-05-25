config t   
no telephony-service
telephony-service
   no auto assign
   no auto-reg-ephone
   max-ephones 5
   max-dn 20
   ip source-address 10.51.100.8 port 2000
   create cnf-files
ephone-dn 1
  number 5111
ephone-dn 2
  number 5122
ephone-dn 3
  number 5133
ephone-dn 4
  number 5144
ephone-dn 5
  number 5155
ephone-dn 6
  number 5166
ephone-dn 7
  number 5177
ephone-dn 8
  number 5188
 ephone-dn 9
   number 5199
ephone-dn 10
 number 5198
Ephone 1
  Mac-address ccd8.c1fb.0953
  type 8945
  button 1:8 2:7 3:6 4:5
  restart
Ephone 2
  Mac-address ccd8.c1fb.14c9
  type 8945
  button 1:4 2:3 3:2 4:1
  restart  
end