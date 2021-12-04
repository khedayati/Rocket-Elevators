# Week 10 Consolidation

## URL for zendesk
https://khashayarcodeboxx.zendesk.com

The credentials to access this website are for the zendesk API:

email: jns1ma  'AT' outlook DOT com

password: 




==================================================================================


# Rocket_Rest_Consolidation

Project built with dotnet 5.0.12

<br>
 The API address is: https://rocketrestapinet.azurewebsites.net/

For the PUT requests, a JSON can be sent to modify the status of an intervention like so:

{
    "status": "InProgress"
}

The id of the intervention must be included in the url for the PUT method like so:

api/interventions/update-to-pending/{id}

Here's an example with [Postman](https://www.postman.com/):

1. PUT method in Postman
![First step in Postman](https://github.com/khedayati/Rocket-Elevators-Foundation/blob/master/images/rest_api_1.png?raw=true)

2. Response
![Second step in Postman](https://github.com/khedayati/Rocket-Elevators-Foundation/blob/master/images/rest_api_2.png?raw=true)

<br>

# These are the paths for the API: 

[1- Get pending interventions](https://rocketrestapinet.azurewebsites.net/api/interventions/get-pending-interventions)

[2- Change the status of an intervention to "InProgress"](https://rocketrestapinet.azurewebsites.net/api/interventions/update-to-pending/id)
 
[3- Change the status of an intervention to "Completed"](https://rocketrestapinet.azurewebsites.net/api/interventions/update-to-completed/id)

<br>

# NOTE:
 Each link works individually as well , by changing the ID or status you can test different senarios on each one. 