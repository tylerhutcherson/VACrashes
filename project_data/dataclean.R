# Final Data Viz Project
# DMV Capstone Data
# Tyler Hutcherson

# Data Cleaning

library(dplyr)
library(purrr)
library(readr)

setwd("~/Desktop/Data_Science/Capstone_2016/DMV_Capstone")
df <- read.csv("final_data.csv")
df$Fatality <- as.factor(df$Fatality)
data <- df[df$VehicleSpeedLimit < 80 & df$VehicleSpeedLimit > 0,]  

data <- data[complete.cases(data),c(2,6:9,11:24,29:37)]

data <- data %>% 
  mutate(CrashDate = as.Date(CrashDate),
         CrashMonth = months(CrashDate),
         CrashTime = as.character(CrashTime) %>% map(function(time){
           if (grepl("1899", as.character(time))){
             return(substring(time,12))
           }
           else{
             time
           }
         }) %>% unlist(),
         CrashYear = as.factor(substring(CrashDate, first=1, last=4)))

data <- data[data$GPSLatitude>36.5 & data$GPSLatitude<39.5,]
data <- data[data$GPSLongitude>(-84) & data$GPSLongitude<(-75),]

# recode Alcohol and Speed with only 2 levels
data$Speed[as.character(data$Speed) == "Yes"] <- "YES"
data$Speed[as.character(data$Speed) == "No"] <- "NO"
data$Alcohol[as.character(data$Alcohol) == "Yes"] <- "YES"
data$Alcohol[as.character(data$Alcohol) == "No"] <- "NO"
data$Fatality[as.character(data$Fatality) == "yes"] <- 1
data$Fatality[as.character(data$Fatality) == "no"] <- 0

df <- within(data, {
  TypeOfCollisionId <- as.character(TypeOfCollisionId)
  RoadwaySurfaceTypeID <- as.character(RoadwaySurfaceTypeID)
  RoadwayDefectID <- as.character(RoadwayDefectID)
  RoadwayDescriptionID <- as.character(RoadwayDescriptionID)
  RoadwayAlignmentID <- as.character(RoadwayAlignmentID)
  LightConditionID <- as.character(LightConditionID)
  WeatherConditionID <- as.character(WeatherConditionID)
  IntersectionTypeID <- as.character(IntersectionTypeID)
}) 
### VARIABLES TO COLLAPSE LEVELS
##
# RoadwayAlignmentID: shrink to 5 levels instead of 10
# level = straight-level + curve-level
# grade = grade-curve + grade-straight
# hillcrest = hillcrest-straight + hillcrest-curve
# dip = dip-straight + dip-curve
# other = on/off ramp + other
#table(df$RoadwayAlignmentID)
df$RoadwayAlignmentID[df$RoadwayAlignmentID %in% c("straight-level","curve-level")] <- "Level"
df$RoadwayAlignmentID[df$RoadwayAlignmentID %in% c("grade-curve","grade-straight")] <- "Grade"
df$RoadwayAlignmentID[df$RoadwayAlignmentID %in% c("hillcrest-straight","hillcrest-curve")] <- "Hillcrest"
df$RoadwayAlignmentID[df$RoadwayAlignmentID %in% c("dip-straight","dip-curve")] <- "Dip"
df$RoadwayAlignmentID[df$RoadwayAlignmentID =="on/off ramp"] <- "Other"

##
#RoadwayDescriptionID: shrink down to 4
# other = One-Way,NotDivided + Unknown
#table(df$RoadwayDescriptionID)
df$RoadwayDescriptionID[df$RoadwayDescriptionID %in% c("One-way,not divided","Unknown")] <- "Other"

##
#RoadwaySurfaceTypeID: shrink down to 3 levels
# other = brick or block + other + dirt + slag,gravel,stone
#table(df$RoadwaySurfaceTypeID)
df$RoadwaySurfaceTypeID[df$RoadwaySurfaceTypeID %in% c("brick or block", "other", "dirt", "slag, gravel,stone")] <- "Other"

##
#TypeOfCollisionId
# sideswipe = sideswipe -same direction + sideswipe-opposite direction
# animals = deer + other animals
# non-vehicle = motorcylce + train + bicycle
# other = other + non-collision
#table(df$TypeOfCollisionId)
df$TypeOfCollisionId[df$TypeOfCollisionId %in% c("Sideswipe-Opposite direction","Sideswipe-same direction")] <- "Sideswipe"
df$TypeOfCollisionId[df$TypeOfCollisionId %in% c("Other Animal","Deer")] <- "Animals"
df$TypeOfCollisionId[df$TypeOfCollisionId %in% c("Bicyclist","Motorcyclist","Train")] <- "Other-Vehicle"
df<- df[df$TypeOfCollisionId != "Non-Collision",] 

##
#LightConditionID
# unknown = unknown + Unknown Road Lighting
#table(df$LightConditionID)
df$LightConditionID[df$LightConditionID == "Darkness-Unknown Road Lighting"] <- "Unknown" 

##
#WeatherConditionID
# Precipitation = rain + frozen precip
# other = fog+smoke+dust
#table(df$WeatherConditionID)
df$WeatherConditionID[df$WeatherConditionID == "Fog.Smoke.Dust"] <- "Fog"
df$WeatherConditionID[df$WeatherConditionID == ""] <- "Unknown"



setwd("~/Desktop/Data_Science/Spring/DataViz/final_visualization/project_data")

write.csv(df, "crashdata.csv")  #write as csv 
write.csv(sample_frac(df,size=0.4), "crashdata_sample.csv")



