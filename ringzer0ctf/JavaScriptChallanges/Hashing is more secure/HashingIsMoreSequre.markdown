##### [Hashing is more secure](http://ringzer0team.com/challenges/30)
##### Answer
At first seen we wanna brute force the login page and try some passwords but it dosen't work.  
So we must first see page source, you can use `Ctrl+U` or `F12` key to see page source  
After accessing the source we'll search for `script` tag and try to understand the code:   
```       
  $(".c_submit").click(function(event) {
    event.preventDefault();
    var p = $("#cpass").val();
    if(Sha1.hash(p) == "b89356ff6151527e89c4f3e3d30c8e6586c63962") {
        if(document.location.href.indexOf("?p=") == -1) {   
            document.location = document.location.href + "?p=" + p;
        }
    } else {
        $("#cresponse").html("<div class='alert alert-danger'>Wrong password sorry.</div>");
    }
  }); 
```  
As you see the password after _sha_ hash is:  
```  
  b89356ff6151527e89c4f3e3d30c8e6586c63962  
```  
So simply we can use online sha1 decrypters to decrypt the password for example I use http://www.hashkiller.co.uk/sha1-decrypter.aspx and the resualt is `adminz`  
Now `adminz` as password and the message is `FLAG-bXNsYg9tLCaIX6h1UiQMmMYB`.

Submit the flag and have fun ;)
