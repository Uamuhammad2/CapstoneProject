## View all meets

### Actor (User)
A general user of the application without admin access

### Pre-conditions
- The database is running
- The server is running
- The web app is deployed

### Main Flow
1. User naviates to the page to view all meets
2. Frontend selects the correct endpoint to direct the request to
3. Frontend will display a loading notification while waiting for the request to resolve
4. Backend handles the request by requesting information from the SQL server via query
5. Backend receives data in JSON format and hands back to frontend
6. Frontend formats data for displaying to the user
7. Web app displays all meets on record with a clickable name linking to the [individual meet page](https://github.com/sunnehh/AthleticsOntario/blob/main/documentation/use_cases/Pages/Meets_Page_Individual.md)

### Alternate Flows
- If there is some sort of error with communication between the server and endpoint
  1. the user will be notified with an informative error message

### Post conditions
- all results pertaining to the filters shall be displayed to the user
- clicking on a clickable field in the results page shall navigate to the corrisponding page
