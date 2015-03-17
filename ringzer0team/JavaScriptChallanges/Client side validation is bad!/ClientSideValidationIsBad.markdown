#####Client side validation is bad!
#####Answer
At first seen we wanna brute force the login page and try some users and passwords but it dosen't work.  
So we must first see page source, you can use `Ctrl+U` or `F12` key to see page source  
After accessing the source we'll search for `script` tag and try to understand the code:   
```       
  $(".c_submit").click(function(event) {  
      event.preventDefault()  
      var u = $("#cuser").val();  
      var p = $("#cpass").val();  
      if(u == "admin" && p == String.fromCharCode(74,97,118,97,83,99,114,105,112,116,73,115,83,101,99,117,114,101)) {  
          if(document.location.href.indexOf("?p=") == -1) {     
              document.location = document.location.href + "?p=" + p;   
          }  
      } else {  
          $("#cresponse").html("<div class='alert alert-danger'>Wrong password sorry.</div>");  
      }  
  });  
```  
As you see the username is `admin` and password:  
```  
  String.fromCharCode(74,97,118,97,83,99,114,105,112,116,73,115,83,101,99,117,114,101)  
```  
So simply we can use browser's java script console to run the code and give the password as shown bellow:  
```  
  > String.fromCharCode(74,97,118,97,83,99,114,105,112,116,73,115,83,101,99,117,114,101)  
      "JavaScriptIsSecure"  
```  
Now we submit `admin` and `JavaScriptIsSecure` as username and password and the message is `FLAG-66Jq5u688he0y46564481WRh`.

Submit the flag and have fun ;)