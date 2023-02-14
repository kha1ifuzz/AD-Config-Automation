# this is to configure the Domain Controller Network settings and Computer name.

netsh int ip set address "ethernet" static 10.0.0.2 255.255.255.0 10.0.0.1 1
netsh int ip set dns "ethernet" static 10.0.0.2 primary
	
Rename-Computer -NewName "DC-01"

Restart-Computer -Force -Verbose