## View individual member

### Actor (User)
A general user of the application without admin access

### Pre-conditions
- The database is running
- The server is running
- The web app is deployed

### Main Flow
1. User clicked on a name in any of the menus 
2. Frontend selects the correct endpoint to direct the request to
6. Backend handles the request by requesting information from the SQL server via query of the meet ID
7. Backend receives data of all performance data by the matching AC ID in JSON format and hands back to frontend
8. Frontend formats data for displaying to the user
    - Personal info tab: displays AC#, name, sex, current club, hometown, awards, disability if applicable, notes if applicable
    - *The following displays all results irrespective of whether an active membership was associated with it. A flag will show non-active results*
    - Personal Bests tab: displays best mark of every discipline completed by the athlete - separate headings for Outdoor/Indoor
    - Progression tab: displays the PB for each year on record for each sport
    - Results tab: show all results of that athlete for the current year
    - Progression chart (to be clarified) 

### Alternate Flows
- If combination of filters returns no results
  1. the loading notification will change to a no results notification 
- If there is some sort of error with communication between the server and endpoint
  1. the user will be notified with an informative error message

### Post conditions
- all results pertaining to the filters shall be displayed to the user
- clicking on a clickable field in the results page shall navigate to the corrisponding page
