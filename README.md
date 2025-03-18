"# FluxCD" 


https://sammydefigueiredo0023@dev.azure.com/sammydefigueiredo0023/PortTest/_git/PortTest

9n3vRiwJTYZkfU4zyAZ6L5zEUkEczDWhbq7E6UcVaApIayRGnOaZJQQJ99BCACAAAAAjdLSoAAASAZDOugtE

7b12153b-bcc5-4b20-a2bf-858c1426d300


$url = "$($env:SYSTEM_TEAMFOUNDATIONCOLLECTIONURI)$env:SYSTEM_TEAMPROJECTID/_apis/git/repositories/$($env:REPOSITORY)/pullRequests/$($env:PR_ID)/reviewers/$($reviewerId)?api-version=7.0"
    $body = @{
        id = $reviewerId
        isRequired = "true"
    } | ConvertTo-Json
    $headers = @{
        Authorization = "Bearer $env:SYSTEM_ACCESSTOKEN"
    }
 
    $pipeline = Invoke-RestMethod -Uri $url -Method 'Put' -Body $body -ContentType 'application/json' -Headers $headers
    Write-Host "$($pipeline | ConvertTo-Json -Depth 100)"








trigger:
- master

pool:
  name: Default
  vmImage: ubuntu-latest

stages:
  - stage: 
    jobs:
    - job: 
      steps:
      - task: InvokeRESTAPI@1
        inputs:
          connectionType: 'connectedServiceName'
          serviceConnection: 'jenny'
          method: 'POST'
          body: |
            {
              "name": "Yeah",
              
              "capabilities": {
                "versioncontrol": {
                  "sourceControlType": "Git"
                },
                "processTemplate": {
                  "templateTypeId": "6b724908-ef14-45cf-84f8-768b5384da45"
                }
              }
            }
          urlSuffix: '_apis/projects?api-version=7.1'
          waitForCompletion: 'false'