# Simple script to make it easier to configure the intial networking on a Windows hosts

$IPAddress = Read-Host "What IP address should be used?"
$PrefixLength = Read-Host "What prefix length should be used?"
$DefaultGateway = Read-Host "What default gateway should be used?"
$DNSServer = Read-Host "What is the IP of the DNS server?"
$HostName = Read-Host "What computer name should be used?"

# Set Host's IP address and DNS server
New-NetIPAddress -InterfaceAlias "Ethernet0"  -IPAddress $IPAddress -PrefixLength $PrefixLength -DefaultGateway $DefaultGateway
Set-DnsClientServerAddress -InterfaceAlias "Ethernet0" -ServerAddress $DNSServer

# Set Host's computer name
Rename-Computer -NewName $HostName

