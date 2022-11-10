# Deployment for the web app

[Video demonstration here](https://www.youtube.com/watch?v=LMcOGEjFJLo)

[Link to website](https://ao.mdbell.me:8443/)
1. Ensure current production code is pushed to main
    - A member other than the one initiating the pull request goes over the code and accepts the merge 
    - Process of merging is outlined in [workflows](https://github.com/CAPSTONE-2022-2023/Group_20/blob/main/git_workflow.md)
2. Login to production server over SSH
    - Host: `24.150.8.183`
    - Port: `1337`
    - Username: `deploy`
    - Password: `password123`
3. Stop the node service
    - `sudo systemctl stop ao.service`
5. pull from main on the server
    - `git pull main`

6. rebuild the project's static assets
    - `npm run build`
7. Restart the node service
    - `sudo systemctl start ao.service`


# Database

Database is a Microsoft SQL server database deployed to google console. It can be connected to remotely using SQL Server management studio.
  - Connection Name: `agile-apex-272814:northamerica-northeast2:athletics-ontario-db`
  - Password: `R[(q&faQH,c@]4lT`
