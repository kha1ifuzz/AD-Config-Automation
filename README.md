## Automating Active Directory Environment Configuration

These are collections of scripts and pieces of code that I use to set up my Active directory Home Lab for self practices or official trainings, mainly focused on security misconfigurations.
You can use these scripts individually or embed them in your other automation tools or scripts.

Most of the scripts within this repository are using "Active Directory Powershell Module" or using native windows programs that come pre-installed in windows OS's.
Hyper-V is my virtualization solution of choice when it comes to building any Windows environment and there is Powershell module to help you perform administration tasks on Hyper-V as well.

I categorized them and put them in 5 folders:
1. Domain Setup: scripts for configuring the DC and joining machines to the domain
2. Users-Groups-OUs Setup: creating AD users, groups and organizational units.
3. Group Policies: different group policies for different purposes like Password policy configuration and disabling security features.
4. AD Misconfigurations: different misconfiguration scripts allowing common AD Attacks
5. Misc: different configurations like disabling security features, configuring Fine Grained Policy and pushing to RDP local groups for the enhanced session at Hyper-V.

## Usage
One way to run these commands and scripts can be directly within the DC virtual machine (or other VMs).

Another way is to run them from the Hyper-V HOST OS which natively can interact with Hyper-V virtual machines using their VMName or VMId via PowerShell Direct. Below is an example of connecting to my Domain Controller Virtual Machine "DC-01" and executing a piece of code.

```powershell
$plainPassword = "Passw0rd!"
$password = $plainPassword | ConvertTo-SecureString -asPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential("domain\administrator", $password)

$session = New-PSSession -Vmname DC-01 -Credential $credential -Verbose
$code = {
	       <-------------- Code -------------->
	}
Invoke-Command -Session $session -ScriptBlock $code
```
For more information about PowerShell Direct: https://learn.microsoft.com/en-us/virtualization/hyper-v-on-windows/user-guide/powershell-direct
