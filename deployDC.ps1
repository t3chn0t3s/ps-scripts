# Simple script to make it easier to deploy a Forest, Domain, and DC 
# in my lab.  

$IPAddress = Read-Host "What IP address should be used?"
$PrefixLength = 24
$DefaultGateway = Read-Host "What default gateway should be used?"
$ComputerName = Read-Host "What computer name should be used?"
$DomainName = Read-Host "What domain name should be used"


# Set DC's IP address and DNS server
New-NetIPAddress -InterfaceAlias "Ethernet0"  -IPAddress $IPAddress -PrefixLength $PrefixLength -DefaultGateway $DefaultGateway
Set-DnsClientServerAddress -InterfaceAlias "Ethernet0" -ServerAddress $IPAddress

# Set DC's computer name
Rename-Computer -NewName $ComputerName

# Install AD Domain Services
Install-WindowsFeature -Name "AD-Domain-Services" -IncludeManagementTools

# Create new forest and domain, when prompted enter a password for DSRM
Install-ADDSForest -DomainName $DomainName -InstallDns
