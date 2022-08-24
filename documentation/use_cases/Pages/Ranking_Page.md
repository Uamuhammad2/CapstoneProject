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
    - filters include: season, gender, member/non-member, division (standard, masters, para), sub-division (age division + classification if para), year, a list of all the sports
    - irrespective of the year filter, a current record will always be displayed above the main results table for the record holding mark
4. Frontend selects the correct endpoint to direct the request to
5. Frontend will display a loading notification while waiting for the request to resolve
6. Backend handles the request by requesting information from the SQL server via query
7. Backend receives data in JSON format and hands back to frontend
8. Frontend formats data for displaying to the user
    - *Only results with active memberships shall be displayed on this view*
    - a table with the columns: rank (based off filters), mark, Athlete name, athlete club, name of event, event location, date of event, athlete year of birth
    - each column header may be clicked to be sorted in ascending/descending order of marks based on that column
    - each element of the rows must link to the appropriate page 
    - athlete name links to [the member](https://github.com/sunnehh/AthleticsOntario/blob/main/documentation/use_cases/Pages/Members_Page_Individual.md)
    - event location links to [facility](https://github.com/sunnehh/AthleticsOntario/blob/main/documentation/use_cases/Pages/Facilities_Page_Individual.md)
    - name of event links to [meet](https://github.com/sunnehh/AthleticsOntario/blob/main/documentation/use_cases/Pages/Meets_Page_Individual.md)
    - club name links to [club](https://github.com/sunnehh/AthleticsOntario/blob/main/documentation/use_cases/Pages/Clubs_Page_Individual)

### Alternate Flows
- If combination of filters returns no results
  1. the loading notification will change to a no results notification 
- If there is some sort of error with communication between the server and endpoint
  1. the user will be notified with an informative error message

### Post conditions
- all results pertaining to the filters shall be displayed to the user
- clicking on a clickable field in the results page shall navigate to the corrisponding page
