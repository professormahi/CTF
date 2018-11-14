#! /usr/bin/env python

def string2Bytes(s):
	return [ord(x) for x in s]

def bytes2String(s):
	return ''.join(chr(x) for x in b)

def string2Hex(s):
	return s.encode('hex')

def hex2String(s):
	return s.decode('hex')

def bytes2Hex(s):
	return string2Hex(bytes2String(s))

def hex2Bytes(s):
	return string2Bytes(hex2String(s))

import sys
# --hex2Bytes
# --hex2String
# --string2Hex
# --bytes2Hex
# --string2Bytes
# --bytes2String

if len(sys.argv) < 3:
	sys.exit('Usage: %s option text' % sys.argv[0])

if sys.argv[1] == '--hex2Bytes':
	print hex2Bytes(sys.argv[2])
elif sys.argv[1] == '--hex2String':
	print hex2String(sys.argv[2])
elif sys.argv[1] == '--string2Hex':
	print string2Hex(sys.argv[2])
elif sys.argv[1] == '--bytes2Hex':
	print bytes2Hex(sys.argv[2])
elif sys.argv[1] == '--string2Bytes':
	print string2Bytes(sys.argv[2])
elif sys.argv[1] == '--bytes2String':
	print bytes2String(sys.argv[2])
else:
	sys.exit('Option error')

