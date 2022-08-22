## Modify results of a meet to the database

### Actor (User)
A general user of the application with admin access

### Pre-conditions
- The database is running
- The server is running
- The web app is deployed
- User is signed in to an admin account

### Main Flow
1. User navigates to the modify page
2. Web app displays the ranking page with an edit function
3. Edit option opens a forum with each modifyable element of the result
4. A confirmation is required upon trying to save
5. Backend parses the data and decides the correct endpoints
6. The insert commands are called from the endpoints and data is editted in the database

### Alternate Flows
- If there is some sort of error with communication between the server and endpoint
  1. the user will be notified with an informative error message
- The user cancels the changes upon being requested of a confirmation
  1. the changes are discarded and the previous view is shown

### Post conditions
- database will be updated with the information from the mdb/csv file
