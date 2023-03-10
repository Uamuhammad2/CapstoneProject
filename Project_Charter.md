# Information System

### 1. Introduction

This project aims to create a full stack information system for store and display information about Track & Field athletes and events.

A number of tools not currently available from other services will be implemented such as:

*Jul 28, 2022*

*Current Version: 2.1*

*Project Manager : Sunny Qi*

*Project Sponssor: Athletics Ontario*

### 2. Overview

Create a tool  to store and display information about track and field in Ontario

### 3. Milestones
  1. Decide what is to be displayed on each view of the final product [link](https://github.com/sunnehh/AthleticsOntario/tree/main/documentation/use_cases/Pages)
  2. List of technological choices for front-end, back-end, database and hosting/domain defined: [link](https://github.com/sunnehh/AthleticsOntario/blob/main/technical_details.md)
  3. Design of database finalized [link](https://github.com/sunnehh/AthleticsOntario/tree/main/documentation/database)
  4. Deploy test database with large set dummy information to ensure completeness of the database
  5. Backend communicates with database
  6. Defined all required endpoints to minimize data transfer
  7. Backend request are routed (routes are created and resolve to endpoints)
  8. Backend requests are handled and respond with accurate data
  9. Deploy live database with all recorded AO information [link](https://github.com/sunnehh/AthleticsOntario/blob/main/documentation/use_cases/Functions/upload_meet_results.md)
  10. Frontend contains all views required by the user
  11. Frontend styling is finalized
  12. Modules and components created for viewing data in table-form (the view of ranking page data shall be reused by multiple other components with different fields displayed)
  13. Secure login created
  14. Login information sync with AO member data

### 4. Deliverables
  1. Database up and running
  2. Backend handles requests and posts accurate information
  3. Frontend creates all requests required by views (filters for views)
  4. Frontend is styled to client specification
  5. Secure login system
  6. Permissions granted based on user access level

### 5. Risks, Assumptions and Constraints

#### 5.1 Risks
- issues with trackie may affect accuracy of updating the database (Athletics Canada athlete information is pulled from trackie)
- contracted services may change (changes in AO 3PL may affect the database, Trackie API may change their terms or responses)
- contracted services may change their prices
- The client (AO) has access to modify the database, possibly making the information inaccurate
- The client (AO) as well as clients of the client (ontario athletes) must learn to use and navigate the website without assistance

#### 5.2 Assumptions
- The client (AO) is familiar with the usage of the website
- The contracted services for hosting and domain are extremely reliable (accessible for more than 99.9% of the time)
- 3PL data of the client is available for use

#### 5.3 Constraints
- No sensitive information of the client or their clients will be stored
- Athletes may only modify/merge information pertaining to the Athletics Canada ID associated with their own account

## 6. Organization/Stakeholders

| Project Role | Responsibilities | Assigned to |
| ----------- | ----------- | ----------- |
| Project Manager | Design and maintain the website| Sunny Qi|
| Project Sponsor | Cover website costs | Athletics Ontario|
| Project Guidance | Direct requests and features of the website  | Athletics Ontario|
