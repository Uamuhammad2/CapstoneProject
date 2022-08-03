## Upload results of a meet to the database

### Actor (User)
A general user of the application with admin access

### Pre-conditions
- The database is running
- The server is running
- The web app is deployed
- User is signed in to an admin account

### Main Flow
1. User navigates to the upload page
2. Web app displays option to upload a file(s) (csv or mdb)
3. Backend parses the data and decides the correct endpoints
4. The insert commands are called from the endpoints and data is inserted into the database

### Alternate Flows
- If the file is in the incorrect format for the program to parse
  1. user will be notified which fields are missing
  2. the file will not be entered into the database
- If there is some sort of error with communication between the server and endpoint
  1. the user will be notified with an informative error message

### Post conditions
- database will be updated with the information from the mdb/csv file
