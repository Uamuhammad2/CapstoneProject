## View ranking page

### Actor (User)
A general user of the application without admin access

### Pre-conditions
- The database is running
- The server is running
- The web app is deployed

### Main Flow
1. User navigates to the ranking page
2. Web app displays a set of filters
3. User selects all filters they want to view and clicks the search button
4. Frontend selects the correct endpoint to direct the request to
5. Frontend will display a loading notification while waiting for the request to resolve
6. Backend handles the request by requesting information from the SQL server via query
7. Backend receives data in JSON format and hands back to frontend
8. Frontend formats data for displaying to the user

### Alternate Flows
- If combination of filters returns no results
  1. the loading notification will change to a no results notification 
- If there is some sort of error with communication between the server and endpoint
  1. the user will be notified with an informative error message

### Post conditions
- all results pertaining to the filters shall be displayed to the user
- clicking on a clickable field in the results page shall navigate to the corrisponding page
