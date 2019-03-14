#!/usr/bin/liquidsoap
# Log dir
#set("log.file.path","/home/ubuntu/soap/logs/radio.log")

output.shoutcast(%mp3, host = "localhost", 
	port = 8000, 
	password = "moduation", 
	mksafe(playlist("/home/ubuntu/music")),
	name = "MyMusic",
	url="moduation.co.uk:8000/listen.pls?sid=1"
)

