## Calculate the age grade percentage for a given masters athlete's mark

### Actor (User)
A general user with no special access

### Pre-conditions
- The database is running
- The server is running
- The web app is deployed
- The [Runalzye age grading library](https://github.com/Runalyze/age-grade) is included
- The Runalyze library is up to date and provides accurate information

### Main Flow
1. User navigates to a page that will display the age grade data
2. Use the Runalyze grading library to calculate the age grade
3. Hand data off to front end for display

### Alternate Flows
- If there is some sort of error with communication between the server and endpoint
  1. the user will be notified with an informative error message
- If provided information fails to return a valid age graded performance
  1. the user will be provided with a clear error message and the displayed value will clearly show a true value has failed to be calculated

### Post conditions
- Data calculated by the age grade tool shall be displayed to the user
