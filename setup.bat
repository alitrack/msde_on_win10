takeown /f %SystemRoot%\SysWOW64\sqlunirl.dll /a
icacls %SystemRoot%\SysWOW64\sqlunirl.dll /grant *S-1-5-32-544:f
IF NOT EXIST %SystemRoot%\SysWOW64\sqlunirl.bak move %SystemRoot%\SysWOW64\sqlunirl.dll %SystemRoot%\SysWOW64\sqlunirl.bak
C:\MSDERelA\setup.exe INSTANCENAME="alitrack" SAPWD="dotcom" SECURITYMODE="sql"
net start mssql$alitrack
move /y %SystemRoot%\SysWOW64\sqlunirl.bak %SystemRoot%\SysWOW64\sqlunirl.dll
icacls %SystemRoot%\SysWOW64\sqlunirl.dll /remove *S-1-5-32-544
icacls %SystemRoot%\SysWOW64\sqlunirl.dll /grant *S-1-5-32-544:(GR,GE,WO)
icacls %SystemRoot%\SysWOW64\sqlunirl.dll /setowner *S-1-5-80-956008885-3418522649-1831038044-1853292631-2271478464
pause
