Configuration InstallOrchestrator
{
    param 
    ( 
         [Parameter(Mandatory)]
         [String]$ActivationKey,
    
         [Parameter(Mandatory)]
         [System.Management.Automation.PSCredential]$Admincreds

	 [Int]$RetryCount=20,
         [Int]$RetryIntervalSec=30
    )

    Import-DscResource -ModuleName xStorage, PSDesiredStateConfiguration, xPendingReboot

    Node localhost
    {
        LocalConfigurationManager 
        {
            RebootNodeIfNeeded = $true
        }

	WindowsFeature IIS
        {
            Ensure = 'Present'
            Name   = 'Web-Server'
        }

        xWaitforDisk Disk2
        {
            DiskNumber = 2
            RetryIntervalSec =$RetryIntervalSec
            RetryCount = $RetryCount
        }

        xDisk ADDataDisk {
            DiskNumber = 2
            DriveLetter = "F"
            DependsOn = "[xWaitForDisk]Disk2"
        }

    }
}