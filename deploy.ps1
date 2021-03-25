$RG = 'SystemCenterLab'
$location = 'EASTUS2'
$templateuri = 'https://raw.githubusercontent.com/wilsonmse/SystemCenterLab/Reestruturado/Main.json'

New-AzResourceGroup -Name $rg -Location $location #use this command when you need to create a new resources group for your deployment
New-AzResourceGroupDeployment -ResourceGroupName $RG -TemplateUri $templateuri