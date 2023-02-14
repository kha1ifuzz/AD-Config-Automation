<# this will give user-01 permission to add himself to the specified group
this group might have some high privileges which can be abused 
------------------- 
you can replace $ADUserName and $GroupPath variables
#>
	
	$ADUserName = "user-01"
	$GroupPath = "AD:\CN=Server Admins,OU=IT,DC=example,DC=com"
	$ADUser = Get-ADUser -Identity $ADUserName
	
 	$IdentityRef = [System.Security.Principal.IdentityReference] $ADUser.SID
	$SelfMemberGUID = [GUID]"bf9679c0-0de6-11d0-a285-00aa003049e2"
	$ZeroGUID =  [GUID]"00000000-0000-0000-0000-000000000000"
	
	$AccessRule = New-Object System.DirectoryServices.ActiveDirectoryAccessRule($IdentityRef, "self", "Allow", $SelfMemberGUID, "None", $ZeroGUID)
 
	$ACL = Get-Acl -Path $GroupPath
	$ACL.AddAccessRule($AccessRule)
	Set-Acl -Path $GroupPath -AclObject $ACL