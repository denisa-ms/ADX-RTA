# Connect-AzAccount
$SubscriptionId = '<subscriptionId>'
$resourceGroupName = "adxanalytics-rg"
$location = "westeurope"


# Set subscription 
Set-AzContext -SubscriptionId $subscriptionId 
# Create a resource group
New-AzResourceGroup -Name $resourceGroupName -Location $location

New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile deployAll.bicep -WarningAction:SilentlyContinue
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile .\ADF_pipeline2.json -WarningAction:SilentlyContinue
