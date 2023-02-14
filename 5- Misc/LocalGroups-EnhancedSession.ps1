<# this script is helpful when you have some limited number of users that you want to push to
a limited number of machiness local groups instead of creating Restricted Group Policy.
it was helpful to push the AD users to the "Remote Desktop Users" local group within the joined 
domain machines. It enables us to use the Enhanced Session within Hyper-V
#>

# this is to push users to RDP Groups at target computers for enhanced session at HyperV
Invoke-Command -ComputerName wks-01 -ScriptBlock{Add-LocalGroupMember -Group "Remote Desktop Users" -Member "example\user-01", "example\admin-01"}
