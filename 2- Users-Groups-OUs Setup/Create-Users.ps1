#credit: https://activedirectorypro.com

Import-Module activedirectory

#Store the data from ADUsers.csv in the $ADUsers variable
$Users = Import-csv .\Users.csv

#Loop through each row containing user details in the CSV file 
foreach ($User in $Users) {
    # Read user data from each field in each row
    # the username is used more often, so to prevent typing, save that in a variable

        # create a hashtable for splatting the parameters
        $userProps = @{
            SamAccountName				= $User.SamAccountName                   
            Name						= $User.Name
			GivenName					= $User.GivenName 
            Surname						= $User.Surname
            AccountPassword				= (ConvertTo-SecureString $User.Password -AsPlainText -Force)
			UserPrincipalName			= $user.UserPrincipalName
			Path						= $User.Path
            Enabled						= $true
            ChangePasswordAtLogon		= $false
			PasswordNeverExpires 		= $true
        }   #end userprops   

         New-ADUser @userProps

    } #end else
	
	timeout /t 10 /nobreak
	#add users to their groups
	Add-ADGroupMember -Identity 'Srvc Accounts' -Members 'roasted.srvc','iis.srvc'
	Add-ADGroupMember -Identity 'Local Admins' -Members 'ITAdmin.user'
	Add-ADGroupMember -Identity 'Domain Admins' -Members 'DAdmin.user'
   