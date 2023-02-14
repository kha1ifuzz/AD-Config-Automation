#this script will create the Fine Grained Policy, add the target users, and change their passwords according to the new policy

New-ADFineGrainedPasswordPolicy -Name "Admins Passwords" -Precedence 1 -ComplexityEnabled $true -Description "complex admin Passwords" -DisplayName "admins Passwords" -LockoutObservationWindow "00:00:00" -MinPasswordLength 14 -MaxPasswordAge "00:00:00" -MinPasswordAge "00:00:00" -LockoutDuration "00:30:01" -PasswordHistoryCount 3

add-ADFineGrainedPasswordPolicySubject -Identity "Admins Passwords" -Subjects admin-01
add-ADFineGrainedPasswordPolicySubject -Identity "Admins Passwords" -Subjects admin-02

Set-ADAccountPassword -Identity admin-01 -NewPassword (ConvertTo-SecureString -AsPlainText "Comp13Xp@ss30Rd" -Force)
Set-ADAccountPassword -Identity admin-02 -NewPassword (ConvertTo-SecureString -AsPlainText "Comp13Xp@ss30Rd" -Force)

