##### [I hate mathematics](http://ringzer0team.com/challenges/32)
##### Answer

The page ask us to compute the mathematical problem less than two minutes. First we'll use chrome `copy as a Curl` to send the request then. Then we'll use `Perl regex` to find the equation then use `bc` to compute the equation and then resend the result to page and gives the flag(code is [here](compute.sh)):  
```bash
#! /bin/bash
# set -x

curl 'http://ringzer0team.com/challenges/32' -H 'Accept-Encoding: gzip, deflate, sdch' -H 'Accept-Language: en-US,en;q=0.8,fa;q=0.6' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.94 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Referer: http://ringzer0team.com/challenges' -H 'Cookie: PHPSESSID=7c9s6eiht4aldv69gn529tn6p0; _gat=1; _ga=GA1.2.287352908.1433434274' -H 'Connection: keep-alive' -H 'Cache-Control: max-age=0' --compressed --out cipher


equation=`cat cipher | tr -d '\n\t\r' | grep -Po '(?:BEGIN MESSAGE -----<br \/>)(.*)(?:<br \/>----- END MESSAGE)'  | sed 's/BEGIN MESSAGE -----<br \/>//g' | sed 's/= ?<br \/>----- END MESSAGE//g'`

equation=`echo $equation | tr -d '+-' | sed 's/  / /g'`
first=`echo $equation | cut -d ' ' -f 1`
second=`echo $equation | cut -d ' ' -f 2 | sed 's/0x//g'`
third=`echo $equation | cut -d ' ' -f 3`

second=`echo "ibase=16; $second"|bc`
third=`echo "ibase=2; $third"|bc`

res=`echo "$first + $second - $third" | bc`

echo $res

curl "http://ringzer0team.com/challenges/32/$res" -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Connection: keep-alive' -H 'Accept-Encoding: gzip, deflate, sdch' -H 'Cookie: PHPSESSID=7c9s6eiht4aldv69gn529tn6p0; _ga=GA1.2.287352908.1433434274' -H 'Accept-Language: en-US,en;q=0.8,fa;q=0.6' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.94 Safari/537.36' --compressed --out result
```
And we open the `result` file using `firefox` and the flag is:  
`FLAG-JsxIhjHJekAiVaxJlNe2PAYZ`

###### "There is more Unix-nature in one line of shell script than there is in ten thousand lines of C.", Master Foo, [Rootless Root](http://catb.org/esr/writings/unix-koans/), Eric Steven Raymond

Happy capturing 3 points flag ;)
