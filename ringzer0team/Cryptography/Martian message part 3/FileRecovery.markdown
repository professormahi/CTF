#####[Martian message part 3](http://ringzer0team.com/challenges/26)
#####Answer

It was a hard problem so we use `hint` ;). It says we must base64 decode the message and then we must crack the `single-byte XOR key` message.  
```
$ echo -n "RU9CRC43aWdxNDsxaWtiNTFpYk9PMDs6NDFS" > 1
$ base64 -d 1; echo
EOBD.7igq4;1ikb51ibOO0;:41R
```
As You can see the key must be `'E' ^ 'F' =  03`. So we must decrypt the cipher text with `0x03`.  
We have code to xor to hex number:  
```
# BASH function to get the result
# of a ^ b when a, b are in the
# following hexadecimal string
# form: AF396463D8705 ...

# Obtained from here:
# http://www.codeproject.com/Tips/470308/XOR-Hex-Strings-in-Linux-Shell-Script
# Author is Sanjay1982 (see http://www.codeproject.com/Members/Sanjay1982)

# Usage:
# $ xor AB20FF40 DD14FABC

function  xor()
{
local res=(`echo "$1" | sed "s/../0x& /g"`)
shift 1
while [[ "$1" ]]; do
    local one=(`echo "$1" | sed "s/../0x& /g"`)
    local count1=${#res[@]}
    if [ $count1 -lt ${#one[@]} ]
    then
          count1=${#one[@]}
    fi
    for (( i = 0; i < $count1; i++ ))
    do
          res[$i]=$((${one[$i]:-0} ^ ${res[$i]:-0}))
    done
    shift 1
done
printf "%02x" "${res[@]}"
}
```
And we use it like this:  
```
$ xor 454f42442e37696771343b31696b62353169624f4f303b3a343152 030303030303030303030303030303030303030303030303030303; echo
464c41472d346a64723738326a686136326a614c4c333839373251
```
So the flag is `FLAG-4jdr782jha62jaLL38972Q`.

######NOTE: To convert hex and string together you can use [this](hexConvert.py)

Sometimes we can use hints ;)
