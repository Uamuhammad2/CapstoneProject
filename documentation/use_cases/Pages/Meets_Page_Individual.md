## View individual meet

### Actor (User)
A general user of the application without admin access

### Pre-conditions
- The database is running
- The server is running
- The web app is deployed

### Main Flow
1. User clicked on the name of a meet
2. Frontend selects the correct endpoint to direct the request to
3. Backend handles the request by requesting information from the SQL server via query of the event name
3. Display a page with clickable tabs to show the results of each event in that meet
  - General tab showing: name, subname, state date, end date, facility, comp type, comp subtype, season and link to event schedule
  - A tab for each sport -> on click, show a button for each division -> on click, show ranking table for those filters

### Alternate Flows
- If combination of filters returns no results
  1. the loading notification will change to a no results notification 
- If there is some sort of error with communication between the server and endpoint
  1. the user will be notified with an informative error message

### Post conditions
- all results pertaining to the filters shall be displayed to the user
- clicking on a clickable field in the results page shall navigate to the corrisponding page
