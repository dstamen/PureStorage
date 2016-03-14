# PureStorage Powershell SDK Script to set Syslog Server
# @davidstamen
# http://davidstamen.com

#Define Variables
$cred = Get-Credential
$arrays = "pure.lab.local"
$SysLogServers = "tcp://syslog.lab.local"

#Cycles through each UCS setting values
Foreach ($array in $arrays) {
  Write-Host "Setting Syslog Information for $array"
  $FlashArray = New-PfaArray -EndPoint $array -Credentials $cred -IgnoreCertificateError
  Set-PfaSyslogServers -Array $FlashArray -SyslogServers $SyslogServers|fl
}
