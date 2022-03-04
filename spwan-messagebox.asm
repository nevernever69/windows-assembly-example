format PE GUI 

	include 'win32a.inc'
entry start

section '.data' data readable writeable 
	msgtext db 'everything has value', 0
	msgcaption db 'taught', 0
	
section '.text' code readable executable
start:		
	xor ecx, ecx	
	push ecx
	push msgcaption
	push  msgtext
	push  ecx
	call [MessageBox]
	add esp, 16
	
	push ecx
	push [ExitProcess]
section '.idata' import data readable
       library       KERNEL32,     'KERNEL32.DLL',\
                     USER32,       'USER32.DLL'
     
       import KERNEL32,\
              ExitProcess,         'ExitProcess'
     
       import USER32,\
              MessageBox,          'MessageBoxA'
