$RG = 'SystemCenterLab'
$location = 'EASTUS2'
$templateuri = 'https://github.com/wilsonmse/SystemCenterLab/blob/master/active-directory-new-domain/azuredeploy.json'

New-AzResourceGroup -Name $rg -Location $location #use this command when you need to create a new resource group for your deployment
New-AzResourceGroupDeployment -ResourceGroupName $RG -TemplateUri $templateuri