<# 
can be used to create scheduled task to run programs or batch files which i usually use 
to simulate some automated activities like copying files from machine to another 
which can be used in capturing Net-NTLMv1/v2 for example
#>

schtasks /Create /tn "automated backup" /RU Administrator /RP Passw0rd! /SC Minute /MO 5 /tr "C:\automated-backup.bat"