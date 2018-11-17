##### [Why not?](http://ringzer0team.com/challenges/34)
##### Answer
At first seen we wanna brute force the login page and try some users and passwords but it dosen't work.  
So we must first see page source, you can use `Ctrl+U` or `F12` key to see page source  
After accessing the source we'll search for `script` tag and try to understand the code:   
```       
  $(".c_submit").click(function(event) {
    event.preventDefault();
    var k = new Array(176,214,205,246,264,255,227,237,242,244,265,270,283);
    var u = $("#cuser").val();
    var p = $("#cpass").val();
    var t = true;

    if(u == "administrator") {
      for(i = 0; i < u.length; i++) {
        if((u.charCodeAt(i) + p.charCodeAt(i) + i * 10) != k[i]) {
          $("#cresponse").html("<div class='alert alert-danger'>Wrong password sorry.</div>");
          t = false;
          break;
        }
      }
    } else {
      $("#cresponse").html("<div class='alert alert-danger'>Wrong password sorry.</div>");
      t = false;
    }
    if(t) {
      if(document.location.href.indexOf("?p=") == -1) {
        document.location = document.location.href + "?p=" + p;
      }
    }
  });  
```  
As you see the username is `administrator` and for password we have:  
```  
  for(i = 0; i < u.length; i++) {
    if((u.charCodeAt(i) + p.charCodeAt(i) + i * 10) != k[i]) { // that k is new Array(176,214,205,246,264,255,227,237,242,244,265,270,283); 
      $("#cresponse").html("<div class='alert alert-danger'>Wrong password sorry.</div>");
      t = false;
      break;
    }
  } 
```  
So With a simple calculation we have:  
```  
  u.charCodeAt(i) + p.charCodeAt(i) + i * 10) = k[i] => p.charCodeAt(i) = k[i] - i * 10 - u.charCodeAt(i) 
```  
Now it's time to use console:
```
  var k = new Array(176,214,205,246,264,255,227,237,242,244,265,270,283);
    undefined
  u = "administrator"
    "administrator"
  p = [] // Create a new array to store password
    []
  for(i = 0; i < u.length; i++) {
    p.push(k[i] - i*10 - u.charCodeAt(i)) // Make password
  } 
    13
  String.fromCharCode.apply(null, p); // Convert array to string of characters
    "OhLord4309111"
```
Now we submit `administrator` and `OhLord4309111` as username and password and the message is `FLAG-65t23674o6N2NehA44272G24`.

Submit the flag and have fun ;)
