# this will install your AD forest and DNS and you can change domainName and domain variables
# https://learn.microsoft.com/en-us/powershell/module/addsdeployment/install-addsforest?view=windowsserver2022-ps

	$domainName = "example"
    $domain = "example.com"

    Write-Host "Installing management tools"
    Import-Module ServerManager
    Add-WindowsFeature RSAT-AD-PowerShell,RSAT-AD-AdminCenter

    Write-Host "Deploying Active Directory Domain..."
    Install-WindowsFeature AD-domain-services, DNS -IncludeAllSubFeature -IncludeManagementTools -Restart
    Import-Module ADDSDeployment
    Install-ADDSForest `
    -SafeModeAdministratorPassword $password `
    -CreateDnsDelegation:$false `
    -DatabasePath "C:\Windows\NTDS" `
    -DomainMode "7" `
    -DomainName $domain `
    -DomainNetbiosName $domainName `
    -ForestMode "7" `
    -InstallDns:$true `
    -LogPath "C:\Windows\NTDS" `
    -NoRebootOnCompletion:$true `
    -SysvolPath "C:\Windows\SYSVOL" `
    -Force:$true

	Restart-Computer -Force -Verbose