version #R version 4.0.2 (2020-06-22)
library(rvest) #version 0.3.6 
library(hablar) #Used to convert data types
library(dplyr)
#session_info(pkgs = NULL, include_base = FALSE)

##### Import Table, Game Log for Orlando Magic 2019-2020 #####
BrOrl20GameLog <- "https://www.basketball-reference.com/teams/ORL/2020/gamelog/"
read_html(BrOrl20GameLog)

#After importing the html site, transform to data table
url <- BrOrl20GameLog
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
pageobj %>%  
  html_nodes("table") %>% 
  .[[1]] %>% #Here, we indicate that this is the table we want to extract.
  html_table(fill=T) -> OrlGameLog20

#Update Column labels 
coltitle <- as.character(OrlGameLog20[1,]) # read the column names from row 1
colnames(OrlGameLog20) <- coltitle # add the column names to x
OrlGameLog20 <- OrlGameLog20[-1,] # remove the first row and the 1st column of the data
OrlGameLog20 <- OrlGameLog20[-21:-22,] #remove non-game stats 
OrlGameLog20 <- OrlGameLog20[-41:-42,] #remove non-game stats 
OrlGameLog20 <- OrlGameLog20[-61:-62,] #remove non-game stats 

##### Import Table, Game Log for Orlando Magic 2018-2019 #####
BrOrl19GameLog <- "https://www.basketball-reference.com/teams/ORL/2019/gamelog/"
read_html(BrOrl19GameLog)

#After importing the html site, transform to data table
url <- BrOrl19GameLog
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
pageobj %>%  
  html_nodes("table") %>% 
  .[[1]] %>% #Here, we indicate that this is the table we want to extract.
  html_table(fill=T) -> OrlGameLog19

#Update Column labels 
coltitle <- as.character(OrlGameLog19[1,]) # read the column names from row 1
colnames(OrlGameLog19) <- coltitle # add the column names to x
OrlGameLog19 <- OrlGameLog19[-1,] # remove the first row and the 1st column of the data
OrlGameLog19 <- OrlGameLog19[-21:-22,] #remove non-game stats 
OrlGameLog19 <- OrlGameLog19[-41:-42,] #remove non-game stats 
OrlGameLog19 <- OrlGameLog19[-61:-62,] #remove non-game stats 

##### Import Table, Game Log for Orlando Magic 2017-2018 #####
BrOrl18GameLog <- "https://www.basketball-reference.com/teams/ORL/2018/gamelog/"
read_html(BrOrl18GameLog)

#After importing the html site, transform to data table
url <- BrOrl18GameLog
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
pageobj %>%  
  html_nodes("table") %>% 
  .[[1]] %>% #Here, we indicate that this is the table we want to extract.
  html_table(fill=T) -> OrlGameLog18

#Update Column labels 
coltitle <- as.character(OrlGameLog18[1,]) # read the column names from row 1
colnames(OrlGameLog18) <- coltitle # add the column names to x
OrlGameLog18 <- OrlGameLog18[-1,] # remove the first row and the 1st column of the data
OrlGameLog18 <- OrlGameLog18[-21:-22,] #remove non-game stats 
OrlGameLog18 <- OrlGameLog18[-41:-42,] #remove non-game stats 
OrlGameLog18 <- OrlGameLog18[-61:-62,] #remove non-game stats 

##### Import Table, Game Log for Orlando Magic 2016-2017 #####
BrOrl17GameLog <- "https://www.basketball-reference.com/teams/ORL/2017/gamelog/"
read_html(BrOrl17GameLog)

#After importing the html site, transform to data table
url <- BrOrl17GameLog
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
pageobj %>%  
  html_nodes("table") %>% 
  .[[1]] %>% #Here, we indicate that this is the table we want to extract.
  html_table(fill=T) -> OrlGameLog17

#Update Column labels 
coltitle <- as.character(OrlGameLog17[1,]) # read the column names from row 1
colnames(OrlGameLog17) <- coltitle # add the column names to x
OrlGameLog17 <- OrlGameLog17[-1,] # remove the first row and the 1st column of the data
OrlGameLog17 <- OrlGameLog17[-21:-22,] #remove non-game stats 
OrlGameLog17 <- OrlGameLog17[-41:-42,] #remove non-game stats 
OrlGameLog17 <- OrlGameLog17[-61:-62,] #remove non-game stats 

##### Import Table, Game Log for Orlando Magic 2015-2016 #####
BrOrl16GameLog <- "https://www.basketball-reference.com/teams/ORL/2016/gamelog/"
read_html(BrOrl16GameLog)

#After importing the html site, transform to data table
url <- BrOrl16GameLog
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
pageobj %>%  
  html_nodes("table") %>% 
  .[[1]] %>% #Here, we indicate that this is the table we want to extract.
  html_table(fill=T) -> OrlGameLog16

#Update Column labels 
coltitle <- as.character(OrlGameLog16[1,]) # read the column names from row 1
colnames(OrlGameLog16) <- coltitle # add the column names to x
OrlGameLog16 <- OrlGameLog16[-1,] # remove the first row and the 1st column of the data
OrlGameLog16 <- OrlGameLog16[-21:-22,] #remove non-game stats 
OrlGameLog16 <- OrlGameLog16[-41:-42,] #remove non-game stats 
OrlGameLog16 <- OrlGameLog16[-61:-62,] #remove non-game stats 

##### Import Table, Game Log for Orlando Magic 2014-2015 #####
BrOrl15GameLog <- "https://www.basketball-reference.com/teams/ORL/2015/gamelog/"
read_html(BrOrl15GameLog)

#After importing the html site, transform to data table
url <- BrOrl15GameLog
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
pageobj %>%  
  html_nodes("table") %>% 
  .[[1]] %>% #Here, we indicate that this is the table we want to extract.
  html_table(fill=T) -> OrlGameLog15

#Update Column labels 
coltitle <- as.character(OrlGameLog15[1,]) # read the column names from row 1
colnames(OrlGameLog15) <- coltitle # add the column names to x
OrlGameLog15 <- OrlGameLog15[-1,] # remove the first row and the 1st column of the data
OrlGameLog15 <- OrlGameLog15[-21:-22,] #remove non-game stats 
OrlGameLog15 <- OrlGameLog15[-41:-42,] #remove non-game stats 
OrlGameLog15 <- OrlGameLog15[-61:-62,] #remove non-game stats 

##### Import Table, Game Log for Orlando Magic 2013-2014 #####
BrOrl14GameLog <- "https://www.basketball-reference.com/teams/ORL/2014/gamelog/"
read_html(BrOrl14GameLog)

#After importing the html site, transform to data table
url <- BrOrl14GameLog
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
pageobj %>%  
  html_nodes("table") %>% 
  .[[1]] %>% #Here, we indicate that this is the table we want to extract.
  html_table(fill=T) -> OrlGameLog14

#Update Column labels 
coltitle <- as.character(OrlGameLog14[1,]) # read the column names from row 1
colnames(OrlGameLog14) <- coltitle # add the column names to x
OrlGameLog14 <- OrlGameLog14[-1,] # remove the first row and the 1st column of the data
OrlGameLog14 <- OrlGameLog14[-21:-22,] #remove non-game stats 
OrlGameLog14 <- OrlGameLog14[-41:-42,] #remove non-game stats 
OrlGameLog14 <- OrlGameLog14[-61:-62,] #remove non-game stats 

##### Import Table, Game Log for Orlando Magic 2012-2013 #####
BrOrl13GameLog <- "https://www.basketball-reference.com/teams/ORL/2013/gamelog/"
read_html(BrOrl13GameLog)

#After importing the html site, transform to data table
url <- BrOrl13GameLog
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
pageobj %>%  
  html_nodes("table") %>% 
  .[[1]] %>% #Here, we indicate that this is the table we want to extract.
  html_table(fill=T) -> OrlGameLog13

#Update Column labels 
coltitle <- as.character(OrlGameLog13[1,]) # read the column names from row 1
colnames(OrlGameLog13) <- coltitle # add the column names to x
OrlGameLog13 <- OrlGameLog13[-1,] # remove the first row and the 1st column of the data
OrlGameLog13 <- OrlGameLog13[-21:-22,] #remove non-game stats 
OrlGameLog13 <- OrlGameLog13[-41:-42,] #remove non-game stats 
OrlGameLog13 <- OrlGameLog13[-61:-62,] #remove non-game stats 

##### Import Table, Game Log for Orlando Magic 2011-2012 #####
BrOrl12GameLog <- "https://www.basketball-reference.com/teams/ORL/2012/gamelog/"
read_html(BrOrl12GameLog)

#After importing the html site, transform to data table
url <- BrOrl12GameLog
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
pageobj %>%  
  html_nodes("table") %>% 
  .[[1]] %>% #Here, we indicate that this is the table we want to extract.
  html_table(fill=T) -> OrlGameLog12

#Update Column labels 
coltitle <- as.character(OrlGameLog12[1,]) # read the column names from row 1
colnames(OrlGameLog12) <- coltitle # add the column names to x
OrlGameLog12 <- OrlGameLog12[-1,] # remove the first row and the 1st column of the data
OrlGameLog12 <- OrlGameLog12[-21:-22,] #remove non-game stats 
OrlGameLog12 <- OrlGameLog12[-41:-42,] #remove non-game stats 
OrlGameLog12 <- OrlGameLog12[-61:-62,] #remove non-game stats 

##### Import Table, Game Log for Orlando Magic 2010-2011 #####
BrOrl11GameLog <- "https://www.basketball-reference.com/teams/ORL/2011/gamelog/"
read_html(BrOrl11GameLog)

#After importing the html site, transform to data table
url <- BrOrl11GameLog
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
pageobj %>%  
  html_nodes("table") %>% 
  .[[1]] %>% #Here, we indicate that this is the table we want to extract.
  html_table(fill=T) -> OrlGameLog11

#Update Column labels 
coltitle <- as.character(OrlGameLog11[1,]) # read the column names from row 1
colnames(OrlGameLog11) <- coltitle # add the column names to x
OrlGameLog11 <- OrlGameLog11[-1,] # remove the first row and the 1st column of the data
OrlGameLog11 <- OrlGameLog11[-21:-22,] #remove non-game stats 
OrlGameLog11 <- OrlGameLog11[-41:-42,] #remove non-game stats 
OrlGameLog11 <- OrlGameLog11[-61:-62,] #remove non-game stats 

##### Import Table, Game Log for Orlando Magic 2009-2010 #####
BrOrl10GameLog <- "https://www.basketball-reference.com/teams/ORL/2010/gamelog/"
read_html(BrOrl10GameLog)

#After importing the html site, transform to data table
url <- BrOrl10GameLog
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
pageobj %>%  
  html_nodes("table") %>% 
  .[[1]] %>% #Here, we indicate that this is the table we want to extract.
  html_table(fill=T) -> OrlGameLog10

#Update Column labels 
coltitle <- as.character(OrlGameLog10[1,]) # read the column names from row 1
colnames(OrlGameLog10) <- coltitle # add the column names to x
OrlGameLog10 <- OrlGameLog10[-1,] # remove the first row 
OrlGameLog10 <- OrlGameLog10[-21:-22,] #remove non-game stats 
OrlGameLog10 <- OrlGameLog10[-41:-42,] #remove non-game stats 
OrlGameLog10 <- OrlGameLog10[-61:-62,] #remove non-game stats 

OrlGameLog <- rbind(OrlGameLog10, OrlGameLog11, OrlGameLog12, OrlGameLog13, OrlGameLog14, 
                    OrlGameLog15, OrlGameLog16, OrlGameLog17, OrlGameLog18, OrlGameLog19, 
                    OrlGameLog20)

##### Create Data Dictionary ##### 
#Create a vector that counts how many columns are in the data frame
ColNumber <- (seq_len(ncol(OrlGameLog)))
#Turn the vector into its own data frame with the first column called ColNumber 
DataDictionary <- as.data.frame(ColNumber)
#Add a column based on the vector of colnames 
DataDictionary$VariableName <- (colnames(OrlGameLog))
#Add the variable type into the data frame as a new column called "type"
DataDictionary$DataType <- (sapply(OrlGameLog, class))
View(DataDictionary) 

##### Clean the OrlGameLog Data Frame based on insights from the Data Dictionary #####

#Removes Rows with subheadings
OrlGameLog <- OrlGameLog[!(OrlGameLog$Rk=="Rk"),]
OrlGameLog <- OrlGameLog[!(OrlGameLog$FG=="Team"),]

#Update the Game Rank to reflect all seasons
OrlGameLog$Rk <- seq.int(nrow(OrlGameLog))

#Change Column Names
names(OrlGameLog)[names(OrlGameLog) == "Rk"] <- "GameRank"
names(OrlGameLog)[names(OrlGameLog) == "G"] <- "SeasonGame"
colnames(OrlGameLog)[4] <-c("Location") 
colnames(housing.df)[5] <-c("Opponent") 
names(OrlGameLog)[names(OrlGameLog) == "W/L"] <- "WinLoss"
names(OrlGameLog)[names(OrlGameLog) == "Tm"] <- "MagicPoints"
#Multiple columns had the same name, requiring us to indicate column position
colnames(OrlGameLog)[8] <-c("OppPoints") 
colnames(OrlGameLog)[9] <-c("MagicFG") 
colnames(OrlGameLog)[10] <-c("MagicFGA") 
colnames(OrlGameLog)[11] <-c("MagicFG%") 
colnames(OrlGameLog)[12] <-c("Magic3P") 
colnames(OrlGameLog)[13] <-c("Magic3PA") 
colnames(OrlGameLog)[14] <-c("Magic3P%") 
colnames(OrlGameLog)[15] <-c("MagicFT") 
colnames(OrlGameLog)[16] <-c("MagicFTA") 
colnames(OrlGameLog)[17] <-c("MagicFT%") 
colnames(OrlGameLog)[18] <-c("MagicOffensiveRebounds") 
colnames(OrlGameLog)[19] <-c("MagicTotalRebounds") 
colnames(OrlGameLog)[20] <-c("MagicAssists") 
colnames(OrlGameLog)[21] <-c("MagicSteals") 
colnames(OrlGameLog)[22] <-c("MagicBlocks") 
colnames(OrlGameLog)[23] <-c("MagicTurnovers") 
colnames(OrlGameLog)[24] <-c("MagicPersonalFouls") 
#column 25 will be removed
colnames(OrlGameLog)[26] <-c("OppFG") 
colnames(OrlGameLog)[27] <-c("OppFGA") 
colnames(OrlGameLog)[28] <-c("OppFG%") 
colnames(OrlGameLog)[29] <-c("Opp3P") 
colnames(OrlGameLog)[30] <-c("Opp3PA") 
colnames(OrlGameLog)[31] <-c("Opp3P%") 
colnames(OrlGameLog)[32] <-c("OppFT") 
colnames(OrlGameLog)[33] <-c("OppFTA") 
colnames(OrlGameLog)[34] <-c("OppFT%") 
colnames(OrlGameLog)[35] <-c("OppOffensiveRebounds") 
colnames(OrlGameLog)[36] <-c("OppTotalRebounds") 
colnames(OrlGameLog)[37] <-c("OppAssists") 
colnames(OrlGameLog)[38] <-c("OppSteals") 
colnames(OrlGameLog)[39] <-c("OppBlocks") 
colnames(OrlGameLog)[40] <-c("OppTurnovers") 
colnames(OrlGameLog)[41] <-c("OppPersonalFouls") 

#Remove Null Column 
OrlGameLog <- OrlGameLog[,-25] # remove NA column

#Fill in the Location Data for the game
OrlGameLog$Location <- ifelse(OrlGameLog$Location == "@", "Away", "Home") 

#Update Data Type
colnames(OrlGameLog) #lists column names for easy copying and pasting into code

library(hablar)
OrlGameLog <- OrlGameLog %>% convert(
  int(GameRank, SeasonGame, MagicPoints, OppPoints, MagicFG, MagicFGA, 
      Magic3P, Magic3PA, MagicFT, MagicFTA, MagicOffensiveRebounds, 
      MagicTotalRebounds, MagicAssists, MagicSteals, MagicBlocks, MagicTurnovers, MagicPersonalFouls,
      OppFG, OppFGA, OppFT, OppFGA, Opp3P, Opp3PA, OppOffensiveRebounds, 
      OppTotalRebounds, OppAssists, OppSteals, OppBlocks, OppTurnovers, OppPersonalFouls), 
  num("MagicFG%", "Magic3P%", "MagicFT%", "OppFG%", "OppFT%", "Opp3P%"),
  dte("Date"),
  fct("Location", "Opp", "WinLoss"))

#Add a column for notes 
OrlGameLog$Notes <- NA

#Update Data Dictionary 
ColNumber <- (seq_len(ncol(OrlGameLog)))
DataDictionary <- as.data.frame(ColNumber)
DataDictionary$VariableName <- (colnames(OrlGameLog))
DataDictionary$DataType <- (sapply(OrlGameLog, class))
View(DataDictionary) 

##### Export Data Table as Excel Saved on Local Drive ##### 
setwd("/Users/Username/Documents/folder/subfolder")
openxlsx::write.xlsx(OrlGameLog, file = "1.5.20_OrlGameLog.xlsx")
openxlsx::write.xlsx(DataDictionary, file = "1.5.20_OrlGameLog_DD.xlsx")
