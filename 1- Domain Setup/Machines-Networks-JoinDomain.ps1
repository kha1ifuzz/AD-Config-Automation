#this script will set the machine's ip address and DNS, then join to the domain and specify its OU path

netsh int ip set address "ethernet" static 10.0.0.101 255.255.255.0 10.0.0.2 1
netsh int ip set dns "ethernet" static 10.0.0.2 primary
#LocalCredential "HostAdmin" is used to specify the local admin account who has permission to run the command. 
#Credential is for Domain Admin who has permission to join the machine to the domain
Add-Computer -DomainName "example.com" -NewName "WKS-01" -OUPath "OU=IT Computers,OU=IT,DC=example,DC=com" -LocalCredential HostAdmin -Credential example\administrator -Restart -Force
