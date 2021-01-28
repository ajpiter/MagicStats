#Michael Carter Williams 2020-2021 Season  
CarterWilliams2021 <- "https://www.basketball-reference.com/players/c/cartemi01/gamelog/2021/"
read_html(CarterWilliams2021)

#After importing the html site, transform to data table
url <- CarterWilliams2021
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
#Here, we indicate that this is the table we want to extract.
pageobj %>%  
  html_nodes("table") %>% 
  .[[8]] %>% 
  html_table(fill=T) -> CarterWilliams2021

#Removes Rows with subheadings
CarterWilliams2021 <- CarterWilliams2021[!(CarterWilliams2021$GS=="Did Not Play" | 
                           CarterWilliams2021$GS=="Did Not Dress" | 
                           CarterWilliams2021$GS=="GS" | 
                           CarterWilliams2021$GS == "Inactive"),]

#Change Column Names
names(CarterWilliams2021)[names(CarterWilliams2021) == "Rk"] <- "TeamGame"
names(CarterWilliams2021)[names(CarterWilliams2021) == "G"] <- "PlayerGame"
names(CarterWilliams2021)[names(CarterWilliams2021) == "Tm"] <- "Team"
colnames(CarterWilliams2021)[6] <-c("Location")
names(CarterWilliams2021)[names(CarterWilliams2021) == "Opp"] <- "Opponent"
colnames(CarterWilliams2021)[8] <-c("WinLoss") 
names(CarterWilliams2021)[names(CarterWilliams2021) == "GS"] <- "GameStarted"
names(CarterWilliams2021)[names(CarterWilliams2021) == "MP"] <- "MinsPlayed"

#Fill in the Location Data for the game
CarterWilliams2021$Location <- ifelse(CarterWilliams2021$Location == "@", "Away", "Home") 

#Split MinsPlayed Column into two columns 
Index <- str_split_fixed(CarterWilliams2021$MinsPlayed, ":", 2) #Create County Index Matrix
CarterWilliams2021 <- cbind(CarterWilliams2021, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
names(CarterWilliams2021)[names(CarterWilliams2021) == "1"] <- "Minutes" 
names(CarterWilliams2021)[names(CarterWilliams2021) == "2"] <- "Seconds" 

#Split WinsLoss Column into two columns 
Index <- str_split_fixed(CarterWilliams2021$WinLoss, " ", 2) #Create County Index Matrix
CarterWilliams2021 <- cbind(CarterWilliams2021, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
CarterWilliams2021<- CarterWilliams2021 %>% select(-WinLoss) #remove columns
names(CarterWilliams2021)[names(CarterWilliams2021) == "1"] <- "WinLoss" 
CarterWilliams2021<- CarterWilliams2021 %>% select(-"2")

#Update the Data Types 
#library(hablar)
colnames(CarterWilliams2021)
CarterWilliams2021 <- CarterWilliams2021 %>% convert(
  int("TeamGame", "PlayerGame", "FG", "FGA", "3P", "3PA", "FT", "FTA", "ORB", 
      "DRB", "TRB", "AST", "STL", "BLK", "TOV", "PF", "PTS", "+/-" ), 
  num("FG%", "3P%", "FT%", "FG%", "FT%", "3P%", "GmSc"),
  dte("Date"),
  fct("Team", "Location", "Opponent", "WinLoss", "GameStarted"))

##### Create Data Dictionary ##### 
#Create a vector that counts how many columns are in the data frame
ColNumber <- (seq_len(ncol(CarterWilliams2021)))
#Turn the vector into its own data frame with the first column called ColNumber 
DataDictionary <- as.data.frame(ColNumber)
#Add a column based on the vector of colnames 
DataDictionary$VariableName <- (colnames(CarterWilliams2021))
#Add the variable type into the data frame as a new column called "type"
DataDictionary$DataType <- (sapply(CarterWilliams2021, class))
View(DataDictionary)

ggplot(CarterWilliams2021, aes(x = PlayerGame, y = GmSc)) + 
  geom_jitter() +
  ggtitle("Michael Carter Williams 2020-2021") + 
  xlab("Time") + 
  ylab("Game Score") + 
  theme_classic() + 
  theme(axis.text.x = element_blank(), axis.ticks = element_blank(), axis.line = element_line(linetype = "blank"))

#Michael Carter Williams 2020-2021 Season  
CarterWilliams2020 <- "https://www.basketball-reference.com/players/c/cartemi01/gamelog/2020"
read_html(CarterWilliams2020)

#After importing the html site, transform to data table
url <- CarterWilliams2020
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
#Here, we indicate that this is the table we want to extract.
pageobj %>%  
  html_nodes("table") %>% 
  .[[8]] %>% 
  html_table(fill=T) -> CarterWilliams2020

#Removes Rows with subheadings
CarterWilliams2020 <- CarterWilliams2020[!(CarterWilliams2020$GS=="Did Not Play" | 
                           CarterWilliams2020$GS=="Did Not Dress" | 
                           CarterWilliams2020$GS=="GS" | 
                           CarterWilliams2020$GS == "Inactive"),]

#Change Column Names
names(CarterWilliams2020)[names(CarterWilliams2020) == "Rk"] <- "TeamGame"
names(CarterWilliams2020)[names(CarterWilliams2020) == "G"] <- "PlayerGame"
names(CarterWilliams2020)[names(CarterWilliams2020) == "Tm"] <- "Team"
colnames(CarterWilliams2020)[6] <-c("Location")
names(CarterWilliams2020)[names(CarterWilliams2020) == "Opp"] <- "Opponent"
colnames(CarterWilliams2020)[8] <-c("WinLoss") 
names(CarterWilliams2020)[names(CarterWilliams2020) == "GS"] <- "GameStarted"
names(CarterWilliams2020)[names(CarterWilliams2020) == "MP"] <- "MinsPlayed"

#Fill in the Location Data for the game
CarterWilliams2020$Location <- ifelse(CarterWilliams2020$Location == "@", "Away", "Home") 

#Split MinsPlayed Column into two columns 
Index <- str_split_fixed(CarterWilliams2020$MinsPlayed, ":", 2) #Create County Index Matrix
CarterWilliams2020 <- cbind(CarterWilliams2020, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
names(CarterWilliams2020)[names(CarterWilliams2020) == "1"] <- "Minutes" 
names(CarterWilliams2020)[names(CarterWilliams2020) == "2"] <- "Seconds" 

#Split WinsLoss Column into two columns 
Index <- str_split_fixed(CarterWilliams2020$WinLoss, " ", 2) #Create County Index Matrix
CarterWilliams2020 <- cbind(CarterWilliams2020, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
CarterWilliams2020<- CarterWilliams2020 %>% select(-WinLoss) #remove columns
names(CarterWilliams2020)[names(CarterWilliams2020) == "1"] <- "WinLoss" 
CarterWilliams2020<- CarterWilliams2020 %>% select(-"2")

#Update the Data Types 
#library(hablar)
colnames(CarterWilliams2020)
CarterWilliams2020 <- CarterWilliams2020 %>% convert(
  int("TeamGame", "PlayerGame", "FG", "FGA", "3P", "3PA", "FT", "FTA", "ORB", 
      "DRB", "TRB", "AST", "STL", "BLK", "TOV", "PF", "PTS", "+/-" ), 
  num("FG%", "3P%", "FT%", "FG%", "FT%", "3P%", "GmSc"),
  dte("Date"),
  fct("Team", "Location", "Opponent", "WinLoss", "GameStarted"))

##### Create Data Dictionary ##### 
#Create a vector that counts how many columns are in the data frame
ColNumber <- (seq_len(ncol(CarterWilliams2020)))
#Turn the vector into its own data frame with the first column called ColNumber 
DataDictionary <- as.data.frame(ColNumber)
#Add a column based on the vector of colnames 
DataDictionary$VariableName <- (colnames(CarterWilliams2020))
#Add the variable type into the data frame as a new column called "type"
DataDictionary$DataType <- (sapply(CarterWilliams2020, class))
View(DataDictionary)

#Michael Carter Williams 2018-2019 Season  
CarterWilliams2019 <- "https://www.basketball-reference.com/players/c/cartemi01/gamelog/2019"
  read_html(CarterWilliams2019)

#After importing the html site, transform to data table
url <- CarterWilliams2019
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
#Here, we indicate that this is the table we want to extract.
pageobj %>%  
  html_nodes("table") %>% 
  .[[8]] %>% 
  html_table(fill=T) -> CarterWilliams2019

#Removes Rows with subheadings
CarterWilliams2019 <- CarterWilliams2019[!(CarterWilliams2019$GS=="Did Not Play" | 
                                             CarterWilliams2019$GS=="Did Not Dress" | 
                                             CarterWilliams2019$GS=="GS" | 
                                             CarterWilliams2019$GS == "Inactive"),]

#Change Column Names
names(CarterWilliams2019)[names(CarterWilliams2019) == "Rk"] <- "TeamGame"
names(CarterWilliams2019)[names(CarterWilliams2019) == "G"] <- "PlayerGame"
names(CarterWilliams2019)[names(CarterWilliams2019) == "Tm"] <- "Team"
colnames(CarterWilliams2019)[6] <-c("Location")
names(CarterWilliams2019)[names(CarterWilliams2019) == "Opp"] <- "Opponent"
colnames(CarterWilliams2019)[8] <-c("WinLoss") 
names(CarterWilliams2019)[names(CarterWilliams2019) == "GS"] <- "GameStarted"
names(CarterWilliams2019)[names(CarterWilliams2019) == "MP"] <- "MinsPlayed"

#Fill in the Location Data for the game
CarterWilliams2019$Location <- ifelse(CarterWilliams2019$Location == "@", "Away", "Home") 

#Split MinsPlayed Column into two columns 
Index <- str_split_fixed(CarterWilliams2019$MinsPlayed, ":", 2) #Create County Index Matrix
CarterWilliams2019 <- cbind(CarterWilliams2019, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
names(CarterWilliams2019)[names(CarterWilliams2019) == "1"] <- "Minutes" 
names(CarterWilliams2019)[names(CarterWilliams2019) == "2"] <- "Seconds" 

#Split WinsLoss Column into two columns 
Index <- str_split_fixed(CarterWilliams2019$WinLoss, " ", 2) #Create County Index Matrix
CarterWilliams2019 <- cbind(CarterWilliams2019, Index) #Add CountyIndex Matrix to CountyIncome DataFrame
CarterWilliams2019<- CarterWilliams2019 %>% select(-WinLoss) #remove columns
names(CarterWilliams2019)[names(CarterWilliams2019) == "1"] <- "WinLoss" 
CarterWilliams2019<- CarterWilliams2019 %>% select(-"2")

#Update the Data Types 
#library(hablar)
colnames(CarterWilliams2019)
CarterWilliams2019 <- CarterWilliams2019 %>% convert(
  int("TeamGame", "PlayerGame", "FG", "FGA", "3P", "3PA", "FT", "FTA", "ORB", 
      "DRB", "TRB", "AST", "STL", "BLK", "TOV", "PF", "PTS", "+/-" ), 
  num("FG%", "3P%", "FT%", "FG%", "FT%", "3P%", "GmSc"),
  dte("Date"),
  fct("Team", "Location", "Opponent", "WinLoss", "GameStarted"))

##### Create Data Dictionary ##### 
#Create a vector that counts how many columns are in the data frame
ColNumber <- (seq_len(ncol(CarterWilliams2019)))
#Turn the vector into its own data frame with the first column called ColNumber 
DataDictionary <- as.data.frame(ColNumber)
#Add a column based on the vector of colnames 
DataDictionary$VariableName <- (colnames(CarterWilliams2019))
#Add the variable type into the data frame as a new column called "type"
DataDictionary$DataType <- (sapply(CarterWilliams2019, class))
View(DataDictionary)

CarterWilliams <- rbind(CarterWilliams2019, CarterWilliams2020, CarterWilliams2021) 
CarterWilliams$PlayerGame <- seq.int(nrow(CarterWilliams))
CarterWilliams$Player <- "CarterWilliams"

ggplot(CarterWilliams, aes(x = PlayerGame, y = GmSc, color = Team)) + 
  geom_jitter() +
  geom_smooth(se = FALSE) + 
  ggtitle("Michael Carter Williams 2018-2021") + 
  xlab("") + 
  ylab("Game Score") + 
  theme_classic() + 
  theme(axis.text.x = element_blank(), axis.ticks = element_blank(), axis.line = element_line(linetype = "blank"))
