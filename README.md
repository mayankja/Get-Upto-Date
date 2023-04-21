**Get Upto Date**

GetUptoDate is a web application that allows users to browse and search for news, and gives to read the news later by storing it into db. This repository contains the source code for the application, as well as installation and usage instructions.




**Features**
Browse and search for news by category, Language, country, Read it later feature to store intresting news into db.





**Following tool I used in app**

For he database to store news information I used postgresql. To make development easy and faster I used Docker for containerization




**Third Party API for fetching news


I have used a 3rd party api service from Rapid API to fetch news from different resources.
Link: https://rapidapi.com/algodom-media-algodom-media-default/api/newsdata2



**Usage**

To install and run the application locally, follow these steps:

Clone the repository using Git: 

`git clone https://github.com/mayankja/Get-Upto-Date`

Install the dependencies for the server and client:

`cd Get-Upto-Date`

install docker compose in your system and then

1. Setup command
`sudo docker-compose up -d --build`

2. Database prepare
`sudo docker-compose run web rails db:migrate`

3. Server start
`sudo docker-compose up`

Here you go, Now you can browse news on localhost:3000.

