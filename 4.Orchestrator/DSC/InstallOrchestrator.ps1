Configuration InstallOrchestrator
{
    Node localhost
    {
        WindowsFeature IIS
        {
            Ensure = 'Present'
            Name   = 'Web-Server'
        }
    }
}