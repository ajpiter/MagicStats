library(rvest) #version 0.3.6 
library(dplyr)
library(hablar) #Used to convert data types
library(ggplot2) #graphing 
library(stringr) #spliting columns 

#Datasets include all game stats for Isa=iah Thomas from the 2012 to 2020 NBA seasons 

#Thomas 2019 -2020 Season  
Thomas2020 <- "https://www.basketball-reference.com/players/t/thomais02/gamelog/2020/"
  read_html(Thomas2020)

#After importing the html site, transform to data table
url <- Thomas2020
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
#Here, we indicate that this is the table we want to extract.
pageobj %>%  
  html_nodes("table") %>% 
  .[[8]] %>% 
  html_table(fill=T) -> Thomas2020

#Removes Rows with subheadings
Thomas2020 <- Thomas2020[!(Thomas2020$GS=="Did Not Play" | 
                               Thomas2020$GS=="Did Not Dress" | 
                               Thomas2020$GS=="GS" | 
                               Thomas2020$GS == "Inactive"),]

#Change Column Names
names(Thomas2020)[names(Thomas2020) == "Rk"] <- "TeamGame"
names(Thomas2020)[names(Thomas2020) == "G"] <- "PlayerGame"
names(Thomas2020)[names(Thomas2020) == "Tm"] <- "Team"
colnames(Thomas2020)[6] <-c("Location")
names(Thomas2020)[names(Thomas2020) == "Opp"] <- "Opponent"
colnames(Thomas2020)[8] <-c("WinLoss") 
names(Thomas2020)[names(Thomas2020) == "GS"] <- "GameStarted"
names(Thomas2020)[names(Thomas2020) == "MP"] <- "MinsPlayed"

#Fill in the Location Data for the game
Thomas2020$Location <- ifelse(Thomas2020$Location == "@", "Away", "Home") 

#Split MinsPlayed Column into two columns 
Index <- str_split_fixed(Thomas2020$MinsPlayed, ":", 2) #Create County Index Matrix
Thomas2020 <- cbind(Thomas2020, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
names(Thomas2020)[names(Thomas2020) == "1"] <- "Minutes" 
names(Thomas2020)[names(Thomas2020) == "2"] <- "Seconds" 

#Split WinsLoss Column into two columns 
Index <- str_split_fixed(Thomas2020$WinLoss, " ", 2) #Create County Index Matrix
Thomas2020 <- cbind(Thomas2020, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
Thomas2020<- Thomas2020 %>% select(-WinLoss) #remove columns
names(Thomas2020)[names(Thomas2020) == "1"] <- "WinLoss" 
Thomas2020<- Thomas2020 %>% select(-"2")

#Update the Data Types 
#library(hablar)
colnames(Thomas2020)
Thomas2020 <- Thomas2020 %>% convert(
  int("TeamGame", "PlayerGame", "FG", "FGA", "3P", "3PA", "FT", "FTA", "ORB", 
      "DRB", "TRB", "AST", "STL", "BLK", "TOV", "PF", "PTS", "+/-" ), 
  num("FG%", "3P%", "FT%", "FG%", "FT%", "3P%", "GmSc"),
  dte("Date"),
  fct("Team", "Location", "Opponent", "WinLoss", "GameStarted"))

##### Create Data Dictionary ##### 
#Create a vector that counts how many columns are in the data frame
ColNumber <- (seq_len(ncol(Thomas2020)))
#Turn the vector into its own data frame with the first column called ColNumber 
DataDictionary <- as.data.frame(ColNumber)
#Add a column based on the vector of colnames 
DataDictionary$VariableName <- (colnames(Thomas2020))
#Add the variable type into the data frame as a new column called "type"
DataDictionary$DataType <- (sapply(Thomas2020, class))
View(DataDictionary)

#Thomas 2019 -2020 Season  
Thomas2019 <- "https://www.basketball-reference.com/players/t/thomais02/gamelog/2019"
  read_html(Thomas2019)

#After importing the html site, transform to data table
url <- Thomas2019
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
#Here, we indicate that this is the table we want to extract.
pageobj %>%  
  html_nodes("table") %>% 
  .[[8]] %>% 
  html_table(fill=T) -> Thomas2019

#Removes Rows with subheadings
Thomas2019 <- Thomas2019[!(Thomas2019$GS=="Did Not Play" | 
                             Thomas2019$GS=="Did Not Dress" | 
                             Thomas2019$GS=="GS" | 
                             Thomas2019$GS == "Inactive"),]

#Change Column Names
names(Thomas2019)[names(Thomas2019) == "Rk"] <- "TeamGame"
names(Thomas2019)[names(Thomas2019) == "G"] <- "PlayerGame"
names(Thomas2019)[names(Thomas2019) == "Tm"] <- "Team"
colnames(Thomas2019)[6] <-c("Location")
names(Thomas2019)[names(Thomas2019) == "Opp"] <- "Opponent"
colnames(Thomas2019)[8] <-c("WinLoss") 
names(Thomas2019)[names(Thomas2019) == "GS"] <- "GameStarted"
names(Thomas2019)[names(Thomas2019) == "MP"] <- "MinsPlayed"

#Fill in the Location Data for the game
Thomas2019$Location <- ifelse(Thomas2019$Location == "@", "Away", "Home") 

#Split MinsPlayed Column into two columns 
Index <- str_split_fixed(Thomas2019$MinsPlayed, ":", 2) #Create County Index Matrix
Thomas2019 <- cbind(Thomas2019, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
names(Thomas2019)[names(Thomas2019) == "1"] <- "Minutes" 
names(Thomas2019)[names(Thomas2019) == "2"] <- "Seconds" 

#Split WinsLoss Column into two columns 
Index <- str_split_fixed(Thomas2019$WinLoss, " ", 2) #Create County Index Matrix
Thomas2019 <- cbind(Thomas2019, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
Thomas2019<- Thomas2019 %>% select(-WinLoss) #remove columns
names(Thomas2019)[names(Thomas2019) == "1"] <- "WinLoss" 
Thomas2019<- Thomas2019 %>% select(-"2")

#Update the Data Types 
#library(hablar)
colnames(Thomas2019)
Thomas2019 <- Thomas2019 %>% convert(
  int("TeamGame", "PlayerGame", "FG", "FGA", "3P", "3PA", "FT", "FTA", "ORB", 
      "DRB", "TRB", "AST", "STL", "BLK", "TOV", "PF", "PTS", "+/-" ), 
  num("FG%", "3P%", "FT%", "FG%", "FT%", "3P%", "GmSc"),
  dte("Date"),
  fct("Team", "Location", "Opponent", "WinLoss", "GameStarted"))

##### Create Data Dictionary ##### 
#Create a vector that counts how many columns are in the data frame
ColNumber <- (seq_len(ncol(Thomas2019)))
#Turn the vector into its own data frame with the first column called ColNumber 
DataDictionary <- as.data.frame(ColNumber)
#Add a column based on the vector of colnames 
DataDictionary$VariableName <- (colnames(Thomas2019))
#Add the variable type into the data frame as a new column called "type"
DataDictionary$DataType <- (sapply(Thomas2019, class))
View(DataDictionary)

Thomas2018 <- "https://www.basketball-reference.com/players/t/thomais02/gamelog/2018"
  read_html(Thomas2018)

#After importing the html site, transform to data table
url <- Thomas2018
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
#Here, we indicate that this is the table we want to extract.
pageobj %>%  
  html_nodes("table") %>% 
  .[[8]] %>% 
  html_table(fill=T) -> Thomas2018

#Removes Rows with subheadings
Thomas2018 <- Thomas2018[!(Thomas2018$GS=="Did Not Play" | 
                             Thomas2018$GS=="Did Not Dress" | 
                             Thomas2018$GS=="GS" | 
                             Thomas2018$GS == "Inactive"),]

#Change Column Names
names(Thomas2018)[names(Thomas2018) == "Rk"] <- "TeamGame"
names(Thomas2018)[names(Thomas2018) == "G"] <- "PlayerGame"
names(Thomas2018)[names(Thomas2018) == "Tm"] <- "Team"
colnames(Thomas2018)[6] <-c("Location")
names(Thomas2018)[names(Thomas2018) == "Opp"] <- "Opponent"
colnames(Thomas2018)[8] <-c("WinLoss") 
names(Thomas2018)[names(Thomas2018) == "GS"] <- "GameStarted"
names(Thomas2018)[names(Thomas2018) == "MP"] <- "MinsPlayed"

#Fill in the Location Data for the game
Thomas2018$Location <- ifelse(Thomas2018$Location == "@", "Away", "Home") 

#Split MinsPlayed Column into two columns 
Index <- str_split_fixed(Thomas2018$MinsPlayed, ":", 2) #Create County Index Matrix
Thomas2018 <- cbind(Thomas2018, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
names(Thomas2018)[names(Thomas2018) == "1"] <- "Minutes" 
names(Thomas2018)[names(Thomas2018) == "2"] <- "Seconds" 

#Split WinsLoss Column into two columns 
Index <- str_split_fixed(Thomas2018$WinLoss, " ", 2) #Create County Index Matrix
Thomas2018 <- cbind(Thomas2018, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
Thomas2018<- Thomas2018 %>% select(-WinLoss) #remove columns
names(Thomas2018)[names(Thomas2018) == "1"] <- "WinLoss" 
Thomas2018<- Thomas2018 %>% select(-"2")

#Update the Data Types 
#library(hablar)
colnames(Thomas2018)
Thomas2018 <- Thomas2018 %>% convert(
  int("TeamGame", "PlayerGame", "FG", "FGA", "3P", "3PA", "FT", "FTA", "ORB", 
      "DRB", "TRB", "AST", "STL", "BLK", "TOV", "PF", "PTS", "+/-" ), 
  num("FG%", "3P%", "FT%", "FG%", "FT%", "3P%", "GmSc"),
  dte("Date"),
  fct("Team", "Location", "Opponent", "WinLoss", "GameStarted"))

##### Create Data Dictionary ##### 
#Create a vector that counts how many columns are in the data frame
ColNumber <- (seq_len(ncol(Thomas2018)))
#Turn the vector into its own data frame with the first column called ColNumber 
DataDictionary <- as.data.frame(ColNumber)
#Add a column based on the vector of colnames 
DataDictionary$VariableName <- (colnames(Thomas2018))
#Add the variable type into the data frame as a new column called "type"
DataDictionary$DataType <- (sapply(Thomas2018, class))
View(DataDictionary)

Thomas2017 <- "https://www.basketball-reference.com/players/t/thomais02/gamelog/2017"
  read_html(Thomas2017)

#After importing the html site, transform to data table
url <- Thomas2017
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
#Here, we indicate that this is the table we want to extract.
pageobj %>%  
  html_nodes("table") %>% 
  .[[8]] %>% 
  html_table(fill=T) -> Thomas2017

#Removes Rows with subheadings
Thomas2017 <- Thomas2017[!(Thomas2017$GS=="Did Not Play" | 
                             Thomas2017$GS=="Did Not Dress" | 
                             Thomas2017$GS=="GS" | 
                             Thomas2017$GS == "Inactive"),]

#Change Column Names
names(Thomas2017)[names(Thomas2017) == "Rk"] <- "TeamGame"
names(Thomas2017)[names(Thomas2017) == "G"] <- "PlayerGame"
names(Thomas2017)[names(Thomas2017) == "Tm"] <- "Team"
colnames(Thomas2017)[6] <-c("Location")
names(Thomas2017)[names(Thomas2017) == "Opp"] <- "Opponent"
colnames(Thomas2017)[8] <-c("WinLoss") 
names(Thomas2017)[names(Thomas2017) == "GS"] <- "GameStarted"
names(Thomas2017)[names(Thomas2017) == "MP"] <- "MinsPlayed"

#Fill in the Location Data for the game
Thomas2017$Location <- ifelse(Thomas2017$Location == "@", "Away", "Home") 

#Split MinsPlayed Column into two columns 
Index <- str_split_fixed(Thomas2017$MinsPlayed, ":", 2) #Create County Index Matrix
Thomas2017 <- cbind(Thomas2017, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
names(Thomas2017)[names(Thomas2017) == "1"] <- "Minutes" 
names(Thomas2017)[names(Thomas2017) == "2"] <- "Seconds" 

#Split WinsLoss Column into two columns 
Index <- str_split_fixed(Thomas2017$WinLoss, " ", 2) #Create County Index Matrix
Thomas2017 <- cbind(Thomas2017, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
Thomas2017<- Thomas2017 %>% select(-WinLoss) #remove columns
names(Thomas2017)[names(Thomas2017) == "1"] <- "WinLoss" 
Thomas2017<- Thomas2017 %>% select(-"2")

#Update the Data Types 
#library(hablar)
colnames(Thomas2017)
Thomas2017 <- Thomas2017 %>% convert(
  int("TeamGame", "PlayerGame", "FG", "FGA", "3P", "3PA", "FT", "FTA", "ORB", 
      "DRB", "TRB", "AST", "STL", "BLK", "TOV", "PF", "PTS", "+/-" ), 
  num("FG%", "3P%", "FT%", "FG%", "FT%", "3P%", "GmSc"),
  dte("Date"),
  fct("Team", "Location", "Opponent", "WinLoss", "GameStarted"))

##### Create Data Dictionary ##### 
#Create a vector that counts how many columns are in the data frame
ColNumber <- (seq_len(ncol(Thomas2017)))
#Turn the vector into its own data frame with the first column called ColNumber 
DataDictionary <- as.data.frame(ColNumber)
#Add a column based on the vector of colnames 
DataDictionary$VariableName <- (colnames(Thomas2017))
#Add the variable type into the data frame as a new column called "type"
DataDictionary$DataType <- (sapply(Thomas2017, class))
View(DataDictionary)

Thomas2016 <- "https://www.basketball-reference.com/players/t/thomais02/gamelog/2016"
read_html(Thomas2016)

#After importing the html site, transform to data table
url <- Thomas2016
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
#Here, we indicate that this is the table we want to extract.
pageobj %>%  
  html_nodes("table") %>% 
  .[[8]] %>% 
  html_table(fill=T) -> Thomas2016

#Removes Rows with subheadings
Thomas2016 <- Thomas2016[!(Thomas2016$GS=="Did Not Play" | 
                               Thomas2016$GS=="Did Not Dress" | 
                               Thomas2016$GS=="GS" | 
                               Thomas2016$GS == "Inactive"),]

#Change Column Names
names(Thomas2016)[names(Thomas2016) == "Rk"] <- "TeamGame"
names(Thomas2016)[names(Thomas2016) == "G"] <- "PlayerGame"
names(Thomas2016)[names(Thomas2016) == "Tm"] <- "Team"
colnames(Thomas2016)[6] <-c("Location")
names(Thomas2016)[names(Thomas2016) == "Opp"] <- "Opponent"
colnames(Thomas2016)[8] <-c("WinLoss") 
names(Thomas2016)[names(Thomas2016) == "GS"] <- "GameStarted"
names(Thomas2016)[names(Thomas2016) == "MP"] <- "MinsPlayed"

#Fill in the Location Data for the game
Thomas2016$Location <- ifelse(Thomas2016$Location == "@", "Away", "Home") 

#Split MinsPlayed Column into two columns 
Index <- str_split_fixed(Thomas2016$MinsPlayed, ":", 2) #Create County Index Matrix
Thomas2016 <- cbind(Thomas2016, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
names(Thomas2016)[names(Thomas2016) == "1"] <- "Minutes" 
names(Thomas2016)[names(Thomas2016) == "2"] <- "Seconds" 

#Split WinsLoss Column into two columns 
Index <- str_split_fixed(Thomas2016$WinLoss, " ", 2) #Create County Index Matrix
Thomas2016 <- cbind(Thomas2016, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
Thomas2016<- Thomas2016 %>% select(-WinLoss) #remove columns
names(Thomas2016)[names(Thomas2016) == "1"] <- "WinLoss" 
Thomas2016<- Thomas2016 %>% select(-"2")

#Update the Data Types 
#library(hablar)
colnames(Thomas2016)
Thomas2016 <- Thomas2016 %>% convert(
  int("TeamGame", "PlayerGame", "FG", "FGA", "3P", "3PA", "FT", "FTA", "ORB", 
      "DRB", "TRB", "AST", "STL", "BLK", "TOV", "PF", "PTS", "+/-" ), 
  num("FG%", "3P%", "FT%", "FG%", "FT%", "3P%", "GmSc"),
  dte("Date"),
  fct("Team", "Location", "Opponent", "WinLoss", "GameStarted"))

##### Create Data Dictionary ##### 
#Create a vector that counts how many columns are in the data frame
ColNumber <- (seq_len(ncol(Thomas2016)))
#Turn the vector into its own data frame with the first column called ColNumber 
DataDictionary <- as.data.frame(ColNumber)
#Add a column based on the vector of colnames 
DataDictionary$VariableName <- (colnames(Thomas2016))
#Add the variable type into the data frame as a new column called "type"
DataDictionary$DataType <- (sapply(Thomas2016, class))
View(DataDictionary)

Thomas2015 <- "https://www.basketball-reference.com/players/t/thomais02/gamelog/2015"
  read_html(Thomas2015)

#After importing the html site, transform to data table
url <- Thomas2015
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
#Here, we indicate that this is the table we want to extract.
pageobj %>%  
  html_nodes("table") %>% 
  .[[8]] %>% 
  html_table(fill=T) -> Thomas2015

#Removes Rows with subheadings
Thomas2015 <- Thomas2015[!(Thomas2015$GS=="Did Not Play" | 
                             Thomas2015$GS=="Did Not Dress" | 
                             Thomas2015$GS=="GS" | 
                             Thomas2015$GS == "Inactive"),]

#Change Column Names
names(Thomas2015)[names(Thomas2015) == "Rk"] <- "TeamGame"
names(Thomas2015)[names(Thomas2015) == "G"] <- "PlayerGame"
names(Thomas2015)[names(Thomas2015) == "Tm"] <- "Team"
colnames(Thomas2015)[6] <-c("Location")
names(Thomas2015)[names(Thomas2015) == "Opp"] <- "Opponent"
colnames(Thomas2015)[8] <-c("WinLoss") 
names(Thomas2015)[names(Thomas2015) == "GS"] <- "GameStarted"
names(Thomas2015)[names(Thomas2015) == "MP"] <- "MinsPlayed"

#Fill in the Location Data for the game
Thomas2015$Location <- ifelse(Thomas2015$Location == "@", "Away", "Home") 

#Split MinsPlayed Column into two columns 
Index <- str_split_fixed(Thomas2015$MinsPlayed, ":", 2) #Create County Index Matrix
Thomas2015 <- cbind(Thomas2015, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
names(Thomas2015)[names(Thomas2015) == "1"] <- "Minutes" 
names(Thomas2015)[names(Thomas2015) == "2"] <- "Seconds" 

#Split WinsLoss Column into two columns 
Index <- str_split_fixed(Thomas2015$WinLoss, " ", 2) #Create County Index Matrix
Thomas2015 <- cbind(Thomas2015, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
Thomas2015<- Thomas2015 %>% select(-WinLoss) #remove columns
names(Thomas2015)[names(Thomas2015) == "1"] <- "WinLoss" 
Thomas2015<- Thomas2015 %>% select(-"2")

#Update the Data Types 
#library(hablar)
colnames(Thomas2015)
Thomas2015 <- Thomas2015 %>% convert(
  int("TeamGame", "PlayerGame", "FG", "FGA", "3P", "3PA", "FT", "FTA", "ORB", 
      "DRB", "TRB", "AST", "STL", "BLK", "TOV", "PF", "PTS", "+/-" ), 
  num("FG%", "3P%", "FT%", "FG%", "FT%", "3P%", "GmSc"),
  dte("Date"),
  fct("Team", "Location", "Opponent", "WinLoss", "GameStarted"))

##### Create Data Dictionary ##### 
#Create a vector that counts how many columns are in the data frame
ColNumber <- (seq_len(ncol(Thomas2015)))
#Turn the vector into its own data frame with the first column called ColNumber 
DataDictionary <- as.data.frame(ColNumber)
#Add a column based on the vector of colnames 
DataDictionary$VariableName <- (colnames(Thomas2015))
#Add the variable type into the data frame as a new column called "type"
DataDictionary$DataType <- (sapply(Thomas2015, class))
View(DataDictionary)

Thomas2014 <- "https://www.basketball-reference.com/players/t/thomais02/gamelog/2014"
  read_html(Thomas2014)

#After importing the html site, transform to data table
url <- Thomas2014
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
#Here, we indicate that this is the table we want to extract.
pageobj %>%  
  html_nodes("table") %>% 
  .[[8]] %>% 
  html_table(fill=T) -> Thomas2014

#Removes Rows with subheadings
Thomas2014 <- Thomas2014[!(Thomas2014$GS=="Did Not Play" | 
                             Thomas2014$GS=="Did Not Dress" | 
                             Thomas2014$GS=="GS" | 
                             Thomas2014$GS == "Inactive"),]

#Change Column Names
names(Thomas2014)[names(Thomas2014) == "Rk"] <- "TeamGame"
names(Thomas2014)[names(Thomas2014) == "G"] <- "PlayerGame"
names(Thomas2014)[names(Thomas2014) == "Tm"] <- "Team"
colnames(Thomas2014)[6] <-c("Location")
names(Thomas2014)[names(Thomas2014) == "Opp"] <- "Opponent"
colnames(Thomas2014)[8] <-c("WinLoss") 
names(Thomas2014)[names(Thomas2014) == "GS"] <- "GameStarted"
names(Thomas2014)[names(Thomas2014) == "MP"] <- "MinsPlayed"

#Fill in the Location Data for the game
Thomas2014$Location <- ifelse(Thomas2014$Location == "@", "Away", "Home") 

#Split MinsPlayed Column into two columns 
Index <- str_split_fixed(Thomas2014$MinsPlayed, ":", 2) #Create County Index Matrix
Thomas2014 <- cbind(Thomas2014, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
names(Thomas2014)[names(Thomas2014) == "1"] <- "Minutes" 
names(Thomas2014)[names(Thomas2014) == "2"] <- "Seconds" 

#Split WinsLoss Column into two columns 
Index <- str_split_fixed(Thomas2014$WinLoss, " ", 2) #Create County Index Matrix
Thomas2014 <- cbind(Thomas2014, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
Thomas2014<- Thomas2014 %>% select(-WinLoss) #remove columns
names(Thomas2014)[names(Thomas2014) == "1"] <- "WinLoss" 
Thomas2014<- Thomas2014 %>% select(-"2")

#Update the Data Types 
#library(hablar)
colnames(Thomas2014)
Thomas2014 <- Thomas2014 %>% convert(
  int("TeamGame", "PlayerGame", "FG", "FGA", "3P", "3PA", "FT", "FTA", "ORB", 
      "DRB", "TRB", "AST", "STL", "BLK", "TOV", "PF", "PTS", "+/-" ), 
  num("FG%", "3P%", "FT%", "FG%", "FT%", "3P%", "GmSc"),
  dte("Date"),
  fct("Team", "Location", "Opponent", "WinLoss", "GameStarted"))

##### Create Data Dictionary ##### 
#Create a vector that counts how many columns are in the data frame
ColNumber <- (seq_len(ncol(Thomas2014)))
#Turn the vector into its own data frame with the first column called ColNumber 
DataDictionary <- as.data.frame(ColNumber)
#Add a column based on the vector of colnames 
DataDictionary$VariableName <- (colnames(Thomas2014))
#Add the variable type into the data frame as a new column called "type"
DataDictionary$DataType <- (sapply(Thomas2014, class))
View(DataDictionary)

Thomas2013 <- "https://www.basketball-reference.com/players/t/thomais02/gamelog/2013"
  read_html(Thomas2013)

#After importing the html site, transform to data table
url <- Thomas2013
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
#Here, we indicate that this is the table we want to extract.
pageobj %>%  
  html_nodes("table") %>% 
  .[[8]] %>% 
  html_table(fill=T) -> Thomas2013

#Removes Rows with subheadings
Thomas2013 <- Thomas2013[!(Thomas2013$GS=="Did Not Play" | 
                             Thomas2013$GS=="Did Not Dress" | 
                             Thomas2013$GS=="GS" | 
                             Thomas2013$GS == "Inactive"),]

#Change Column Names
names(Thomas2013)[names(Thomas2013) == "Rk"] <- "TeamGame"
names(Thomas2013)[names(Thomas2013) == "G"] <- "PlayerGame"
names(Thomas2013)[names(Thomas2013) == "Tm"] <- "Team"
colnames(Thomas2013)[6] <-c("Location")
names(Thomas2013)[names(Thomas2013) == "Opp"] <- "Opponent"
colnames(Thomas2013)[8] <-c("WinLoss") 
names(Thomas2013)[names(Thomas2013) == "GS"] <- "GameStarted"
names(Thomas2013)[names(Thomas2013) == "MP"] <- "MinsPlayed"

#Fill in the Location Data for the game
Thomas2013$Location <- ifelse(Thomas2013$Location == "@", "Away", "Home") 

#Split MinsPlayed Column into two columns 
Index <- str_split_fixed(Thomas2013$MinsPlayed, ":", 2) #Create County Index Matrix
Thomas2013 <- cbind(Thomas2013, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
names(Thomas2013)[names(Thomas2013) == "1"] <- "Minutes" 
names(Thomas2013)[names(Thomas2013) == "2"] <- "Seconds" 

#Split WinsLoss Column into two columns 
Index <- str_split_fixed(Thomas2013$WinLoss, " ", 2) #Create County Index Matrix
Thomas2013 <- cbind(Thomas2013, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
Thomas2013<- Thomas2013 %>% select(-WinLoss) #remove columns
names(Thomas2013)[names(Thomas2013) == "1"] <- "WinLoss" 
Thomas2013<- Thomas2013 %>% select(-"2")

#Update the Data Types 
#library(hablar)
colnames(Thomas2013)
Thomas2013 <- Thomas2013 %>% convert(
  int("TeamGame", "PlayerGame", "FG", "FGA", "3P", "3PA", "FT", "FTA", "ORB", 
      "DRB", "TRB", "AST", "STL", "BLK", "TOV", "PF", "PTS", "+/-" ), 
  num("FG%", "3P%", "FT%", "FG%", "FT%", "3P%", "GmSc"),
  dte("Date"),
  fct("Team", "Location", "Opponent", "WinLoss", "GameStarted"))

##### Create Data Dictionary ##### 
#Create a vector that counts how many columns are in the data frame
ColNumber <- (seq_len(ncol(Thomas2013)))
#Turn the vector into its own data frame with the first column called ColNumber 
DataDictionary <- as.data.frame(ColNumber)
#Add a column based on the vector of colnames 
DataDictionary$VariableName <- (colnames(Thomas2013))
#Add the variable type into the data frame as a new column called "type"
DataDictionary$DataType <- (sapply(Thomas2013, class))
View(DataDictionary)

Thomas2012 <- "https://www.basketball-reference.com/players/t/thomais02/gamelog/2012"
  read_html(Thomas2012)

#After importing the html site, transform to data table
url <- Thomas2012
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
#Here, we indicate that this is the table we want to extract.
pageobj %>%  
  html_nodes("table") %>% 
  .[[8]] %>% 
  html_table(fill=T) -> Thomas2012

#Removes Rows with subheadings
Thomas2012 <- Thomas2012[!(Thomas2012$GS=="Did Not Play" | 
                             Thomas2012$GS=="Did Not Dress" | 
                             Thomas2012$GS=="GS" | 
                             Thomas2012$GS == "Inactive"),]

#Change Column Names
names(Thomas2012)[names(Thomas2012) == "Rk"] <- "TeamGame"
names(Thomas2012)[names(Thomas2012) == "G"] <- "PlayerGame"
names(Thomas2012)[names(Thomas2012) == "Tm"] <- "Team"
colnames(Thomas2012)[6] <-c("Location")
names(Thomas2012)[names(Thomas2012) == "Opp"] <- "Opponent"
colnames(Thomas2012)[8] <-c("WinLoss") 
names(Thomas2012)[names(Thomas2012) == "GS"] <- "GameStarted"
names(Thomas2012)[names(Thomas2012) == "MP"] <- "MinsPlayed"

#Fill in the Location Data for the game
Thomas2012$Location <- ifelse(Thomas2012$Location == "@", "Away", "Home") 

#Split MinsPlayed Column into two columns 
Index <- str_split_fixed(Thomas2012$MinsPlayed, ":", 2) #Create County Index Matrix
Thomas2012 <- cbind(Thomas2012, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
names(Thomas2012)[names(Thomas2012) == "1"] <- "Minutes" 
names(Thomas2012)[names(Thomas2012) == "2"] <- "Seconds" 

#Split WinsLoss Column into two columns 
Index <- str_split_fixed(Thomas2012$WinLoss, " ", 2) #Create County Index Matrix
Thomas2012 <- cbind(Thomas2012, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
Thomas2012<- Thomas2012 %>% select(-WinLoss) #remove columns
names(Thomas2012)[names(Thomas2012) == "1"] <- "WinLoss" 
Thomas2012<- Thomas2012 %>% select(-"2")

#Update the Data Types 
#library(hablar)
colnames(Thomas2012)
Thomas2012 <- Thomas2012 %>% convert(
  int("TeamGame", "PlayerGame", "FG", "FGA", "3P", "3PA", "FT", "FTA", "ORB", 
      "DRB", "TRB", "AST", "STL", "BLK", "TOV", "PF", "PTS", "+/-" ), 
  num("FG%", "3P%", "FT%", "FG%", "FT%", "3P%", "GmSc"),
  dte("Date"),
  fct("Team", "Location", "Opponent", "WinLoss", "GameStarted"))

##### Create Data Dictionary ##### 
#Create a vector that counts how many columns are in the data frame
ColNumber <- (seq_len(ncol(Thomas2012)))
#Turn the vector into its own data frame with the first column called ColNumber 
DataDictionary <- as.data.frame(ColNumber)
#Add a column based on the vector of colnames 
DataDictionary$VariableName <- (colnames(Thomas2012))
#Add the variable type into the data frame as a new column called "type"
DataDictionary$DataType <- (sapply(Thomas2012, class))
View(DataDictionary)


Thomas <- rbind(Thomas2012, Thomas2013, Thomas2014, Thomas2015, 
                Thomas2016, Thomas2017, Thomas2018, Thomas2019, 
                Thomas2020)

Thomas$PlayerGame <- seq.int(nrow(Thomas))
Thomas$Player <- "Thomas"

ggplot(Thomas, aes(x = PlayerGame, y = GmSc, color = Team)) + 
  geom_jitter() +
  geom_smooth(se= FALSE) +
  ggtitle("Isaiah Thomas Game Score") + 
  xlab("Games Played") + 
  ylab("Game Score") + 
  theme_classic() + 
  theme(axis.text.x = element_blank(), 
        axis.ticks = element_blank(), 
        axis.line = element_line(linetype = "blank"))

setwd("/Users/amandapiter/Documents/Projects")
openxlsx::write.xlsx(Thomas, file = "1.11.20 Thomas Stats.xlsx")


