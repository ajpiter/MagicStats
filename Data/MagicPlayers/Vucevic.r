library(bit64) #version 4.05 Required for data.table in h2o 
library(caret) #version 6.0.86 Meta Engine utilizing ML models from other packages 
library(dplyr) #version 1.0.3 Data Manipulation 
library(ggplot2) #version 3.3.3 Graphics 
library(h2o) #version 3.32.0 Model Training 
library(hablar) #version 0.3.0 Converts data types
library(modeldata) #version 0.1.0 Access"Attrition" dataset 
library(recipes) #version 0.1.15 Creates Matrices 
library(reshape2) #version 1.4.4 Creates Correlation Matrix
library(rJava) #version 0.9.13 required for h2o 
library(rmarkdown) #version Create PDF files 
library(rsample) #Version 0.0.8 Stratified Resampling using strata 
library(rvest) #version 0.3.6 Scraps Websites
library(stringr) #version 1.4.0 Splitting Columns 
library(tidyverse) #version 1.3.0 TidyData 
library(vip) #version 0.3.2 Vairables in Logistic Regression 
library(visdat) #version 0.5.3 Additional Visualizations 

## Importing Data 

Statistics for individual seasons that listed every NBA game Nikola Vucevic played in were obtained from Basketball Reference. 

- **Data Source:** https://www.basketball-reference.com/players/v/vucevni01.html

- **Seasons:** 10 Seasons total 

- **First Season:** 2011-2012 

- **Last Season:** 2020-2021 incomplete as games are in progress 

- **Naming Convention:** 2021 indicates the 2020-2021 season following Basketball Reference naming convention

```{r include=FALSE}
#Vucevic 2020 -2021 Season  
Vucevic2021 <- "https://www.basketball-reference.com/players/v/vucevni01/gamelog/2021/"
read_html(Vucevic2021)

#After importing the html site, transform to data table
url <- Vucevic2021
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
#Here, we indicate that this is the table we want to extract.
pageobj %>%  
  html_nodes("table") %>% 
  .[[8]] %>% 
  html_table(fill=T) -> Vucevic2021

#Removes Rows with subheadings
Vucevic2021 <- Vucevic2021[!(Vucevic2021$GS=="Did Not Play" | 
                               Vucevic2021$GS=="Did Not Dress" | 
                               Vucevic2021$GS=="GS" | 
                               Vucevic2021$GS == "Inactive"),]

#Add Column to Indicate Season 
Vucevic2021$Season <- 2021

#Vucevic 2019 - 2020 Season  
Vucevic2020 <- "https://www.basketball-reference.com/players/v/vucevni01/gamelog/2020/"
read_html(Vucevic2020)

#After importing the html site, transform to data table
url <- Vucevic2020
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
#Here, we indicate that this is the table we want to extract.
pageobj %>%  
  html_nodes("table") %>% 
  .[[8]] %>% 
  html_table(fill=T) -> Vucevic2020

#Removes Rows with subheadings
Vucevic2020 <- Vucevic2020[!(Vucevic2020$GS=="Did Not Play" | 
                               Vucevic2020$GS=="Did Not Dress" | 
                               Vucevic2020$GS=="GS" | 
                               Vucevic2020$GS == "Inactive"),]

#Add Column to Indicate Season 
Vucevic2020$Season <- 2020

#Vucevic 2018 -2019 Season  
Vucevic2019 <- "https://www.basketball-reference.com/players/v/vucevni01/gamelog/2019/"
read_html(Vucevic2019)

#After importing the html site, transform to data table
url <- Vucevic2019
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
#Here, we indicate that this is the table we want to extract.
pageobj %>%  
  html_nodes("table") %>% 
  .[[8]] %>% 
  html_table(fill=T) -> Vucevic2019

#Removes Rows with subheadings
Vucevic2019 <- Vucevic2019[!(Vucevic2019$GS=="Did Not Play" | 
                               Vucevic2019$GS=="Did Not Dress" | 
                               Vucevic2019$GS=="GS" | 
                               Vucevic2019$GS == "Inactive"),]

#Add Column to Indicate Season 
Vucevic2019$Season <- 2019

#Vucevic 2017-2018 Season  
Vucevic2018 <- "https://www.basketball-reference.com/players/v/vucevni01/gamelog/2018/"
read_html(Vucevic2018)

#After importing the html site, transform to data table
url <- Vucevic2018
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
#Here, we indicate that this is the table we want to extract.
pageobj %>%  
  html_nodes("table") %>% 
  .[[8]] %>% 
  html_table(fill=T) -> Vucevic2018

#Removes Rows with subheadings
Vucevic2018 <- Vucevic2018[!(Vucevic2018$GS=="Did Not Play" | 
                               Vucevic2018$GS=="Did Not Dress" | 
                               Vucevic2018$GS=="GS" | 
                               Vucevic2018$GS == "Inactive"),]

#Add Column to Indicate Season 
Vucevic2018$Season <- 2018

#Vucevic 2016-2017 Season  
Vucevic2017 <- "https://www.basketball-reference.com/players/v/vucevni01/gamelog/2017/"
read_html(Vucevic2017)

#After importing the html site, transform to data table
url <- Vucevic2017
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
#Here, we indicate that this is the table we want to extract.
pageobj %>%  
  html_nodes("table") %>% 
  .[[8]] %>% 
  html_table(fill=T) -> Vucevic2017

#Removes Rows with subheadings
Vucevic2017 <- Vucevic2017[!(Vucevic2017$GS=="Did Not Play" | 
                               Vucevic2017$GS=="Did Not Dress" | 
                               Vucevic2017$GS=="GS" | 
                               Vucevic2017$GS == "Inactive"),]

#Add Column to Indicate Season 
Vucevic2017$Season <- 2017

#Vucevic 2015-2016 Season  
Vucevic2016 <- "https://www.basketball-reference.com/players/v/vucevni01/gamelog/2016/"
read_html(Vucevic2016)

#After importing the html site, transform to data table
url <- Vucevic2016
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
#Here, we indicate that this is the table we want to extract.
pageobj %>%  
  html_nodes("table") %>% 
  .[[8]] %>% 
  html_table(fill=T) -> Vucevic2016

#Removes Rows with subheadings
Vucevic2016 <- Vucevic2016[!(Vucevic2016$GS=="Did Not Play" | 
                               Vucevic2016$GS=="Did Not Dress" | 
                               Vucevic2016$GS=="GS" | 
                               Vucevic2016$GS == "Inactive"),]

#Add Column to Indicate Season 
Vucevic2016$Season <- 2016

#Vucevic 2014-2015 Season  
Vucevic2015 <- "https://www.basketball-reference.com/players/v/vucevni01/gamelog/2015/"
read_html(Vucevic2015)

#After importing the html site, transform to data table
url <- Vucevic2015
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
#Here, we indicate that this is the table we want to extract.
pageobj %>%  
  html_nodes("table") %>% 
  .[[8]] %>% 
  html_table(fill=T) -> Vucevic2015

#Removes Rows with subheadings
Vucevic2015 <- Vucevic2015[!(Vucevic2015$GS=="Did Not Play" | 
                               Vucevic2015$GS=="Did Not Dress" | 
                               Vucevic2015$GS=="GS" | 
                               Vucevic2015$GS == "Inactive"),]

#Add Column to Indicate Season 
Vucevic2015$Season <- 2015

#Vucevic 2013-2014 Season  
Vucevic2014 <- "https://www.basketball-reference.com/players/v/vucevni01/gamelog/2014/"
read_html(Vucevic2014)

#After importing the html site, transform to data table
url <- Vucevic2014
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
#Here, we indicate that this is the table we want to extract.
pageobj %>%  
  html_nodes("table") %>% 
  .[[8]] %>% 
  html_table(fill=T) -> Vucevic2014

#Removes Rows with subheadings
Vucevic2014 <- Vucevic2014[!(Vucevic2014$GS=="Did Not Play" | 
                               Vucevic2014$GS=="Did Not Dress" | 
                               Vucevic2014$GS=="GS" | 
                               Vucevic2014$GS == "Inactive"),]

#Add Column to Indicate Season 
Vucevic2014$Season <- 2014

#Vucevic 2012-2013 Season  
Vucevic2013 <- "https://www.basketball-reference.com/players/v/vucevni01/gamelog/2013/"
read_html(Vucevic2013)

#After importing the html site, transform to data table
url <- Vucevic2013
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
#Here, we indicate that this is the table we want to extract.
pageobj %>%  
  html_nodes("table") %>% 
  .[[8]] %>% 
  html_table(fill=T) -> Vucevic2013

#Removes Rows with subheadings
Vucevic2013 <- Vucevic2013[!(Vucevic2013$GS=="Did Not Play" | 
                               Vucevic2013$GS=="Did Not Dress" | 
                               Vucevic2013$GS=="GS" | 
                               Vucevic2013$GS == "Inactive"),]

#Add Column to Indicate Season 
Vucevic2013$Season <- 2013



#Vucevic 2011-2012 Season  
Vucevic2012 <- "https://www.basketball-reference.com/players/v/vucevni01/gamelog/2012/"
read_html(Vucevic2012)

#After importing the html site, transform to data table
url <- Vucevic2012
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
#Here, we indicate that this is the table we want to extract.
pageobj %>%  
  html_nodes("table") %>% 
  .[[8]] %>% 
  html_table(fill=T) -> Vucevic2012

#Removes Rows with subheadings
Vucevic2012 <- Vucevic2012[!(Vucevic2012$GS=="Did Not Play" | 
                               Vucevic2012$GS=="Did Not Dress" | 
                               Vucevic2012$GS=="GS" | 
                               Vucevic2012$GS == "Inactive"),]
#Add Column to Indicate Season 
Vucevic2012$Season <- 2012

## Merge & Clean Data 

### Data Frame Created 

- **Vucevic:**: Includes Stats for every game Vucevic played from 2011 through `r Sys.Date()`. Each row of data represents a single game. 

### Variables Created

- **Vucevic$TeamGameSeason:** Indicates what game it is in the season for Vucevic's team 
- **Vucevic$PlayerGameSeason:** Indicates how many games Vucevic has played in that season
- **Vucevic$PlayerGameCareer:** Indicates how many games Vucevic has played in his entire NBA career
- **Vucevic$Player:** Identifies Vucevic as the player. Future benefit if combined with other datasets. 

The variables in the dataset include: 

Vucevic <- rbind(Vucevic2012, Vucevic2013, Vucevic2014, Vucevic2015, Vucevic2016, 
                 Vucevic2017, Vucevic2018, Vucevic2019, Vucevic2020, Vucevic2021)

Vucevic <- Vucevic[!(Vucevic$GS == "Not With Team"),]

Vucevic$PlayerGameCareer <- seq.int(nrow(Vucevic))
Vucevic$Player <- "Vucevic"

#Clean Data File 

#Change Column Names
names(Vucevic)[names(Vucevic) == "Rk"] <- "TeamGameSeason"
names(Vucevic)[names(Vucevic) == "G"] <- "PlayerGameSeason"
names(Vucevic)[names(Vucevic) == "Tm"] <- "Team"
colnames(Vucevic)[6] <-c("Location")
names(Vucevic)[names(Vucevic) == "Opp"] <- "Opponent"
colnames(Vucevic)[8] <-c("WinLoss") 
names(Vucevic)[names(Vucevic) == "GS"] <- "GameStarted"
names(Vucevic)[names(Vucevic) == "MP"] <- "MinsPlayed"

#Fill in the Location Data for the game
Vucevic$Location <- ifelse(Vucevic$Location == "@", "Away", "Home") 

#Split MinsPlayed Column into two columns 
Index <- str_split_fixed(Vucevic$MinsPlayed, ":", 2) #Create County Index Matrix
Vucevic <- cbind(Vucevic, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
names(Vucevic)[names(Vucevic) == "1"] <- "Minutes" 
names(Vucevic)[names(Vucevic) == "2"] <- "Seconds" 

#Split WinsLoss Column into two columns 
Index <- str_split_fixed(Vucevic$WinLoss, " ", 2) #Create Index Matrix
Vucevic <- cbind(Vucevic, Index) #Add Matrix to DataFrame
Vucevic<- Vucevic %>% select(-WinLoss) #remove columns
names(Vucevic)[names(Vucevic) == "1"] <- "WinLoss" 
Vucevic<- Vucevic %>% select(-"2")

#Update the Data Types 
#library(hablar)
colnames(Vucevic)
Vucevic <- Vucevic %>% convert(
  int("TeamGameSeason", "PlayerGameSeason", "FG", "FGA", "3P", "3PA", "FT", "FTA", "ORB", 
      "DRB", "TRB", "AST", "STL", "BLK", "TOV", "PF", "PTS", "+/-", "PlayerGameCareer"), 
  num("FG%", "3P%", "FT%", "FG%", "FT%", "3P%", "GmSc"),
  dte("Date"),
  fct("Team", "Location", "Opponent", "WinLoss", "GameStarted"))
