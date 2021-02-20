library(ggplot2) #version 3.3.3 Graphics 
library(hablar)
library(janitor) #version 2.1.0 Data Cleaning 
library(rvest) #version 0.3.6 Webscraping 
library(tidyverse) #version 1.3.0 Allows for Pipping 

#NBA All-Star Career Stats by Player  
AllStarPlayers <- "https://www.basketball-reference.com/allstar/NBA-allstar-career-stats.html"

#After importing the html site, transform to data table
url <- AllStarPlayers
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
#Here, we indicate that this is the table we want to extract.
pageobj %>%  
  html_nodes("table") %>% 
  .[[1]] %>% 
  html_table(fill=T) -> AllStarPlayers

#Convert Row One to Variable Column Names 
AllStarPlayers <- row_to_names(AllStarPlayers, 1, remove_row = TRUE, remove_rows_above = FALSE)

#Converts Column names to follow tidyverse style guide 
AllStarPlayers <- clean_names(AllStarPlayers)
names(AllStarPlayers)

#More Descriptive Names, for the 4 Variables with Duplicate Names 
names(AllStarPlayers)[names(AllStarPlayers) == "mp"] <- "mins_total"
names(AllStarPlayers)[names(AllStarPlayers) == "pts"] <- "pts_total"
names(AllStarPlayers)[names(AllStarPlayers) == "trb"] <- "trb_total"
names(AllStarPlayers)[names(AllStarPlayers) == "ast"] <- "ast_total"
names(AllStarPlayers)[names(AllStarPlayers) == "mp_2"] <- "mins_per_game"
names(AllStarPlayers)[names(AllStarPlayers) == "pts_2"] <- "pts_per_game"
names(AllStarPlayers)[names(AllStarPlayers) == "trb_2"] <- "trb_per_game"
names(AllStarPlayers)[names(AllStarPlayers) == "ast_2"] <- "ast_per_game"
names(AllStarPlayers)

#Shows all rows with duplicate values 
get_dupes(AllStarPlayers)

#Removes Rows with subheadings
AllStarPlayers <- AllStarPlayers[!(AllStarPlayers$player ==" Player"),]
AllStarPlayers <- AllStarPlayers[!(AllStarPlayers$player ==""),]

#Use hablar package to convert data types 
names(AllStarPlayers)
AllStarPlayers <- AllStarPlayers %>% convert(
  int("g", "gs", "mins_total", "fg", "fga", 
      "x3p", "x3pa", "x2p", "x2pa", 
      "ft", "fta", "orb", "drb", 
      "trb_total", "ast_total", "stl", 
      "blk", "tov", "pf", "mins_per_game", "pts_per_game", "trb_per_game", "ast_per_game"), 
  num("fg_percent", "x3p_percent", "x2p_percent", "ft_percent"))

#Create new Variables 
AllStarPlayers$fg_per_game <- AllStarPlayers$fg / AllStarPlayers$g
AllStarPlayers$fga_per_game <- AllStarPlayers$fga / AllStarPlayers$g
AllStarPlayers$x3p_per_game <- AllStarPlayers$x3p / AllStarPlayers$g
AllStarPlayers$x3pa_per_game <- AllStarPlayers$x3pa / AllStarPlayers$g
AllStarPlayers$x2p_per_game <- AllStarPlayers$x2p / AllStarPlayers$g
AllStarPlayers$x2pa_per_game <- AllStarPlayers$x2pa / AllStarPlayers$g
AllStarPlayers$ft_per_game <- AllStarPlayers$ft / AllStarPlayers$g
AllStarPlayers$fta_per_game <- AllStarPlayers$fta / AllStarPlayers$g
AllStarPlayers$orb_per_game <- AllStarPlayers$orb / AllStarPlayers$g
AllStarPlayers$drb_per_game <- AllStarPlayers$drb / AllStarPlayers$g
AllStarPlayers$stl_per_game <- AllStarPlayers$stl / AllStarPlayers$g
AllStarPlayers$blk_per_game <- AllStarPlayers$blk / AllStarPlayers$g
AllStarPlayers$tov_per_game <- AllStarPlayers$tov / AllStarPlayers$g
AllStarPlayers$pf_per_game <- AllStarPlayers$pf / AllStarPlayers$g

names(AllStarPlayers)[names(AllStarPlayers) == "fg"] <- "fg_total"
names(AllStarPlayers)[names(AllStarPlayers) == "fga"] <- "fga_total"
names(AllStarPlayers)[names(AllStarPlayers) == "x3p"] <- "x3p_total"
names(AllStarPlayers)[names(AllStarPlayers) == "x3pa"] <- "x3pa_total"
names(AllStarPlayers)[names(AllStarPlayers) == "x2p"] <- "x2p_total"
names(AllStarPlayers)[names(AllStarPlayers) == "x2pa"] <- "x2pa_total"
names(AllStarPlayers)[names(AllStarPlayers) == "ft"] <- "ft_total"
names(AllStarPlayers)[names(AllStarPlayers) == "fta"] <- "fta_total"
names(AllStarPlayers)[names(AllStarPlayers) == "orb"] <- "orb_total"
names(AllStarPlayers)[names(AllStarPlayers) == "drb"] <- "drb_total"
names(AllStarPlayers)[names(AllStarPlayers) == "stl"] <- "stl_total"
names(AllStarPlayers)[names(AllStarPlayers) == "blk"] <- "blk_total"
names(AllStarPlayers)[names(AllStarPlayers) == "tov"] <- "tov_total"
names(AllStarPlayers)[names(AllStarPlayers) == "pf"] <- "pf_total"

#Create Data Dictionary 
#Create a vector that counts how many columns are in the data frame
ColNumber <- (seq_len(ncol(AllStarPlayers)))
#Turn the vector into its own data frame with the first column called ColNumber 
DataDictionary <- as.data.frame(ColNumber)
#Add a column based on the vector of colnames 
DataDictionary$VariableName <- (colnames(AllStarPlayers))
#Add the variable type into the data frame as a new column called "type"
DataDictionary$DataType <- (sapply(AllStarPlayers, class))
print(DataDictionary)

#Follow the Same Steps for Shaquille O'Neal 

#NBA All-Star Career Stats by Player  
ONeal <- "https://www.basketball-reference.com/players/o/onealsh01.html"

#After importing the html site, transform to data table
url <- ONeal
pageobj <- read_html(url, as.data.frame=T, stringsAsFactors = TRUE)
#Here, we indicate that this is the table we want to extract.
pageobj %>%  
  html_nodes("table") %>% 
  .[[1]] %>% 
  html_table(fill=T) -> ONeal

#Converts Column names to follow tidyverse style guide 
ONeal <- clean_names(ONeal)
names(ONeal)

#Convert Columns to Naming Convention from AllStartGames
names(ONeal)[names(ONeal) == "mp"] <- "mins_per_game"
names(ONeal)[names(ONeal) == "fg"] <- "fg_per_game"
names(ONeal)[names(ONeal) == "fga"] <- "fga_per_game"
names(ONeal)[names(ONeal) == "x3p"] <- "x3p_per_game"
names(ONeal)[names(ONeal) == "x3pa"] <- "x3pa_per_game"
names(ONeal)[names(ONeal) == "x2p"] <- "x2p_per_game"
names(ONeal)[names(ONeal) == "x2pa"] <- "x2pa_per_game"
names(ONeal)[names(ONeal) == "ft"] <- "ft_per_game"
names(ONeal)[names(ONeal) == "fta"] <- "fta_per_game"
names(ONeal)[names(ONeal) == "orb"] <- "orb_per_game"
names(ONeal)[names(ONeal) == "drb"] <- "drb_per_game"
names(ONeal)[names(ONeal) == "stl"] <- "stl_per_game"
names(ONeal)[names(ONeal) == "blk"] <- "blk_per_game"
names(ONeal)[names(ONeal) == "tov"] <- "tov_per_game"
names(ONeal)[names(ONeal) == "pf"] <- "pf_per_game"
names(ONeal)[names(ONeal) == "pts"] <- "pts_per_game"
names(ONeal)[names(ONeal) == "trb"] <- "trb_per_game"
names(ONeal)[names(ONeal) == "ast"] <- "ast_per_game"
names(ONeal)

#Removed Rows 22 to 29 
ONeal <- ONeal[-c(22:29), ]

#update data types using hablar package 
ONeal <- ONeal %>% convert(
  int("g", "gs", "fg_per_game", "fga_per_game", 
      "x3p_per_game", "x3pa_per_game", "x2p_per_game", "x2pa_per_game", 
      "ft_per_game", "fta_per_game", "orb_per_game", "drb_per_game", 
      "stl_per_game", 
      "blk_per_game", "tov_per_game", "pf_per_game", "mins_per_game", 
      "pts_per_game", "trb_per_game", "ast_per_game"), 
  num("fg_percent", "x3p_percent", "x2p_percent", "ft_percent"), 
  fct(season, age, tm, lg, pos))

#Compare AllStarPlayer to ONeal 
compare_df_cols_same(AllStarPlayers, ONeal, bind_method = "rbind")

#Add Season Column to AllStarPlayers 
AllStarPlayers$season <- "AllStar"
ONeal$player <- "Shaquille O'Neal"

#Remove Variables from AllStarPlayer not in ONeal Data set 
AllStarPlayers <- AllStarPlayers %>% 
  select(-ast_total, 
         -blk_total, -drb_total, -fg_total, -fga_total, 
         -ft_total, -fta_total, -orb_total, -pf_total,
         -stl_total, -tov_total, -x2p_total, -x2pa_total, 
         -x3pa_total, -x3p_total, -mins_total, -pts_total, -trb_total, -na)

#Remove Variables from ONeal not in AllStarPlayer Data set 
ONeal <- ONeal %>% 
  select(-age, -lg, -pos, -tm, -e_fg_percent)

AllStarPlayers <- AllStarPlayers %>% convert(
  int(blk_per_game, drb_per_game, fg_per_game, fga_per_game, 
      ft_per_game, fta_per_game, orb_per_game, pf_per_game, 
      stl_per_game, tov_per_game, x2p_per_game, x2pa_per_game, 
      x3p_per_game, x3pa_per_game), 
  fct(season))

#Compare AllStarPlayer to ONeal 
compare_df_cols_same(AllStarPlayers, ONeal, bind_method = "rbind")

#Combine AllStarPlayer and ONeal Datasets 
AllStarONeal <- rbind(AllStarPlayers, ONeal)

#Subset to ONeal Games 
AllStarONeal <- filter(AllStarONeal, player == "Shaquille O'Neal")


plot <- ggplot(AllStarONeal, aes(x = season, y = pts_per_game, color= season)) + 
  geom_point(size=4) + 
  theme_classic() + 
  labs(x = "", 
       y = "", 
       title = "Shaquille O'Neal, Points Per Game") +
  theme(axis.text.x = element_text(angle = 45, size = 9, hjust = 1))
plot <- plot + scale_color_manual(values=c("blue", "#999999", "#999999", "#999999", "#999999", 
                                           "#999999", "#999999", "#999999", "#999999", "#999999", 
                                           "#999999", "#999999", "#999999", "#999999", "#999999", 
                                           "#999999", "#999999", "#999999", "#999999", "#999999")) 
plot <- plot + guides(color = "none")
plot

plot <- ggplot(AllStarONeal, aes(x = season, y = mins_per_game, color= season)) + 
  geom_point(size=4) + 
  theme_classic() + 
  labs(x = "", 
       y = "", 
       title = "Shaquille O'Neal, Minutes Per Game") +
  theme(axis.text.x = element_text(angle = 45, size = 9, hjust = 1))
plot <- plot + scale_color_manual(values=c("blue", "#999999", "#999999", "#999999", "#999999", 
                                           "#999999", "#999999", "#999999", "#999999", "#999999", 
                                           "#999999", "#999999", "#999999", "#999999", "#999999", 
                                           "#999999", "#999999", "#999999", "#999999", "#999999")) 
plot <- plot + guides(color = "none")
plot

plot <- ggplot(AllStarONeal, aes(x = season, y = trb_per_game, color= season)) + 
  geom_point(size=4) + 
  theme_classic() + 
  labs(x = "", 
       y = "", 
       title = "Shaquille O'Neal, Rebounds Per Game") +
  theme(axis.text.x = element_text(angle = 45, size = 9, hjust = 1))
plot <- plot + scale_color_manual(values=c("blue", "#999999", "#999999", "#999999", "#999999", 
                                           "#999999", "#999999", "#999999", "#999999", "#999999", 
                                           "#999999", "#999999", "#999999", "#999999", "#999999", 
                                           "#999999", "#999999", "#999999", "#999999", "#999999")) 
plot <- plot + guides(color = "none")
plot
