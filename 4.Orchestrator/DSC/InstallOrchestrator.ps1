Configuration InstallOrchestrator
{
    param 
    ( 
         [Parameter(Mandatory)]
         [String]$ActivationKey,
    
         [Parameter(Mandatory)]
         [System.Management.Automation.PSCredential]$Admincreds
    )
    Node localhost
    {
        WindowsFeature IIS
        {
            Ensure = 'Present'
            Name   = 'Web-Server'
        }
    }
}