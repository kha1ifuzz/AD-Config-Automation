<# this is to give the AD User "user-01" generic write permission over the computer comp-01
which allows to perform the Resource Based Constrained Delegation attack (RBCD) 
------------------- 
you can replace $ADUserName and $ComputerPath variables 
#>

$ADUserName = "user-01"
$ComputerPath = "AD:\CN=comp-01,OU=IT Computers,OU=IT,DC=example,DC=com"
$ADUser = Get-ADUser -Identity $ADUserName
$IdentityRef = [System.Security.Principal.IdentityReference] $ADUser.SID
	
$AccessRule = New-Object System.DirectoryServices.ActiveDirectoryAccessRule($IdentityRef, "GenericWrite", "Allow")
 
$ACL = Get-Acl -Path $ComputerPath
$ACL.AddAccessRule($AccessRule)
Set-Acl -Path $ComputerPath -AclObject $ACL