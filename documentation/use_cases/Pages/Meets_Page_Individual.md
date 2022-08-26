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
3. Display a page with clickable tabs to show the results of each event in that meet that has completed with results
    - General tab showing: name, subname, state date, end date, facility, comp type, comp subtype, season and link to event schedule
    - A tab for each day with clickable elements for each event of that day
    - Clicking an event shows detailed results with:
    1. placement
    2. athlete (clickable if valid AC number)
    3. club
    4. mark
    5. wind
    6. flight/heat
    7. Attempt / split time
    8. flag for active/inactive AC member
    9. note
4. events without completed results will not be clickable and flagged as not completed

### Alternate Flows
- If combination of filters returns no results
  1. the loading notification will change to a no results notification 
- If there is some sort of error with communication between the server and endpoint
  1. the user will be notified with an informative error message

### Post conditions
- all results pertaining to the filters shall be displayed to the user
- clicking on a clickable field in the results page shall navigate to the corrisponding page
