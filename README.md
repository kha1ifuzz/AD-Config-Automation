### Automating AD Configuration

These are collection of scripts and piece of codes that I use to setup my Active directory Home Lab for self practice or the official trainings.

Most of the scripts within this repository are using "Active Directory Powershell Module" or using native windows programs that come pre-installed in windows OS.

Hyper-V is my virtualization solution of choice when it comes to building any Windows environment and there is Powershell module to help you perform administration tasks on Hyper-V as well.

One way to run these commands and scripts can be directly within the DC virtual machine (or other VMs).

Another way is to run them from the Hyper-V HOST OS which natively can interact with Hyper-V virtual machines using their VMName or VMId via PowerShell Direct. Below is an example of connecting to DC-01 virtual machine and executing a piece of code.

```powershell
$plainPassword = "Passw0rd!"
$password = $plainPassword | ConvertTo-SecureString -asPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential("alto\administrator", $password)

$session = New-PSSession -Vmname DC-01 -Credential $credential -Verbose
$code = {
	<---- here is the script or code you want to run on the virtual machine --->
	}
Invoke-Command -Session $session -ScriptBlock $code
```
For more information about PowerShell Direct: https://learn.microsoft.com/en-us/virtualization/hyper-v-on-windows/user-guide/powershell-direct
