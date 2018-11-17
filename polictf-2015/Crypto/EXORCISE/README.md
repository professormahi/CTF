### EXORCISE
##### 50 points
Question
--
Simple Exorcise. Get the key! Connect to  
`exorcise.polictf.it:80`
Readings
--


Answer
--
First we can use 'nc' to connect the server:
```bash
$ nc exorcise.polictf.it 80
2e0540472c37151c4e007f481c2a0110311204084f
[Stands for input]
```
I have used `null`(ctrl+space) for input and the result was:(null used because xor of any thing with null(zero) is the thing itself):  
```bash
$ nc exorcise.polictf.it 80
2e0540472c37151c4e007f481c2a0110311204084f
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@
2e0541677b5f746869735f31735f73305f73696d706c655f796f755f73686f756c645f686176655f736f6c7665645f5f69745f316e5f355f7365637d666c61677b5f746869735f31735f73305f73696d706c655f796f755f73686f756c645f686176655f736f6c7665645f5f69745f316e5f355f7365637d666c61495b161248101c2a11122d16102d1608091902027f0d071c2c53050a061f05380d410f0a2a531f1e1907053d3310543e5d1c3a512653020c09461809025b341111475310451b3a014736000c4d0404002c1c4f142d164805001f107f094114103110074c190344283a00063b110c26413a00
```
Now we must convert hex to string:  
```python
s="2e0541677b5f746869735f31735f73305f73696d706c655f796f755f73686f756c645f686176655f736f6c7665645f5f69745f316e5f355f7365637d666c61677b5f746869735f31735f73305f73696d706c655f796f755f73686f756c645f686176655f736f6c7665645f5f69745f316e5f355f7365637d666c61495b161248101c2a11122d16102d1608091902027f0d071c2c53050a061f05380d410f0a2a531f1e1907053d3310543e5d1c3a512653020c09461809025b341111475310451b3a014736000c4d0404002c1c4f142d164805001f107f094114103110074c190344283a00063b110c26413a00"
print s.decode('hex')
.Ag{_this_1s_s0_simple_you_should_have_solved__it_1n_5_sec}flag{_this_1s_s0_simp,Syou_should_have_solved__it_1n_5_sec}flaI[H*--       
A8
*S=3T>]:Q&S
                 	F	[4GSE:G6
                                              M,O-H	A1LD(:;
                                                                              &A
```

##### Flag: `flag{_this_1s_s0_simple_you_should_have_solved__it_1n_5_sec}`
