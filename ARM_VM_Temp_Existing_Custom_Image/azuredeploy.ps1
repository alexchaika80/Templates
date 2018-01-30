# Variables that need to be set to start working with ARM.

# The subscriptionId
#$subscriptionId = '82d2827b-ba1a-4e5c-a8dd-8f92ca4e41b3' #devqa
$subscriptionId = '<Azure Subscribtion Id>' #prod

# Root path to script, template and parameters.  All have to be in the same folder.
$rootPathToFiles = 'C:\ARM_VM_Temp_Existing_Custom_Image'

# Name of the resource group you are targeting the deployment into
$resourceGroupName = 'Resource Group Name'

# Resource Group Location 
$resourceGroupLocation = 'East US 2' # Run <Get-AzureLocation> to find out azure locations; EXAMPLE: 'East US 2'

# Name of the deployment; User friendly name to reference the deployment.
$deploymentName = '<Deployment Name>'

# Authenticate Against you Azure Tenant
Login-AzureRmAccount

# List subscriptions that are available to you
Get-AzureSubscription

# Select the subscription you want to work on
Select-AzureRmSubscription -SubscriptionId $subscriptionId

# Create the new Azure Resource Group
New-AzureRmResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation -Force

# Run the below to test the ARM template
Test-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile "$rootPathToFiles\azuredeploy.json" -TemplateParameterFile "$rootPathToFiles\azuredeploy.parameters.json"

# Deploy the ARM template using the parameter file
New-AzureRmResourceGroupDeployment -verbose -Name $deploymentName -ResourceGroupName $resourceGroupName -TemplateFile "$rootPathToFiles\azuredeploy.json" -TemplateParameterFile "$rootPathToFiles\azuredeploy.parameters.json"

