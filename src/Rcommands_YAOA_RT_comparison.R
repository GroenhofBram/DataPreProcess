### ALS INSTALLATIE NODIG IS, DRAAI DEZE COMMANDS:
# install.packages("stringr")
# install.packages("tidyverse") # zit ook tidyr in

library(tidyverse)
library(stringr)

# setwd
# setwd("//ru.nl/wrkgrp/STD-Turntaking/Output experimenten/EarlyLate/excel_OSfiles")

#read in data frame (for response latency analysis only)
data1 <- read.table("files/YAOA.txt", header = TRUE)

# make variable test, and remove practice items
data1$Test<-"T"
# make subset data2 with test items only
data2 <-data1[data1$Test == "T", ]

data1[grepl("prac", data2$audio),]$Test <- "P"

# om de early/late conditie-info in een variabele te krijgen, kun je separate gebruiken, 
# zoals hieronder (separate op underscores zodat je 3 stukjes overhoudt)
data2$audio2 <- data2$audio
data2 <-data2 %>%
  separate(audio2, c("item", "CondType", "cue1", "cue2"))




### hiertussen het stuk met functions, behalve dat het eerste lange stuk (rondom picture type info) niet uitgevoerd is als function
# Ik voer hem hier uit als functie, omdat dat met het overzien van code qua regelaantal anders veel scrollen is. Je kan net zoals hiervoor het uit de functie halen als je dit niet wil.
implementeer_picturetype_info <<- function(data_in_df){
    data2$PicTypePos1 <- NA
    data2$PicTypePos2 <- NA
    data2$PicTypePos3 <- NA
    data2$PicTypePos4 <- NA
    
    
    data2[data2$pos1 == "horse.jpg" & data2$item == 1,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "horse.jpg" & data2$item == 1,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "horse.jpg" & data2$item == 1,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "horse.jpg" & data2$item == 1,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "dog.jpg" & data2$item == 1,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "dog.jpg" & data2$item == 1,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "dog.jpg" & data2$item == 1,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "dog.jpg" & data2$item == 1,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "candle.jpg" & data2$item == 2,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "candle.jpg" & data2$item == 2,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "candle.jpg" & data2$item == 2,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "candle.jpg" & data2$item == 2,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "match1.jpg" & data2$item == 2,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "match1.jpg" & data2$item == 2,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "match1.jpg" & data2$item == 2,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "match1.jpg" & data2$item == 2,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "apple.jpg" & data2$item == 3,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "apple.jpg" & data2$item == 3,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "apple.jpg" & data2$item == 3,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "apple.jpg" & data2$item == 3,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "egg.jpg" & data2$item == 3,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "egg.jpg" & data2$item == 3,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "egg.jpg" & data2$item == 3,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "egg.jpg" & data2$item == 3,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "train.jpg" & data2$item == 4,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "train.jpg" & data2$item == 4,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "train.jpg" & data2$item == 4,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "train.jpg" & data2$item == 4,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "car.jpg" & data2$item == 4,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "car.jpg" & data2$item == 4,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "car.jpg" & data2$item == 4,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "car.jpg" & data2$item == 4,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "RADIO1.jpg" & data2$item == 5,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "RADIO1.jpg" & data2$item == 5,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "RADIO1.jpg" & data2$item == 5,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "RADIO1.jpg" & data2$item == 5,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "speaker.jpg" & data2$item == 5,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "speaker.jpg" & data2$item == 5,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "speaker.jpg" & data2$item == 5,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "speaker.jpg" & data2$item == 5,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "lightbulb.jpg" & data2$item == 6,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "lightbulb.jpg" & data2$item == 6,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "lightbulb.jpg" & data2$item == 6,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "lightbulb.jpg" & data2$item == 6,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "torch.jpg" & data2$item == 6,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "torch.jpg" & data2$item == 6,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "torch.jpg" & data2$item == 6,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "torch.jpg" & data2$item == 6,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "elephant.jpg" & data2$item == 7,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "elephant.jpg" & data2$item == 7,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "elephant.jpg" & data2$item == 7,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "elephant.jpg" & data2$item == 7,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "monkey.jpg" & data2$item == 7,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "monkey.jpg" & data2$item == 7,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "monkey.jpg" & data2$item == 7,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "monkey.jpg" & data2$item == 7,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "moon.jpg" & data2$item == 8,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "moon.jpg" & data2$item == 8,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "moon.jpg" & data2$item == 8,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "moon.jpg" & data2$item == 8,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "rocket.jpg" & data2$item == 8,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "rocket.jpg" & data2$item == 8,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "rocket.jpg" & data2$item == 8,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "rocket.jpg" & data2$item == 8,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "tennisracket.jpg" & data2$item == 9,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "tennisracket.jpg" & data2$item == 9,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "tennisracket.jpg" & data2$item == 9,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "tennisracket.jpg" & data2$item == 9,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "bat1.jpg" & data2$item == 9,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "bat1.jpg" & data2$item == 9,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "bat1.jpg" & data2$item == 9,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "bat1.jpg" & data2$item == 9,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "hammer2.jpg" & data2$item == 10,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "hammer2.jpg" & data2$item == 10,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "hammer2.jpg" & data2$item == 10,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "hammer2.jpg" & data2$item == 10,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "wall.jpg" & data2$item == 10,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "wall.jpg" & data2$item == 10,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "wall.jpg" & data2$item == 10,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "wall.jpg" & data2$item == 10,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "zipper.jpg" & data2$item == 11,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "zipper.jpg" & data2$item == 11,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "zipper.jpg" & data2$item == 11,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "zipper.jpg" & data2$item == 11,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "door.jpg" & data2$item == 11,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "door.jpg" & data2$item == 11,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "door.jpg" & data2$item == 11,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "door.jpg" & data2$item == 11,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "seesaw.jpg" & data2$item == 12,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "seesaw.jpg" & data2$item == 12,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "seesaw.jpg" & data2$item == 12,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "seesaw.jpg" & data2$item == 12,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "swing.jpg" & data2$item == 12,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "swing.jpg" & data2$item == 12,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "swing.jpg" & data2$item == 12,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "swing.jpg" & data2$item == 12,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "dragon.jpg" & data2$item == 13,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "dragon.jpg" & data2$item == 13,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "dragon.jpg" & data2$item == 13,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "dragon.jpg" & data2$item == 13,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "queen.jpg" & data2$item == 13,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "queen.jpg" & data2$item == 13,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "queen.jpg" & data2$item == 13,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "queen.jpg" & data2$item == 13,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "crab.jpg" & data2$item == 14,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "crab.jpg" & data2$item == 14,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "crab.jpg" & data2$item == 14,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "crab.jpg" & data2$item == 14,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "shell.jpg" & data2$item == 14,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "shell.jpg" & data2$item == 14,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "shell.jpg" & data2$item == 14,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "shell.jpg" & data2$item == 14,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "watch.jpg" & data2$item == 15,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "watch.jpg" & data2$item == 15,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "watch.jpg" & data2$item == 15,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "watch.jpg" & data2$item == 15,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "clock.jpg" & data2$item == 15,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "clock.jpg" & data2$item == 15,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "clock.jpg" & data2$item == 15,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "clock.jpg" & data2$item == 15,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "cage.jpg" & data2$item == 16,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "cage.jpg" & data2$item == 16,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "cage.jpg" & data2$item == 16,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "cage.jpg" & data2$item == 16,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "mousetrap.jpg" & data2$item == 16,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "mousetrap.jpg" & data2$item == 16,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "mousetrap.jpg" & data2$item == 16,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "mousetrap.jpg" & data2$item == 16,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "mouse.jpg" & data2$item == 17,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "mouse.jpg" & data2$item == 17,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "mouse.jpg" & data2$item == 17,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "mouse.jpg" & data2$item == 17,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "beaver.jpg" & data2$item == 17,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "beaver.jpg" & data2$item == 17,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "beaver.jpg" & data2$item == 17,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "beaver.jpg" & data2$item == 17,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "motorcycle.jpg" & data2$item == 18,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "motorcycle.jpg" & data2$item == 18,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "motorcycle.jpg" & data2$item == 18,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "motorcycle.jpg" & data2$item == 18,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "stoplight.jpg" & data2$item == 18,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "stoplight.jpg" & data2$item == 18,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "stoplight.jpg" & data2$item == 18,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "stoplight.jpg" & data2$item == 18,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "dinosaur.jpg" & data2$item == 19,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "dinosaur.jpg" & data2$item == 19,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "dinosaur.jpg" & data2$item == 19,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "dinosaur.jpg" & data2$item == 19,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "alligator.jpg" & data2$item == 19,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "alligator.jpg" & data2$item == 19,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "alligator.jpg" & data2$item == 19,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "alligator.jpg" & data2$item == 19,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "tiger.jpg" & data2$item == 20,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "tiger.jpg" & data2$item == 20,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "tiger.jpg" & data2$item == 20,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "tiger.jpg" & data2$item == 20,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "zebra.jpg" & data2$item == 20,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "zebra.jpg" & data2$item == 20,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "zebra.jpg" & data2$item == 20,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "zebra.jpg" & data2$item == 20,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "kettle.jpg" & data2$item == 21,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "kettle.jpg" & data2$item == 21,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "kettle.jpg" & data2$item == 21,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "kettle.jpg" & data2$item == 21,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "mug.jpg" & data2$item == 21,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "mug.jpg" & data2$item == 21,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "mug.jpg" & data2$item == 21,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "mug.jpg" & data2$item == 21,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "rain.jpg" & data2$item == 22,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "rain.jpg" & data2$item == 22,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "rain.jpg" & data2$item == 22,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "rain.jpg" & data2$item == 22,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "mushroom.jpg" & data2$item == 22,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "mushroom.jpg" & data2$item == 22,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "mushroom.jpg" & data2$item == 22,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "mushroom.jpg" & data2$item == 22,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "diamond.jpg" & data2$item == 23,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "diamond.jpg" & data2$item == 23,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "diamond.jpg" & data2$item == 23,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "diamond.jpg" & data2$item == 23,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "dime.jpg" & data2$item == 23,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "dime.jpg" & data2$item == 23,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "dime.jpg" & data2$item == 23,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "dime.jpg" & data2$item == 23,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "fishingpole.jpg" & data2$item == 24,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "fishingpole.jpg" & data2$item == 24,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "fishingpole.jpg" & data2$item == 24,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "fishingpole.jpg" & data2$item == 24,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "net.jpg" & data2$item == 24,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "net.jpg" & data2$item == 24,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "net.jpg" & data2$item == 24,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "net.jpg" & data2$item == 24,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "camel.jpg" & data2$item == 25,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "camel.jpg" & data2$item == 25,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "camel.jpg" & data2$item == 25,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "camel.jpg" & data2$item == 25,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "pyramid.jpg" & data2$item == 25,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "pyramid.jpg" & data2$item == 25,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "pyramid.jpg" & data2$item == 25,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "pyramid.jpg" & data2$item == 25,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "balloon.jpg" & data2$item == 26,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "balloon.jpg" & data2$item == 26,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "balloon.jpg" & data2$item == 26,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "balloon.jpg" & data2$item == 26,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "cake.jpg" & data2$item == 26,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "cake.jpg" & data2$item == 26,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "cake.jpg" & data2$item == 26,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "cake.jpg" & data2$item == 26,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "devil.jpg" & data2$item == 27,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "devil.jpg" & data2$item == 27,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "devil.jpg" & data2$item == 27,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "devil.jpg" & data2$item == 27,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "cross.jpg" & data2$item == 27,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "cross.jpg" & data2$item == 27,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "cross.jpg" & data2$item == 27,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "cross.jpg" & data2$item == 27,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "gun.jpg" & data2$item == 28,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "gun.jpg" & data2$item == 28,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "gun.jpg" & data2$item == 28,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "gun.jpg" & data2$item == 28,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "cannon.jpg" & data2$item == 28,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "cannon.jpg" & data2$item == 28,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "cannon.jpg" & data2$item == 28,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "cannon.jpg" & data2$item == 28,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "glasses.jpg" & data2$item == 29,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "glasses.jpg" & data2$item == 29,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "glasses.jpg" & data2$item == 29,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "glasses.jpg" & data2$item == 29,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "window.jpg" & data2$item == 29,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "window.jpg" & data2$item == 29,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "window.jpg" & data2$item == 29,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "window.jpg" & data2$item == 29,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "knife.jpg" & data2$item == 30,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "knife.jpg" & data2$item == 30,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "knife.jpg" & data2$item == 30,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "knife.jpg" & data2$item == 30,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "sword.jpg" & data2$item == 30,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "sword.jpg" & data2$item == 30,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "sword.jpg" & data2$item == 30,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "sword.jpg" & data2$item == 30,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "book.jpg" & data2$item == 31,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "book.jpg" & data2$item == 31,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "book.jpg" & data2$item == 31,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "book.jpg" & data2$item == 31,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "owl.jpg" & data2$item == 31,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "owl.jpg" & data2$item == 31,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "owl.jpg" & data2$item == 31,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "owl.jpg" & data2$item == 31,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "moose.jpg" & data2$item == 32,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "moose.jpg" & data2$item == 32,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "moose.jpg" & data2$item == 32,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "moose.jpg" & data2$item == 32,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "deer.jpg" & data2$item == 32,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "deer.jpg" & data2$item == 32,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "deer.jpg" & data2$item == 32,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "deer.jpg" & data2$item == 32,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "kite.jpg" & data2$item == 33,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "kite.jpg" & data2$item == 33,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "kite.jpg" & data2$item == 33,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "kite.jpg" & data2$item == 33,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "fan.jpg" & data2$item == 33,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "fan.jpg" & data2$item == 33,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "fan.jpg" & data2$item == 33,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "fan.jpg" & data2$item == 33,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "shark.jpg" & data2$item == 34,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "shark.jpg" & data2$item == 34,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "shark.jpg" & data2$item == 34,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "shark.jpg" & data2$item == 34,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "submarine.jpg" & data2$item == 34,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "submarine.jpg" & data2$item == 34,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "submarine.jpg" & data2$item == 34,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "submarine.jpg" & data2$item == 34,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "onion.jpg" & data2$item == 35,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "onion.jpg" & data2$item == 35,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "onion.jpg" & data2$item == 35,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "onion.jpg" & data2$item == 35,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "tear.jpg" & data2$item == 35,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "tear.jpg" & data2$item == 35,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "tear.jpg" & data2$item == 35,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "tear.jpg" & data2$item == 35,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "dog.jpg" & data2$item == 36,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "dog.jpg" & data2$item == 36,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "dog.jpg" & data2$item == 36,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "dog.jpg" & data2$item == 36,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "cat.jpg" & data2$item == 36,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "cat.jpg" & data2$item == 36,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "cat.jpg" & data2$item == 36,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "cat.jpg" & data2$item == 36,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "ring.jpg" & data2$item == 37,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "ring.jpg" & data2$item == 37,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "ring.jpg" & data2$item == 37,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "ring.jpg" & data2$item == 37,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "bride.jpg" & data2$item == 37,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "bride.jpg" & data2$item == 37,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "bride.jpg" & data2$item == 37,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "bride.jpg" & data2$item == 37,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "pizza.jpg" & data2$item == 38,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "pizza.jpg" & data2$item == 38,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "pizza.jpg" & data2$item == 38,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "pizza.jpg" & data2$item == 38,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "spaghetti.jpg" & data2$item == 38,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "spaghetti.jpg" & data2$item == 38,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "spaghetti.jpg" & data2$item == 38,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "spaghetti.jpg" & data2$item == 38,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "tie.jpg" & data2$item == 39,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "tie.jpg" & data2$item == 39,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "tie.jpg" & data2$item == 39,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "tie.jpg" & data2$item == 39,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "desk.jpg" & data2$item == 39,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "desk.jpg" & data2$item == 39,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "desk.jpg" & data2$item == 39,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "desk.jpg" & data2$item == 39,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "stove.jpg" & data2$item == 40,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "stove.jpg" & data2$item == 40,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "stove.jpg" & data2$item == 40,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "stove.jpg" & data2$item == 40,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "pan.jpg" & data2$item == 40,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "pan.jpg" & data2$item == 40,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "pan.jpg" & data2$item == 40,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "pan.jpg" & data2$item == 40,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "saw.jpg" & data2$item == 41,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "saw.jpg" & data2$item == 41,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "saw.jpg" & data2$item == 41,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "saw.jpg" & data2$item == 41,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "hammer.jpg" & data2$item == 41,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "hammer.jpg" & data2$item == 41,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "hammer.jpg" & data2$item == 41,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "hammer.jpg" & data2$item == 41,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "penguin.jpg" & data2$item == 42,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "penguin.jpg" & data2$item == 42,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "penguin.jpg" & data2$item == 42,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "penguin.jpg" & data2$item == 42,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "eskimo.jpg" & data2$item == 42,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "eskimo.jpg" & data2$item == 42,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "eskimo.jpg" & data2$item == 42,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "eskimo.jpg" & data2$item == 42,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "snail.jpg" & data2$item == 43,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "snail.jpg" & data2$item == 43,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "snail.jpg" & data2$item == 43,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "snail.jpg" & data2$item == 43,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "turtle.jpg" & data2$item == 43,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "turtle.jpg" & data2$item == 43,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "turtle.jpg" & data2$item == 43,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "turtle.jpg" & data2$item == 43,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "chair.jpg" & data2$item == 44,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "chair.jpg" & data2$item == 44,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "chair.jpg" & data2$item == 44,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "chair.jpg" & data2$item == 44,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "bench.jpg" & data2$item == 44,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "bench.jpg" & data2$item == 44,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "bench.jpg" & data2$item == 44,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "bench.jpg" & data2$item == 44,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "accordion.jpg" & data2$item == 45,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "accordion.jpg" & data2$item == 45,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "accordion.jpg" & data2$item == 45,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "accordion.jpg" & data2$item == 45,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "piano.jpg" & data2$item == 45,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "piano.jpg" & data2$item == 45,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "piano.jpg" & data2$item == 45,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "piano.jpg" & data2$item == 45,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "telescope.jpg" & data2$item == 46,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "telescope.jpg" & data2$item == 46,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "telescope.jpg" & data2$item == 46,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "telescope.jpg" & data2$item == 46,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "microscope.jpg" & data2$item == 46,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "microscope.jpg" & data2$item == 46,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "microscope.jpg" & data2$item == 46,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "microscope.jpg" & data2$item == 46,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "letter.jpg" & data2$item == 47,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "letter.jpg" & data2$item == 47,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "letter.jpg" & data2$item == 47,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "letter.jpg" & data2$item == 47,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "mailbox.jpg" & data2$item == 47,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "mailbox.jpg" & data2$item == 47,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "mailbox.jpg" & data2$item == 47,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "mailbox.jpg" & data2$item == 47,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "parrot.jpg" & data2$item == 48,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "parrot.jpg" & data2$item == 48,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "parrot.jpg" & data2$item == 48,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "parrot.jpg" & data2$item == 48,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "microphone.jpg" & data2$item == 48,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "microphone.jpg" & data2$item == 48,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "microphone.jpg" & data2$item == 48,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "microphone.jpg" & data2$item == 48,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "trophy.jpg" & data2$item == 49,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "trophy.jpg" & data2$item == 49,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "trophy.jpg" & data2$item == 49,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "trophy.jpg" & data2$item == 49,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "medal.jpg" & data2$item == 49,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "medal.jpg" & data2$item == 49,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "medal.jpg" & data2$item == 49,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "medal.jpg" & data2$item == 49,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "scorpion.jpg" & data2$item == 50,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "scorpion.jpg" & data2$item == 50,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "scorpion.jpg" & data2$item == 50,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "scorpion.jpg" & data2$item == 50,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "snake.jpg" & data2$item == 50,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "snake.jpg" & data2$item == 50,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "snake.jpg" & data2$item == 50,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "snake.jpg" & data2$item == 50,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "washingmachine.jpg" & data2$item == 51,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "washingmachine.jpg" & data2$item == 51,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "washingmachine.jpg" & data2$item == 51,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "washingmachine.jpg" & data2$item == 51,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "vacuum.jpg" & data2$item == 51,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "vacuum.jpg" & data2$item == 51,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "vacuum.jpg" & data2$item == 51,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "vacuum.jpg" & data2$item == 51,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "typewriter.jpg" & data2$item == 52,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "typewriter.jpg" & data2$item == 52,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "typewriter.jpg" & data2$item == 52,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "typewriter.jpg" & data2$item == 52,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "pen.jpg" & data2$item == 52,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "pen.jpg" & data2$item == 52,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "pen.jpg" & data2$item == 52,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "pen.jpg" & data2$item == 52,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "carrot.jpg" & data2$item == 53,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "carrot.jpg" & data2$item == 53,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "carrot.jpg" & data2$item == 53,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "carrot.jpg" & data2$item == 53,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "shoe.jpg" & data2$item == 53,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "shoe.jpg" & data2$item == 53,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "shoe.jpg" & data2$item == 53,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "shoe.jpg" & data2$item == 53,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "nose.jpg" & data2$item == 54,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "nose.jpg" & data2$item == 54,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "nose.jpg" & data2$item == 54,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "nose.jpg" & data2$item == 54,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "ear.jpg" & data2$item == 54,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "ear.jpg" & data2$item == 54,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "ear.jpg" & data2$item == 54,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "ear.jpg" & data2$item == 54,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "stroller.jpg" & data2$item == 55,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "stroller.jpg" & data2$item == 55,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "stroller.jpg" & data2$item == 55,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "stroller.jpg" & data2$item == 55,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "wheelchair.jpg" & data2$item == 55,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "wheelchair.jpg" & data2$item == 55,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "wheelchair.jpg" & data2$item == 55,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "wheelchair.jpg" & data2$item == 55,]$PicTypePos4 <- "Dist"
    
    data2[data2$pos1 == "banana.jpg" & data2$item == 56,]$PicTypePos1 <- "Target"
    data2[data2$pos2 == "banana.jpg" & data2$item == 56,]$PicTypePos2 <- "Target"
    data2[data2$pos3 == "banana.jpg" & data2$item == 56,]$PicTypePos3 <- "Target"
    data2[data2$pos4 == "banana.jpg" & data2$item == 56,]$PicTypePos4 <- "Target"
    
    data2[data2$pos1 == "pineapple.jpg" & data2$item == 56,]$PicTypePos1 <- "Dist"
    data2[data2$pos2 == "pineapple.jpg" & data2$item == 56,]$PicTypePos2 <- "Dist"
    data2[data2$pos3 == "pineapple.jpg" & data2$item == 56,]$PicTypePos3 <- "Dist"
    data2[data2$pos4 == "pineapple.jpg" & data2$item == 56,]$PicTypePos4 <- "Dist"
       
    return(data2)
} 

data2 <- implementeer_picturetype_info(data2)
  

# voeg onsetinfo toe over cue words in de vraag (uit een enkel lang bestand over alle audio files)

# let op: probleem is hier dat TextGrid nog slaat op de versies waar 500 ms voor and 500 ms na afloop van de audio zaten 
# (deze stiltes zijn weggeknipt, waardoor alle onsettimes te laat zijn)
cuewordinfo <- read.table("files/Tabel_cue_onsettimes_durations.txt", header = TRUE)
head(cuewordinfo)

# data2 and cuewordinfo can be matched and merged on the audio variable
# which are almost similar, but not entirely
# so first delete .wav from the audio variable
# replace '.wav' (by nothing)
data2$audio <- str_replace(data2$audio, ".wav$", "")

data3 <- merge(x=data2,
               y=cuewordinfo,
               by.x = "audio",
               by.y= "file",
               all.x = TRUE)
nrow(data3)

# done!

head(data3)

# data3 only concerns information about what has been presented to each participant
# now add participants' response info (when the question ended, when they responded, and whether response is correct) from the PRAAT table files, 
# that have been generated on the basis of the annotated (TextGrid) participants' response files
# we do need a function for this operation (as it concerns 56*46=2576 table files)
# in order to match subject_nr (to info from PRAAT table files) in the function below, change subject_nr to character in dataframe data3
data3$subject_nr <- as.character(data3$subject_nr)

# and change work directory to different one (to directory one containing the table files)

# setwd("//ru.nl/wrkgrp/STD-Turntaking/Output experimenten/EarlyLate/recordings")
#and install tidyverse (required for mutate function?)

# Originele functie
voeg_respinfo_toe <<- function(data3){
  data4 <- data3 %>%
    mutate(
      Q_offsetT = as.numeric(0),        
      Resp_acc = as.character(0),	# ik weet niet of dit klopt, die 0 voor een character string (wat betekent die 0?)	
      Resp_onsetT = as.numeric(0),
      Resp_dur = as.numeric(0)
    )
  
  files <- list.files(pattern = "\\.wav\\.Table$") # het bestand files wordt gemaakt; ik zie dat het een lange lijst table files bevat
  
  for (file_name in files) {
    table_data <- read.table(file_name, header = TRUE, sep = "\t")
    subject_nr <- str_sub(file_name, 6, 9)
    Cond_type <- str_extract(file_name, "[A-Z]")
    # use split string, splitting on underscores, to get string's 2nd element (because item number sometimes has 1 digit, sometimes 2)
    m=strsplit(file_name, '_')
    item<-m[[1]][2]     
    Q_offsetT <- table_data[2, 4]	
    Resp_acc <- table_data[4, 2]
    Resp_onsetT <- round(table_data[4, 3], 3)
    Resp_dur <- table_data[4, 4]
    
    data4[data4$item == item & data4$CondType == Cond_type & data4$subject_nr == subject_nr,]$Q_offsetT <- Q_offsetT 
    data4[data4$item == item & data4$CondType == Cond_type & data4$subject_nr == subject_nr,]$Resp_acc <- Resp_acc
    data4[data4$item == item & data4$CondType == Cond_type & data4$subject_nr == subject_nr,]$Resp_onsetT <- Resp_onsetT 
    data4[data4$item == item & data4$CondType == Cond_type & data4$subject_nr == subject_nr,]$Resp_dur <- Resp_dur
  }
  
  return(data4)
}

# Nieuwe functie
voeg_respinfo_toe_nieuwe_namen <<- function(data3){
    data4 <- data3 %>%
      mutate(
        Q_offsetT = as.numeric(0),
        Resp_acc = "EMPTY",		
        Resp_onsetT = as.numeric(0),
        Resp_dur = as.numeric(0)
        )
    
    files <- list.files(path = "files", pattern = "^mijntabel_subj-.*\\.wav\\.Table$", full.names = TRUE)
    # files <- list.files(pattern = "^mijntabel_subj-.*\\.wav\\.Table$") 
    
    for (file_name in files) {
      m <- strsplit(file_name, '_')
      
      table_data <- read.table(file_name, header = TRUE, sep = "\t")
      table_data$dur <- as.numeric(table_data$dur)
      table_data$totdur <- as.numeric(table_data$totdur)
      
      subject_nr_string <- m[[1]][2]
      subject_nr <- as.numeric(str_extract(subject_nr_string, "\\d+$"))
      Cond_type <- str_extract(file_name, "(?<=_)[A-Z](?=_)") 
      item <- as.numeric(m[[1]][3])
      
	    Q_offsetT <- table_data[2, 4]	
      Resp_acc <- table_data[4, 2]
      Resp_onsetT <- round(table_data[4, 3], 3)
     	Resp_dur <- table_data[4, 4]
	    
	    
	    data4[data4$item == item & data4$CondType == Cond_type & data4$subject_nr == subject_nr,]$Q_offsetT <- Q_offsetT 
      data4[data4$item == item & data4$CondType == Cond_type & data4$subject_nr == subject_nr,]$Resp_acc <- Resp_acc
      data4[data4$item == item & data4$CondType == Cond_type & data4$subject_nr == subject_nr,]$Resp_onsetT <- Resp_onsetT 
      data4[data4$item == item & data4$CondType == Cond_type & data4$subject_nr == subject_nr,]$Resp_dur <- Resp_dur
    }
    
    return(data4)
  }


data4 <- voeg_respinfo_toe_nieuwe_namen(data3) # Haalt alle responsinfo op en voegt die per regel toe aan data3 bestand








