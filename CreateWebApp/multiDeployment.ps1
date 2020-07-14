$deploymentName = "LH Multi-sub-deployment"
$deploymentLocation = "Central US"
$templateFile = "azuredeploy.json"

# getting all subscriptions
$subscriptions = Get-AzSubscription | Where-Object { $_.Id -NotIn $excludedSubs }

foreach ($subscription in $subscriptions) {
        
    # set context to the current subscription
    $subscriptionId = $subscription.id
    Set-AzContext -SubscriptionId $subscriptionId

    # deploy the arm template
    New-AzSubscriptionDeployment -Name $deploymentName -Location $deploymentLocation `
        -TemplateParameterFile 
}