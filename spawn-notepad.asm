format PE GUI
	include 'win32a.inc'
entry start

section '.data' data readable writeable

	note db 'notepad.exe', 0
	 StartupInfo STARTUPINFO
 	ProcessInfo PROCESS_INFORMATION	
section '.text' code readable executable
start:
	push ProcessInfo
	push StartupInfo
	push 0
	push 0
	push 0
	push 0
	push 0
	push 0
	push note
	push 0
	call [CreateProcessA]
	add  esp, 28	
	push 0
	call [ExitProcess]



section '.idata' import data readable
       library       KERNEL32,     'KERNEL32.DLL',\
                     USER32,       'USER32.DLL'
     
       import KERNEL32,\
              ExitProcess,         'ExitProcess',\
	      CreateProcessA,       'CreateProcessA'     
