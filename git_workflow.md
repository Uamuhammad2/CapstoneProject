# Git Workflow
This document outlines the various operations and procedures that will be required while using git on this project. Some operations (such as the initial setup) only need to be done once, while others (like switching branches, or committing changes) will need to be done regularly.

*NOTE: This document is subject to changes at any time, please review it prior to completing repeatable steps such as pull requests. Failure to do so may results in your pull request or other actions being denied or reverted.*

# Processes

## Initial Setup
These steps should only need to be done once, when first setting up the local repo. Once complete you will have a copy of the git repo on your machine. The steps for doing so are as followed:
1. [Ensure Git is installed](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
2. [Clone the repo locally](#clone-the-repo-locally)

## Creating A New Feature
All independent features should be developed within their own branch, as this allows us to avoid 'stepping on each others toes'. Should a feature not be developed within it's own branch and instead be committed directly to main, or multiple features are being worked on within one branch; said commits will be reverted.
1. [Create a branch for you feature](#create-a-branch) - Make sure to use a descriptive name. e.g `sql-database-driver` is an effective name, `database-driver` or `db` are not.
2. [Checkout (switch) to your newly created branch](#switch-to-the-feature-branch)

While working on your code, please ensure to commit changes regularly. Doing so allows is to track when/where bugs may be introduced, and allows developers to rollback to earlier versions easier. Descriptive commit messages are also required. They don't need to be long, saying something like "corrected typos on landing page" is acceptable. "stuff" is not.

## Creating a Pull Request For a Completed Feature
Filler description
1. first
2. second
3. third

*NOTE: All pull requests into `main` require at least one (1) other developer to review the code. Individual developers are not permitted to accept their own pull requests. Failure to do so will be treated the same as committing directly to `main`.*

## Dealing with Conflicts When Merging
Filler description
1. first
2. second
3. third

# Individual Steps
## Clone the Repo Locally
TODO

Example:
```
git clone https://github.com/CAPSTONE-2022-2023/Group_20
```

## Create A Branch
TODO

Example:
```
git branch github-workflow
```

## Switch to the feature branch
TODO

## Commit Changes Locally
TODO

Example (no new files):
```
git commit -a -m "Updated README"
```

Example (adding new files):
```
git add "new_file.md"
git commit -m "Added new_file.md"
```

## Push Changes to GitHub
TODO

## Create a Pull Request
TODO
