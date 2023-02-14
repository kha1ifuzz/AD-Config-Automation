<# this Group Policy can be used to disable DeviceGuard in domain joined machines which might be helpful
in some security testing #>

#Create the GPO
New-GPO -Name "DisableDeviceGuard" -Comment "disable DeviceGuard"

#Configure the GPO
Set-GPRegistryValue -Name "DisableDeviceGuard" -Key "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\DeviceGuard" -ValueName EnableVirtualizationBasedSecurity -Type DWord -Value 0
Set-GPRegistryValue -Name "DisableDeviceGuard" -Key "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\LSA" -ValueName LsaCfgFlags -Type DWord -Value 0

#Link the GPO to an Organizational Unit / Domain / Site
New-GPLink -Name "DisableDeviceGuard" -Target "ou=IT Computers,ou=IT,dc=example,dc=com"

#security filtering, if you want to apply it to only certain machines.
Set-GPPermission -Name "DisableDeviceGuard" -TargetName "wks-01" -TargetType Computer -PermissionLevel GPOApply

