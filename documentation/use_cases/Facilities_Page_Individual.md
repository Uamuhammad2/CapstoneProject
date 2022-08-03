## View individual facility

### Actor (User)
A general user of the application without admin access

### Pre-conditions
- The database is running
- The server is running
- The web app is deployed

### Main Flow
1. User clicked on a name in any of the menus 
2. Frontend selects the correct endpoint to direct the request to
6. Backend handles the request by requesting information from the SQL server via query of the facility name
7. Backend receives data of the club and in JSON format and hands it back to the frontend
8. Frontend formats data for displaying to the user

### Alternate Flows
- If there is some sort of error with communication between the server and endpoint
  1. the user will be notified with an informative error message

### Post conditions
- all results pertaining to the filters shall be displayed to the user
- clicking on a clickable field in the results page shall navigate to the corrisponding page