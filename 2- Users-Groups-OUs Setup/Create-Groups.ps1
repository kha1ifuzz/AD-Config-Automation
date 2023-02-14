#Import active directory module for running AD cmdlets
#Author: Robert Allen

Import-Module ActiveDirectory

#Import CSV
$groups = Import-csv .\Groups.csv


# Loop through the CSV
    foreach ($group in $groups) {

    $groupProps = @{

      Name          = $group.name
      Path          = $group.path
      GroupScope    = $group.scope
      GroupCategory = $group.category

      }#end groupProps

    New-ADGroup @groupProps
    
} #end foreach loop
   