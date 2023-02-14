<# this Group Policy can be used to enable WinRM in domain joined machines, 
which might be helpful in some security testings and powershell remoting#>

#Create the GPO
New-GPO -Name "EnableWinRM" -Comment "automate starting WinRM on target computers"

#Configure the GPO Screensaver Timeout
Set-GPRegistryValue -Name "EnableWinRM" -Key "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WinRM\Service" -ValueName AllowAutoConfig -Type DWord -Value 1
Set-GPRegistryValue -Name "EnableWinRM" -Key "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WinRM\Service" -ValueName IPv4Filter -Type String -Value *
Set-GPRegistryValue -Name "EnableWinRM" -Key "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WinRM\Service" -ValueName IPv6Filter -Type String -Value *

#Link the GPO to an Organizational Unit / Domain / Site
New-GPLink -Name "EnableWinRM" -Target "ou=IT Computers,ou=IT,dc=example,dc=com"

#add the security filtering, uncomment if not needed
Set-GPPermission -Name "EnableWinRM" -TargetName "wks-01" -TargetType Computer -PermissionLevel GPOApply

timeout /t 10 /nobreak

#set remote computers to start WinRM service automatically (needs restart)
Set-Service -Name "WinRM" -StartupType "Automatic" -ComputerName wks-01
