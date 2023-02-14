<# this Group Policy can be used to Bypass the Powershell Execution Policy in domain joined machines 
which might be helpful in some security testings #>

#Create the GPO
New-GPO -Name "DisablePSEP" -Comment "set powershell execution policy to bypass"

#Configure the GPO
Set-GPRegistryValue -Name "DisablePSEP" -Key "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\PowerShell" -ValueName EnableScripts -Type DWord -Value 1
Set-GPRegistryValue -Name "DisablePSEP" -Key "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\PowerShell" -ValueName ExecutionPolicy -Type String -Value Unrestricted

#Link the GPO to an Organizational Unit / Domain / Site
New-GPLink -Name "DisablePSEP" -Target "ou=IT Computers,ou=IT,dc=example,dc=com"

#security filtering, if you want to apply it to only certain machines.
Set-GPPermission -Name "DisablePSEP" -TargetName "wks-01" -TargetType Computer -PermissionLevel GPOApply