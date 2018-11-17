##### [3 / 3 Suspicious account password?](http://ringzer0team.com/challenges/88)
##### Answer

First we must unzip the file:
```
  $ uz 5bd2510a83e82d271b7bf7fa4e0970d2.zip

  Extracting from  "5bd2510a83e82d271b7bf7fa4e0970d2.zip".
  Archive:  5bd2510a83e82d271b7bf7fa4e0970d2.zip
    inflating: 5bd2510a83e82d271b7bf7fa4e0970d1
```
As we see the file is windows memory dump file and [volatility](http://code.google.com/p/volatility) can monitor the memory dump.  
To install `volatility` you must install python and some other python libraries:  
```
$ sudo apt-get install python pip -y
  .
  .
  .
$ pip install Distorm Yara PyCrypto     # Recommended
$ tar zxvf volatility
  .
  .
  .
$ python setup.py build
  .
  .
  .
$ python setup.py build install  
```
Then we'll see the image info:  
```
$ python volatility-2.3.1/vol.py imageinfo -f 5bd2510a83e82d271b7bf7fa4e0970d1

  Volatility Foundation Volatility Framework 2.3.1
  Determining profile based on KDBG search...

            Suggested Profile(s) : Win7SP0x86, Win7SP1x86
                       AS Layer1 : IA32PagedMemory (Kernel AS)
                       AS Layer2 : FileAddressSpace (/home/mahdi/Documents/MyWorms/5bd2510a83e82d271b7bf7fa4e0970d1)
                        PAE type : No PAE
                             DTB : 0x185000L
                            KDBG : 0x82920be8
            Number of Processors : 1
       Image Type (Service Pack) : 0
                  KPCR for CPU 0 : 0x82921c00
               KUSER_SHARED_DATA : 0xffdf0000
             Image date and time : 2014-03-09 20:57:55 UTC+0000
       Image local date and time : 2014-03-09 13:57:55 -0700
```  
As you see in the `info` the  suggested profile is `Win7SP0x86`. Now we want to see the `hivelist`:  
```
$ python volatility-2.3.1/vol.py --profile Win7SP0x86 hivelist -f 5bd2510a83e82d271b7bf7fa4e0970d1

  Volatility Foundation Volatility Framework 2.3.1
  Virtual    Physical   Name
  ---------- ---------- ----
  0x879d0008 0x0c824008 \Device\HarddiskVolume1\Boot\BCD
  0x87bd88d8 0x0c0958d8 \SystemRoot\System32\Config\SOFTWARE
  0x93d47008 0x03bf3008 \??\C:\Users\flag\ntuser.dat
  0x93d4f580 0x01970580 \??\C:\Users\flag\AppData\Local\Microsoft\Windows\UsrClass.dat
  0x82090450 0x06491450 \SystemRoot\System32\Config\SAM
  0x820984a0 0x06bab4a0 \??\C:\Windows\ServiceProfiles\LocalService\NTUSER.DAT
  0x820a0558 0x05c85558 \SystemRoot\System32\Config\SECURITY
  0x8210e0d0 0x063e80d0 \??\C:\Windows\ServiceProfiles\NetworkService\NTUSER.DAT
  0x8780c008 0x0029b008 [no name]
  0x87819938 0x00122938 \REGISTRY\MACHINE\SYSTEM
  0x878419d0 0x0008c9d0 \REGISTRY\MACHINE\HARDWARE
  0x878c5008 0x0b6b7008 \SystemRoot\System32\Config\DEFAULT
```  
Now we use `SYSTEM` hex and `SAM` to use `hashdump` command:  
```
$ python volatility-2.3.1/vol.py --profile Win7SP0x86 hashdump -y 0x87819938 -s 0x82090450 -f 5bd2510a83e82d271b7bf7fa4e0970d1

  Volatility Foundation Volatility Framework 2.3.1
  Administrator:500:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
  Guest:501:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
  flag:1000:aad3b435b51404eeaad3b435b51404ee:3008c87294511142799dca1191e69a0f:::

```  
Now we can use a [NTLM decryptor](http://www.hashkiller.co.uk/ntlm-decrypter.aspx) to decrypt the password. The result is  `admin123`.

Keep calm and enjoy your captured flag ;)
