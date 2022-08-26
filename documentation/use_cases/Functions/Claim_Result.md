## Modify results of a meet to the database

### Actor (User)
A general user of the application with an active AC number

### Pre-conditions
- The database is running
- The server is running
- The web app is deployed
- User is an active AC member

### Main Flow
1. User navigates to individual meets page and selects an event
2. Web app displays the results of that event
3. User selects a result from an entry without an AC number to claim as their own
4. Claim must be made before the next calendar date
5. System checks if the first names, last names, sex and birthdays match
6. A request to an admin is sent to claim the result as theirs
7. database is modified upon approval -> that result will have its athlete field changed to the AC number of the claimant and the non-member athlete field removed

### Alternate Flows
- If there is some sort of error with communication between the server and endpoint
  1. the user will be notified with an informative error message
- Claim is made after the calendar date of the performance
  1. user will be prompted that automatic claims can only be done on the same date - otherwise, they need to file the proper paperwork
  2. use case ends,  return to previous view
- One of the fields: first name, last name, sex, birthday does not match
  1. user will be prompted that automatic claims can only be done on the same date - otherwise, they need to file the proper paperwork
  2. use case ends,  return to previous view
- Admin refuses the request
  1. No changes will be made to the database
  2. Further requests from the frontend will be automatically declined with a corresponding message
  3. further changes require the proper paperwork

### Post conditions
- database will be updated with the athlete information
