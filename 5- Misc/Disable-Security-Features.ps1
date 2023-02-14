<# Other than creating GPOs to acheive the same as shown in some other scripts within 
the repository, these commands can be used Enable PSRemoting, bypass PS policy and
disable MS AV features (assure tamper protection is off in Win 10, which is not enabled in windows server) 
#>

	
Enable-PSRemoting #Enable PowerShell Remoting (start WinRM automates its startup, and open the necessary ports in FW)
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False #disable FW profiles (also "netsh advfirewall set allprofiles state off")
Set-ExecutionPolicy bypass #to bypass Powershell execution Policy

#disable Windows Defender features like Real Time Monitoring
Set-MpPreference -DisableRealtimeMonitoring $true
Set-MpPreference -DisableBehaviorMonitoring $true 
Set-MpPreference -DisableScriptScanning $true
Set-MpPreference -DisableArchiveScanning $true
Set-MpPreference -DisableBlockAtFirstSeen $true
Set-MpPreference -DisableScanningNetworkFiles $true

#for disabling Windows Defender's features, refer to: https://learn.microsoft.com/en-us/powershell/module/defender/set-mppreference?view=windowsserver2022-ps