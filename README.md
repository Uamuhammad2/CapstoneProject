# AthleticsOntario
A hub for Athletics Ontario's information system

This project aims to create a full-stack implementation of AO's (Athletics Ontario's) information system.
A database will be created to house permanent information pertaining to ontario athletes as well as a web application for athletes and their coaches to view.

The information system shall store long term meet results and link athlete results to the athlete via their Athletics Canada ID if they have one.
The information system will have a 3-tiered approach.
- Utilities for non-members shall include: 
  - View of rankings page for all results stored in the database and concise filters to allow the view of only pertinent information
  - View of a list of facilities and their specific information including club PBs, progressions, results
  - View of list of Athletes by ranking, their general information, PBs, results, progression;
  - View of a list of past meets and their results

- Utilities for athletes shall include: 
  - All of the above with the addition of:
    - Ability to combine/claim results with a nickname or incorrect name
    
- Utilites for administrators shall include:
  - All of the above with the addition of:
    - ability to add data to the database
    - ability to modify existing data
    - ability to view sensitive information in greater detail
    - ability to create custom views for statistical uses
  
Secure login system will need to be implemented due to admins possibly having catestrophic power

The web app will be created using React for the front end. The backend will be driven by Next.js  and employing a SQL server database 

| Project Role        | Assigned        |    
| -------------       |:-------------: |
| Product Owner       | Sunny Qi |
| Network Specialist  | Matthew Bell |
| Front-End Developer | Sunny Qi |
| Back-End Developer  | Sunny Qi , Matthew Bell |
| Database Specialist | Sunny Qi     |
