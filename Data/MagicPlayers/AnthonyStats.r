library(rvest) #version 0.3.6 
library(dplyr)
library(hablar) #Used to convert data types
library(ggplot2) #graphing 
library(stringr) #spliting columns 

#Cole Anthony 2020-2021 Season  
Anthony2021 <- "https://www.basketball-reference.com/players/a/anthoco01/gamelog/2021/"
read_html(Anthony2021)

#After importing the html site, transform to data table
url <- Anthony2021
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
#Here, we indicate that this is the table we want to extract.
pageobj %>%  
  html_nodes("table") %>% 
  .[[8]] %>% 
  html_table(fill=T) -> Anthony2021

#Removes Rows with subheadings
Anthony2021 <- Anthony2021[!(Anthony2021$GS=="Did Not Play" | 
                           Anthony2021$GS=="Did Not Dress" | 
                           Anthony2021$GS=="GS" | 
                           Anthony2021$GS == "Inactive"),]

#Change Column Names
names(Anthony2021)[names(Anthony2021) == "Rk"] <- "TeamGame"
names(Anthony2021)[names(Anthony2021) == "G"] <- "PlayerGame"
names(Anthony2021)[names(Anthony2021) == "Tm"] <- "Team"
colnames(Anthony2021)[6] <-c("Location")
names(Anthony2021)[names(Anthony2021) == "Opp"] <- "Opponent"
colnames(Anthony2021)[8] <-c("WinLoss") 
names(Anthony2021)[names(Anthony2021) == "GS"] <- "GameStarted"
names(Anthony2021)[names(Anthony2021) == "MP"] <- "MinsPlayed"

#Fill in the Location Data for the game
Anthony2021$Location <- ifelse(Anthony2021$Location == "@", "Away", "Home") 

#Split MinsPlayed Column into two columns 
Index <- str_split_fixed(Anthony2021$MinsPlayed, ":", 2) #Create County Index Matrix
Anthony2021 <- cbind(Anthony2021, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
names(Anthony2021)[names(Anthony2021) == "1"] <- "Minutes" 
names(Anthony2021)[names(Anthony2021) == "2"] <- "Seconds" 

#Split WinsLoss Column into two columns 
Index <- str_split_fixed(Anthony2021$WinLoss, " ", 2) #Create County Index Matrix
Anthony2021 <- cbind(Anthony2021, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
Anthony2021<- Anthony2021 %>% select(-WinLoss) #remove columns
names(Anthony2021)[names(Anthony2021) == "1"] <- "WinLoss" 
Anthony2021<- Anthony2021 %>% select(-"2")

#Update the Data Types 
#library(hablar)
colnames(Anthony2021)
Anthony2021 <- Anthony2021 %>% convert(
  int("TeamGame", "PlayerGame", "FG", "FGA", "3P", "3PA", "FT", "FTA", "ORB", 
      "DRB", "TRB", "AST", "STL", "BLK", "TOV", "PF", "PTS", "+/-" ), 
  num("FG%", "3P%", "FT%", "FG%", "FT%", "3P%", "GmSc"),
  dte("Date"),
  fct("Team", "Location", "Opponent", "WinLoss", "GameStarted"))

##### Create Data Dictionary ##### 
#Create a vector that counts how many columns are in the data frame
ColNumber <- (seq_len(ncol(Anthony2021)))
#Turn the vector into its own data frame with the first column called ColNumber 
DataDictionary <- as.data.frame(ColNumber)
#Add a column based on the vector of colnames 
DataDictionary$VariableName <- (colnames(Anthony2021))
#Add the variable type into the data frame as a new column called "type"
DataDictionary$DataType <- (sapply(Anthony2021, class))
View(DataDictionary)

ggplot(Anthony2021, aes(x = PlayerGame, y = GmSc)) + 
  geom_jitter() +
  geom_smooth(se= FALSE) +
  ggtitle("Cole Anothony 2020-2021 ") + 
  xlab("Time") + 
  ylab("Game Score") + 
  theme_classic() + 
  theme(axis.text.x = element_blank(), axis.ticks = element_blank(), axis.line = element_line(linetype = "blank"))
