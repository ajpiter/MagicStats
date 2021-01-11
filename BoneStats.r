library(rvest) #version 0.3.6 
library(dplyr)
library(hablar) #Used to convert data types
library(ggplot2) #graphing 
library(stringr) #spliting columns 

#Jordon Bone 2020 -2021 Season  
Bone2021 <- "https://www.basketball-reference.com/players/b/bonejo01/gamelog/2021"
  read_html(Bone2021)

#After importing the html site, transform to data table
url <- Bone2021
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
#Here, we indicate that this is the table we want to extract.
pageobj %>%  
  html_nodes("table") %>% 
  .[[8]] %>% 
  html_table(fill=T) -> Bone2021

#Removes Rows with subheadings
Bone2021 <- Bone2021[!(Bone2021$GS=="Did Not Play" | 
                         Bone2021$GS=="Did Not Dress" | 
                         Bone2021$GS=="GS" | 
                         Bone2021$GS == "Inactive"),]

#Change Column Names
names(Bone2021)[names(Bone2021) == "Rk"] <- "TeamGame"
names(Bone2021)[names(Bone2021) == "G"] <- "PlayerGame"
names(Bone2021)[names(Bone2021) == "Tm"] <- "Team"
colnames(Bone2021)[6] <-c("Location")
names(Bone2021)[names(Bone2021) == "Opp"] <- "Opponent"
colnames(Bone2021)[8] <-c("WinLoss") 
names(Bone2021)[names(Bone2021) == "GS"] <- "GameStarted"
names(Bone2021)[names(Bone2021) == "MP"] <- "MinsPlayed"

#Fill in the Location Data for the game
Bone2021$Location <- ifelse(Bone2021$Location == "@", "Away", "Home") 

#Split MinsPlayed Column into two columns 
Index <- str_split_fixed(Bone2021$MinsPlayed, ":", 2) #Create County Index Matrix
Bone2021 <- cbind(Bone2021, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
names(Bone2021)[names(Bone2021) == "1"] <- "Minutes" 
names(Bone2021)[names(Bone2021) == "2"] <- "Seconds" 

#Split WinsLoss Column into two columns 
Index <- str_split_fixed(Bone2021$WinLoss, " ", 2) #Create County Index Matrix
Bone2021 <- cbind(Bone2021, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
Bone2021<- Bone2021 %>% select(-WinLoss) #remove columns
names(Bone2021)[names(Bone2021) == "1"] <- "WinLoss" 
Bone2021<- Bone2021 %>% select(-"2")

#Update the Data Types 
#library(hablar)
colnames(Bone2021)
Bone2021 <- Bone2021 %>% convert(
  int("TeamGame", "PlayerGame", "FG", "FGA", "3P", "3PA", "FT", "FTA", "ORB", 
      "DRB", "TRB", "AST", "STL", "BLK", "TOV", "PF", "PTS", "+/-" ), 
  num("FG%", "3P%", "FT%", "FG%", "FT%", "3P%", "GmSc"),
  dte("Date"),
  fct("Team", "Location", "Opponent", "WinLoss", "GameStarted"))

##### Create Data Dictionary ##### 
#Create a vector that counts how many columns are in the data frame
ColNumber <- (seq_len(ncol(Bone2021)))
#Turn the vector into its own data frame with the first column called ColNumber 
DataDictionary <- as.data.frame(ColNumber)
#Add a column based on the vector of colnames 
DataDictionary$VariableName <- (colnames(Bone2021))
#Add the variable type into the data frame as a new column called "type"
DataDictionary$DataType <- (sapply(Bone2021, class))
View(DataDictionary)

#Jordon Bone 2019 -2020 Season  
Bone2020 <- "https://www.basketball-reference.com/players/b/bonejo01/gamelog/2020"
  read_html(Bone2020)

#After importing the html site, transform to data table
url <- Bone2020
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
#Here, we indicate that this is the table we want to extract.
pageobj %>%  
  html_nodes("table") %>% 
  .[[8]] %>% 
  html_table(fill=T) -> Bone2020

#Removes Rows with subheadings
Bone2020 <- Bone2020[!(Bone2020$GS=="Did Not Play" | 
                         Bone2020$GS=="Did Not Dress" | 
                         Bone2020$GS=="GS" | 
                         Bone2020$GS == "Inactive"),]

#Change Column Names
names(Bone2020)[names(Bone2020) == "Rk"] <- "TeamGame"
names(Bone2020)[names(Bone2020) == "G"] <- "PlayerGame"
names(Bone2020)[names(Bone2020) == "Tm"] <- "Team"
colnames(Bone2020)[6] <-c("Location")
names(Bone2020)[names(Bone2020) == "Opp"] <- "Opponent"
colnames(Bone2020)[8] <-c("WinLoss") 
names(Bone2020)[names(Bone2020) == "GS"] <- "GameStarted"
names(Bone2020)[names(Bone2020) == "MP"] <- "MinsPlayed"

#Fill in the Location Data for the game
Bone2020$Location <- ifelse(Bone2020$Location == "@", "Away", "Home") 

#Split MinsPlayed Column into two columns 
Index <- str_split_fixed(Bone2020$MinsPlayed, ":", 2) #Create County Index Matrix
Bone2020 <- cbind(Bone2020, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
names(Bone2020)[names(Bone2020) == "1"] <- "Minutes" 
names(Bone2020)[names(Bone2020) == "2"] <- "Seconds" 

#Split WinsLoss Column into two columns 
Index <- str_split_fixed(Bone2020$WinLoss, " ", 2) #Create County Index Matrix
Bone2020 <- cbind(Bone2020, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
Bone2020<- Bone2020 %>% select(-WinLoss) #remove columns
names(Bone2020)[names(Bone2020) == "1"] <- "WinLoss" 
Bone2020<- Bone2020 %>% select(-"2")

#Update the Data Types 
#library(hablar)
colnames(Bone2020)
Bone2020 <- Bone2020 %>% convert(
  int("TeamGame", "PlayerGame", "FG", "FGA", "3P", "3PA", "FT", "FTA", "ORB", 
      "DRB", "TRB", "AST", "STL", "BLK", "TOV", "PF", "PTS", "+/-" ), 
  num("FG%", "3P%", "FT%", "FG%", "FT%", "3P%", "GmSc"),
  dte("Date"),
  fct("Team", "Location", "Opponent", "WinLoss", "GameStarted"))

##### Create Data Dictionary ##### 
#Create a vector that counts how many columns are in the data frame
ColNumber <- (seq_len(ncol(Bone2020)))
#Turn the vector into its own data frame with the first column called ColNumber 
DataDictionary <- as.data.frame(ColNumber)
#Add a column based on the vector of colnames 
DataDictionary$VariableName <- (colnames(Bone2020))
#Add the variable type into the data frame as a new column called "type"
DataDictionary$DataType <- (sapply(Bone2020, class))
View(DataDictionary)

Bone <- rbind(Bone2020, Bone2021) 
Bone$PlayerGame <- seq.int(nrow(Bone))
Bone$Player <- "Bone"

ggplot(Bone, aes(x = PlayerGame, y = GmSc, color = Team)) + 
  geom_jitter() +
  geom_smooth(se = FALSE) + 
  ggtitle("Bone 2019-2021") + 
  xlab("") + 
  ylab("Game Score") + 
  theme_classic() + 
  theme(axis.text.x = element_blank(), axis.ticks = element_blank(), axis.line = element_line(linetype = "blank"))

##### Export Data Table as Excel Saved on Local Drive ##### 
getwd()
setwd("/Users/amandapiter/Documents/Projects")
openxlsx::write.xlsx(Bone, file = "1.11.20 Bone Stats.xlsx")
openxlsx::write.xlsx(Bone2020, file = "1.11.20 Bone 2020 Stats.xlsx")
openxlsx::write.xlsx(Bone2021, file = "1.11.20 Bone 2021 Stats.xlsx")
