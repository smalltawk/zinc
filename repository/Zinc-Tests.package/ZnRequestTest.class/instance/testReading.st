testing
testReading
	| input request |
	input := 'GET /foo.html HTTP/1.1', String crlf, 
		'Host: foo.com', String crlf, 
		'Agent: SUnit', String crlf, 
		String crlf.
	request := ZnRequest readFrom: input readStream.
	self assert: request method equals: #GET.
	self assert: request hasHeaders.
	self assert: (request headers at: 'Host') equals: 'foo.com'.
	self assert: request hasEntity not
