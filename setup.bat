takeown /f %SystemRoot%\SysWOW64\sqlunirl.dll /a
icacls %SystemRoot%\SysWOW64\sqlunirl.dll /grant *S-1-5-32-544:f
IF NOT EXIST %SystemRoot%\SysWOW64\sqlunirl.bak move %SystemRoot%\SysWOW64\sqlunirl.dll %SystemRoot%\SysWOW64\sqlunirl.bak
C:\MSDERelA\setup.exe INSTANCENAME="alitrack" SAPWD="dotcom" SECURITYMODE="sql"
move /y %SystemRoot%\SysWOW64\sqlunirl.bak %SystemRoot%\SysWOW64\sqlunirl.dll
move /y C:\Windows\SysWOW64\sqlunirl.dll "C:\Program Files (x86)\Microsoft SQL Server\80\Tools\Binn"
copy /y C:\Windows\SysWOW64\sqlunirl.dll "C:\Program Files (x86)\Microsoft SQL Server\80\COM"
copy /y C:\Windows\SysWOW64\sqlunirl.dll "C:\Program Files (x86)\Microsoft SQL Server\Mssql$InstanceName\BinnMSSQL$InstanceName\Binn"
move /y C:\Windows\SysWOW64\sqlunirl.bak C:\Windows\SysWOW64\sqlunirl.dll
icacls %SystemRoot%\SysWOW64\sqlunirl.dll /remove *S-1-5-32-544
icacls %SystemRoot%\SysWOW64\sqlunirl.dll /grant *S-1-5-32-544:(GR,GE,WO)
icacls %SystemRoot%\SysWOW64\sqlunirl.dll /setowner *S-1-5-80-956008885-3418522649-1831038044-1853292631-2271478464
net start mssql$alitrack
pause
