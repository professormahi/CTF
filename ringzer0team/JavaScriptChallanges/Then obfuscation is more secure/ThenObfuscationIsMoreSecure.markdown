#####[Hashing is more secure](http://ringzer0team.com/challenges/30)
#####Answer
At first seen we wanna brute force the login page and try some passwords but it dosen't work.  
So we must first see page source, you can use `Ctrl+U` or `F12` key to see page source  
After accessing the source we'll search for `script` tag and try to understand the code:   
```         
  var _0xc360=["\x76\x61\x6C","\x23\x63\x70\x61\x73\x73","\x61\x6C\x6B\x33","\x30\x32\x6C\x31","\x3F\x70\x3D","\x69\x6E\x64\x65\x78\x4F\x66","\x68\x72\x65\x66","\x6C\x6F\x63\x61\x74\x69\x6F\x6E","\x3C\x64\x69\x76\x20\x63\x6C\x61\x73\x73\x3D\x27\x65\x72\x72\x6F\x72\x27\x3E\x57\x72\x6F\x6E\x67\x20\x70\x61\x73\x73\x77\x6F\x72\x64\x20\x73\x6F\x72\x72\x79\x2E\x3C\x2F\x64\x69\x76\x3E","\x68\x74\x6D\x6C","\x23\x63\x72\x65\x73\x70\x6F\x6E\x73\x65","\x63\x6C\x69\x63\x6B","\x2E\x63\x5F\x73\x75\x62\x6D\x69\x74"];$(_0xc360[12])[_0xc360[11]](function (){var _0xf382x1=$(_0xc360[1])[_0xc360[0]]();var _0xf382x2=_0xc360[2];if(_0xf382x1==_0xc360[3]+_0xf382x2){if(document[_0xc360[7]][_0xc360[6]][_0xc360[5]](_0xc360[4])==-1){document[_0xc360[7]]=document[_0xc360[7]][_0xc360[6]]+_0xc360[4]+_0xf382x1;} ;} else {$(_0xc360[10])[_0xc360[9]](_0xc360[8]);} ;} );
```  
Are you kidding me?, you are frightened man? Don't worry I'm here ;)  
As you see we have sth here:  
```  
  _0xf382x2=_0xc360[2];
  if(_0xf382x1==_0xc360[3]+_0xf382x2){ ... } // Checking the password if, as you see the password is sum of _0xc360[3] and _0xf382x2
```  
So simply we use console to find password:  
```
  var _0xc360= ... // Put the code here :D
    ... // It outputs sth
  _0xf382x2=_0xc360[2];
    "alk3"
  _0xc360[3]+_0xf382x2
    "02l1alk3"
```  
As a resualt the password is `02l1alk3`, thus we enter it as password and the message is `FLAG-5PJne3T8d73UGv4SCqN44DXj`.

Submit the flag and have fun ;)