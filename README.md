# Project Bikeshed

[![Build Status](https://codeship.com/projects/39dbe900-b2cb-0136-ec6c-5ee84f30adbc/status?branch=master)

**"Project Weely Git"** is a web site built for seeing the top 25 trending repositories on Github.  Users can log in to read and find out details on what repos are trending.  

**Authors**
Matt Bowler

Heroku Link
TBA

**List of Features**

Our site features an index of the top 25 repositories of Github. Each review on the index page links to the Github trending page.

From the index page a user can each repositories details. The details include;

  - name of project

  - description of project

  - Primary coding language of project(if specified otherwise it will be N/A)

  - Primary Contributors

**Set Up**
**Step 1**

When you clone this project from Github the first thing you'll want to do is run the commands;
  - >bundle install

  - >yarn install

  - >rake db:create

  - >rake db:migrate

  - >rake db:seed

**Step 2**

To check to make sure the connection to the Github trending page is up and running run the following command;

  - >ruby index.rb

This command will out put in the terminal the name, description, language, and primary contributors of the top 25 trending repositories

**Step 3**

Now that you have everything set up it's time to look boot up the server!
Start by running the following commands in the terminal;

  - >rails s
  
In a new tab run the following
  - >yarn start

**Step 4**

This is the final step so get ready! We will be checking to make sure that the API end point is properly set up. Go ahead and put the following into your browsers URL

  - >localhost:3000/api/v1/repos

If you see a JSON object being returned then that it! The website is ready to be used!

**Outline of technologies used:**

Devise
React
Postgresql
Rails
