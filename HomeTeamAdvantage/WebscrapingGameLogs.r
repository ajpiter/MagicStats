#Indivdually Call Function for All 30 NBA Teams
#Create 30 dataframes, 1 per team 
scrape_gl(website = "https://www.basketball-reference.com/teams/BRK/2020/gamelog/",
          source = "gl_BRK_2020")
gl_BRK_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/PHI/2020/gamelog/",
          source = "gl_PHI_2020")
gl_PHI_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/BOS/2020/gamelog/",
          source = "gl_BOS_2020")
gl_BOS_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/NYK/2020/gamelog/",
          source = "gl_NYK_2020")
gl_NYK_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/TOR/2020/gamelog/",
          source = "gl_TOR_2020")
gl_TOR_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/UTA/2020/gamelog/",
          source = "gl_UTA_2020")
gl_UTA_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/DEN/2020/gamelog/",
          source = "gl_DEN_2020")
gl_DEN_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/POR/2020/gamelog/",
          source = "gl_POR_2020")
gl_POR_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/OKC/2020/gamelog/",
          source = "gl_OKC_2020")
gl_OKC_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/MIN/2020/gamelog/",
          source = "gl_MIN_2020")
gl_MIN_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/MIL/2020/gamelog/",
          source = "gl_MIL_2020")
gl_MIL_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/IND/2020/gamelog/",
          source = "gl_IND_2020")
gl_IND_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/CHI/2020/gamelog/",
          source = "gl_CHI_2020")
gl_CHI_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/CLE/2020/gamelog/",
          source = "gl_CLE_2020")
gl_CLE_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/DET/2020/gamelog/",
          source = "gl_DET_2020")
gl_DET_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/PHO/2020/gamelog/",
          source = "gl_PHO_2020")
gl_PHO_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/LAC/2020/gamelog/",
          source = "gl_LAC_2020")
gl_LAC_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/LAL/2020/gamelog/",
          source = "gl_LAL_2020")
gl_LAL_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/GSW/2020/gamelog/",
          source = "gl_GSW_2020")
gl_GSW_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/SAC/2020/gamelog/",
          source = "gl_SAC_2020")
gl_SAC_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/MIA/2020/gamelog/",
          source = "gl_MIA_2020")
gl_MIA_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/ATL/2020/gamelog/",
          source = "gl_ATL_2020")
gl_ATL_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/CHO/2020/gamelog/",
          source = "gl_CHO_2020")
gl_CHO_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/WAS/2020/gamelog/",
          source = "gl_WAS_2020")
gl_WAS_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/ORL/2020/gamelog/",
          source = "gl_ORL_2020")
gl_ORL_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/DAL/2020/gamelog/",
          source = "gl_DAL_2020")
gl_DAL_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/SAS/2020/gamelog/",
          source = "gl_SAS_2020")
gl_SAS_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/MEM/2020/gamelog/",
          source = "gl_MEM_2020")
gl_MEM_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/NOP/2020/gamelog/",
          source = "gl_NOP_2020")
gl_NOP_2020 <- df_name

scrape_gl(website = "https://www.basketball-reference.com/teams/HOU/2020/gamelog/", 
          source = "gl_HOU_2020")
gl_HOU_2020 <- df_name

%%R

#Combine 2020 game log files to create master 2020 game log dataframe 
gl_2020 <- rbind(
    gl_BRK_2020,
    gl_PHI_2020,
    gl_BOS_2020,
    gl_NYK_2020,
    gl_TOR_2020,
    gl_UTA_2020,
    gl_DEN_2020,
    gl_POR_2020,
    gl_OKC_2020,
    gl_MIN_2020,
    gl_MIL_2020,
    gl_IND_2020,
    gl_CHI_2020,
    gl_CLE_2020,
    gl_DET_2020,
    gl_PHO_2020,
    gl_LAC_2020,
    gl_LAL_2020,
    gl_GSW_2020,
    gl_SAC_2020,
    gl_MIA_2020,
    gl_ATL_2020,
    gl_CHO_2020,
    gl_WAS_2020,
    gl_ORL_2020,
    gl_DAL_2020,
    gl_SAS_2020,
    gl_MEM_2020,
    gl_NOP_2020,
    gl_HOU_2020)

#Check your work 
head(gl_2020)

%%R

#Data Dictionary of 2020 Game Log 
gl_2020_dd <- data_dictionary(gl_2020)
head(gl_2020_dd)

%%R 

# Clean up column headings 

coltitle <- as.character(gl_2020[1,]) # Second row becomes column names
colnames(gl_2020) <- coltitle # add the column names to x
gl_2020 <- gl_2020[-1,] # remove the first row and the 1st column of the data
head(gl_2020)

%%R

#Removes Rows with subheadings
gl_2020 <- gl_2020[!(gl_2020$Rk=="Rk"),]
gl_2020 <- gl_2020[!(gl_2020$FG=="Team"),]

#Data Dictionary should show fewer records
gl_2020_dd <- data_dictionary(gl_2020)
print(gl_2020_dd)

#Notice that not all variables have names 
#Some variable names are duplicated

#Update Column Names 

#By Column Title 
names(gl_2020)[names(gl_2020) == "Rk"] <- "game_rank"
names(gl_2020)[names(gl_2020) == "G"] <- "season_game"
colnames(gl_2020)[4] <-c("location") 
colnames(gl_2020)[5] <-c("opponent") 
names(gl_2020)[names(gl_2020) == "W/L"] <- "win_loss"
names(gl_2020)[names(gl_2020) == "Tm"] <- "score_home_team"

#Multiple columns had the same name, requiring us to use column index
colnames(gl_2020)[8] <-c("score_away_team") 
colnames(gl_2020)[9] <-c("home_FG") 
colnames(gl_2020)[10] <-c("home_FGA") 
colnames(gl_2020)[11] <-c("home_FG%") 
colnames(gl_2020)[12] <-c("home_3P") 
colnames(gl_2020)[13] <-c("home_3PA") 
colnames(gl_2020)[14] <-c("home_3P%") 
colnames(gl_2020)[15] <-c("home_FT") 
colnames(gl_2020)[16] <-c("home_FTA") 
colnames(gl_2020)[17] <-c("home_FT%") 
colnames(gl_2020)[18] <-c("home_off_rebounds") 
colnames(gl_2020)[19] <-c("home_total_rebounds") 
colnames(gl_2020)[20] <-c("home_assists") 
colnames(gl_2020)[21] <-c("home_steals") 
colnames(gl_2020)[22] <-c("home_blocks") 
colnames(gl_2020)[23] <-c("home_turnovers") 
colnames(gl_2020)[24] <-c("home_personal_fouls") 
#column 25 will be removed
colnames(gl_2020)[26] <-c("opp_FG") 
colnames(gl_2020)[27] <-c("opp_FGA") 
colnames(gl_2020)[28] <-c("opp_FG%") 
colnames(gl_2020)[29] <-c("opp_3P") 
colnames(gl_2020)[30] <-c("opp_3PA") 
colnames(gl_2020)[31] <-c("opp_3P%") 
colnames(gl_2020)[32] <-c("opp_FT") 
colnames(gl_2020)[33] <-c("opp_FTA") 
colnames(gl_2020)[34] <-c("opp_FT%") 
colnames(gl_2020)[35] <-c("opp_off_rebounds") 
colnames(gl_2020)[36] <-c("opp_total_rebounds") 
colnames(gl_2020)[37] <-c("opp_assists") 
colnames(gl_2020)[38] <-c("opp_steals") 
colnames(gl_2020)[39] <-c("opp_blocks") 
colnames(gl_2020)[40] <-c("opp_turnovers") 
colnames(gl_2020)[41] <-c("opp_personal_fouls") 

#Remove Null Column 
gl_2020 <- gl_2020[,-25] # remove NA column

#Fill in the Location Data for the game
gl_2020$location <- ifelse(gl_2020$location == "@", "Away", "Home") 

#Check Work 
head(gl_2020)

#Update Data Type
#colnames(gl_2020) #lists column names for easy copying and pasting into code
