<# First command will check the "Do not require kerberos preauthentication option" which can be abused
using ASREPRoast attack.
Second command will simply set the Service Principal Name (SPN) for the specified account which 
will enable attackers to perform kerberoasting and request kerberos tickets
#>

#for AsRepRoasting
Set-ADAccountControl -Identity "CN=account-01,OU=Service accounts,DC=example,DC=com" -DoesNotRequirePreAuth $True

#for Kerberoasting
Setspn -S http/web-01.example.com:80 example\web.srvc