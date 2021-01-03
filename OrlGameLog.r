#The code below creates an Excel file with the Orlando Magic Game Logs from 2009 to 2021
#The source of the data is publically available from Basketbal Reference.com 

version #R version 4.0.2 (2020-06-22)
library(rvest) #version 0.3.6 
#session_info(pkgs = NULL, include_base = FALSE)

##### Import Table 1, Game Log for Orlando Magic 2020-2021 #####
BrOrl21GameLog <- "https://www.basketball-reference.com/teams/ORL/2021/gamelog/"
read_html(BrOrl21GameLog)

#After importing the html site, transform to data table
url <- BrOrl21GameLog
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
pageobj %>%  
  html_nodes("table") %>% 
  .[[1]] %>% #Here, we indicate that this is the table we want to extract.
  html_table(fill=T) -> OrlGameLog21

#Update Column labels 
coltitle <- as.character(OrlGameLog21[1,]) # read the column names from row 1
colnames(OrlGameLog21) <- coltitle # add the column names to x
OrlGameLog21 <- OrlGameLog21[-1,] # remove the first row and the 1st column of the data

##### Import Table 2, Game Log for Orlando Magic 2019-2020 #####
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

##### Import Table 3, Game Log for Orlando Magic 2018-2019 #####
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

##### Import Table 4, Game Log for Orlando Magic 2017-2018 #####
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

##### Import Table 5, Game Log for Orlando Magic 2016-2017 #####
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

##### Import Table 6, Game Log for Orlando Magic 2015-2016 #####
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

##### Import Table 7, Game Log for Orlando Magic 2014-2015 #####
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

##### Import Table 8, Game Log for Orlando Magic 2013-2014 #####
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

##### Import Table 9, Game Log for Orlando Magic 2012-2013 #####
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

##### Import Table 10, Game Log for Orlando Magic 2011-2012 #####
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

##### Import Table 11, Game Log for Orlando Magic 2010-2011 #####
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

##### Import Table 12, Game Log for Orlando Magic 2009-2010 #####
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
OrlGameLog10 <- OrlGameLog10[-1,] # remove the first row and the 1st column of the data
OrlGameLog10 <- OrlGameLog10[-21:-22,] #remove non-game stats 
OrlGameLog10 <- OrlGameLog10[-41:-42,] #remove non-game stats 
OrlGameLog10 <- OrlGameLog10[-61:-62,] #remove non-game stats 

OrlGameLog <- rbind(OrlGameLog10, OrlGameLog11, OrlGameLog12, OrlGameLog13, OrlGameLog14, 
                    OrlGameLog15, OrlGameLog16, OrlGameLog17, OrlGameLog18, OrlGameLog19, 
                    OrlGameLog20, OrlGameLog21)

##### Export Data Table as Excel Saved on Local Drive ##### 
setwd("/Users/UserName/Documents/Folder/Subfolder")
openxlsx::write.xlsx(OrlGameLog, file = "OrlGameLog.xlsx")
