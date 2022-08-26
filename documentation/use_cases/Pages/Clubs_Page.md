## View all Facilities

### Actor (User)
A general user of the application without admin access

### Pre-conditions
- The database is running
- The server is running
- The web app is deployed

### Main Flow
1. User navigates to the all facilities page
2. Frontend selects the correct endpoint to direct the request to
3. Frontend will display a loading notification while waiting for the request to resolve
4. Backend handles the request by requesting information from the SQL server via query
5. Backend receives data in JSON format and hands back to frontend
6. Frontend formats data for displaying to the user
7. Web app displays a list of all facilities sorted by club points with an option to sort alphabetically or search bar
    - upon clicking a club, the user will be redirected to [the individual club page](https://github.com/sunnehh/AthleticsOntario/blob/main/documentation/use_cases/Pages/Clubs_Page_Individual)

### Alternate Flows
- If there is some sort of error with communication between the server and endpoint
  1. the user will be notified with an informative error message

### Post conditions
- clicking on a clickable field in the results page shall navigate to the corrisponding page
