##### [Hash me please](http://ringzer0team.com/challenges/13)
##### Answer
As you see we must parse html and `sha-512` the text in 2 sec at first we must download the cipher text as our user.  
We can use `http://user:password@site.com` but it's not secure and usual, so we can simply use chrome and in the `inspect element > network tab` use `copy as cURL command` as image bellow.  
![copy as a cURL command](curl.png)  
then you can use the curl command to download the picture for me it's:  
```
curl 'http://ringzer0team.com/challenges/13' -H 'Accept-Encoding: gzip, deflate, sdch' -H 'Accept-Language: en-US,en;q=0.8,fa;q=0.6' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.94 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Referer: http://ringzer0team.com/challenges' -H 'Cookie: PHPSESSID=vdv1m2tlvqhcgqia6lv0nki1m5; _ga=GA1.2.1964209795.1426406003' -H 'Connection: keep-alive' -H 'Cache-Control: max-age=0' --compressed --output cipher
```
then we must parse the html file that has been saved as `cipher`  
```
cat cipher | egrep '[[:alnum:]]+<br />' | sed -r 's/<br \/>//g' | sed 's/ //g' | sed 's/\t//g' | head -c 1024 > res
```
you can parse the html in other ways too, or maybe with a programming language but I prefer linxu. The result is in the `res` file. Now we must make sha-512:  
```
cat res | sha512sum | head -c 128  > sha
```
the `sha` file conclude the result so simply send the result by the `curl`.  
```
curl "http://ringzer0team.com/challenges/13/$r" -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Connection: keep-alive' -H 'Accept-Encoding: gzip, deflate, sdch' -H 'Cookie: PHPSESSID=vdv1m2tivqhcgqia6lv0nkiim5; _ga=GA1.2.1964209795.1426406003' -H 'Accept-Language: en-US,en;q=0.8,fa;q=0.6' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.94 Safari/537.36' --compressed --output finalres
```
Now the flag is in the `final res` page. simply open it by `google-chrome`.
So the flag is `FLAG-mukgu5g2w932t2kx1nqnhhlhy4`.  
#### NOTE: The curl commands of mine are wrong and you can not use them directly ;), And the sample code attached :D
Keep calm while solving coding challenges :D
