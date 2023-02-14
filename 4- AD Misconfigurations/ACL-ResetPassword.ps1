<# it will give the user-01, the permission to perform "reset password" over "Users" Container in AD
hence, he will have the ability to reset passwords of users under the "Users" Container 
------------------- 
you can replace $ADUserName and $OUnit variables 
#>

$ADUserName = "user-01"
$OUnit = "AD:\CN=Users,DC=example,DC=com"
$ADUser = Get-ADUser -Identity $ADUserName
$IdentityRef = [System.Security.Principal.IdentityReference] $ADUser.SID
$ResetPasswordGUID = [GUID]"00299570-246d-11d0-a768-00aa006e0529"
$UsersGUID =  [GUID]"bf967aba-0de6-11d0-a285-00aa003049e2" 
	
$AccessRule = New-Object System.DirectoryServices.ActiveDirectoryAccessRule($IdentityRef, "ExtendedRight", "Allow", $ResetPasswordGUID, "Descendents", $UsersGUID)
 
$ACL = Get-Acl -Path $OUnit 
$ACL.AddAccessRule($AccessRule)
Set-Acl -Path $OUnit -AclObject $ACL