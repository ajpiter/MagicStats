## Comparing Point Guards

##### WIth Fultz injured many news articles have suggested that the Magic need a new point guard and their current point guard lineup is unlikely to be successful. 

#### Load Packages 

library(rvest) #version 0.3.6 

library(dplyr)

library(hablar) #Used to convert data types

library(ggplot2) #graphing 

library(stringr) #spliting columns 

##### Load Data 

##### Please see the corresponding Github file for how to pull data for indivdual players. All data below was pulled from BasketballReference.com 

### **Exploratory Visualization:** Current Point Guards  

Magic <- rbind(Anthony, Bone, CarterWilliams, Fultz) 

ggplot(Magic, aes(x = PlayerGame, y = GmSc, color = Player)) + 
  geom_jitter() +
  geom_smooth(se= FALSE) +
  ggtitle("Game Score by Point Guard") + 
  xlab("Games Played") + 
  ylab("Game Score") + 
  theme_classic() + 
  theme(axis.text.x = element_blank(), 
        axis.ticks = element_blank(), 
        axis.line = element_line(linetype = "blank")) +
  facet_grid(. ~ Player)

![image](https://user-images.githubusercontent.com/28680575/104154375-c50a4200-53b2-11eb-8a62-b5467f021eb6.png)
##### This graph image was made with data pulled on January 9th 2021 and does not include and games played after that date. To graph the most up to date graphically information please pull the updated data from Basketball Reference and recreate the graphic. 

### Possible Point Guard Replacements 

##### Taking the same analytical approach to the Point Guards suggested by the news article "Six potential free-agent replacements for Markelle Fultz" by Hoops Hype on January 7th. 


