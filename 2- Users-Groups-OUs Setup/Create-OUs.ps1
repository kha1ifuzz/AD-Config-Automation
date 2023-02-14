
	# Import active directory module for running AD cmdlets
	Import-Module activedirectory

	#Store the data from the CSV in the $ADOU variable. 
	$ADOU = Import-csv .\OUs.csv

	#Loop through each row containing user details in the CSV file
	foreach ($ou in $ADOU)
	{
	#Read data from each field in each row and assign the data to a variable as below

		$name = $ou.name
		$path = $ou.path

		#Write-Output $name
		#Write-Output $path

	#Account will be created in the OU provided by the $OU variable read from the CSV file
	New-ADOrganizationalUnit -Name $name -Path $path
	}