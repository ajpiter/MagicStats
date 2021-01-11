library(rvest) #version 0.3.6 
library(dplyr)
library(hablar) #Used to convert data types
library(ggplot2) #graphing 
library(stringr) #spliting columns 

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
