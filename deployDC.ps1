# Simple script to make it easier to deploy a Forest, Domain, and DC 
# in my lab.  

# Prompts user for domain name
$DomainName = Read-Host "What domain name should be used"

# Install AD Domain Services
Install-WindowsFeature -Name "AD-Domain-Services" -IncludeManagementTools

# Create new forest and domain, when prompted enter a password for DSRM
Install-ADDSForest -DomainName $DomainName -InstallDns
