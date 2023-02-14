<# the first command in this script will set the computer object "WKS-02" with unconstrained delegation 
2nd command is to set the msDS-AllowedToDelegateTo of the specified account for the constrained delegation to HOST
and the 3rd one is to set the account with TrustedToAuthforDelegation (T2A4D)
#>

#unconstrained delegation
Get-ADComputer -Identity WKS-02 | Set-ADAccountControl -TrustedForDelegation $true
	
#constrained delegation
Set-ADObject -Identity "CN=web.srvc,OU=Service accounts,DC=example,DC=com" -Add @{'msDS-AllowedToDelegateTo'=@('HOST/DC-01/example','HOST/DC-01.example.com/example')}
Set-ADAccountControl -Identity "CN=web.srvc,OU=Service accounts,DC=example,DC=com" -TrustedForDelegation $false -TrustedToAuthForDelegation $true