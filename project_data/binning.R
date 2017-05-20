# Final Data Viz Project
# DMV Capstone Data
# Tyler Hutcherson

# Binning

library(dplyr)
library(purrr)
library(readr)

setwd("~/Desktop/Data_Science/Spring/DataViz/final_visualization/project_data")
df <- read.csv("crashdata.csv")
# WeatherConditionID, LightConditionID, IntersectionTypeID, Alcohol, TypeOfCollisionID, RoadwayDefectID

# Weather Condition ID vs Light Condition ID
temp <- group_by(df,WeatherConditionID,LightConditionID) %>% summarize(n())
output <- data.frame(matrix(NA, nrow = length(levels(df$WeatherConditionID)), ncol = length(levels(df$LightConditionID))))
for(i in 1:length(levels(df$WeatherConditionID))){
  for(j in 1:length(levels(df$LightConditionID))){
    output[i,j] <- temp[temp$WeatherConditionID == levels(temp$WeatherConditionID)[i] & temp$LightConditionID == levels(temp$LightConditionID)[j],3] %>% 
                    unlist()
  }
}
d_WeatherConditionID_LightConditionID_nonfatal <- output
row.names(d_WeatherConditionID_LightConditionID_nonfatal) <- levels(df$WeatherConditionID)
names(d_WeatherConditionID_LightConditionID_nonfatal) <- levels(df$LightConditionID)

# Weather Condition ID vs Intersection Type ID
temp <- group_by(df,WeatherConditionID,IntersectionTypeID) %>% summarize(n())
output <- data.frame(matrix(NA, nrow = length(levels(df$WeatherConditionID)), ncol = length(levels(df$IntersectionTypeID))))
for(i in 1:length(levels(df$WeatherConditionID))){
  for(j in 1:length(levels(df$IntersectionTypeID))){
    output[i,j] <- temp[temp$WeatherConditionID == levels(temp$WeatherConditionID)[i] & temp$IntersectionTypeID == levels(temp$IntersectionTypeID)[j],3] %>% 
      unlist()
  }
}
d_WeatherConditionID_IntersectionTypeID_nonfatal <- output
row.names(d_WeatherConditionID_IntersectionTypeID_nonfatal) <- levels(df$WeatherConditionID)
names(d_WeatherConditionID_IntersectionTypeID_nonfatal) <- levels(df$IntersectionTypeID)

# Weather Condition ID vs Alcohol
temp <- group_by(df,WeatherConditionID,Alcohol) %>% summarize(n())
output <- data.frame(matrix(NA, nrow = length(levels(df$WeatherConditionID)), ncol = length(levels(df$Alcohol))))
for(i in 1:length(levels(df$WeatherConditionID))){
  for(j in 1:length(levels(df$Alcohol))){
    output[i,j] <- temp[temp$WeatherConditionID == levels(temp$WeatherConditionID)[i] & temp$Alcohol == levels(temp$Alcohol)[j],3] %>% 
      unlist()
  }
}
d_WeatherConditionID_Alcohol_nonfatal <- output
row.names(d_WeatherConditionID_Alcohol_nonfatal) <- levels(df$WeatherConditionID)
names(d_WeatherConditionID_Alcohol_nonfatal) <- levels(df$Alcohol)

######################################################

# TypeOfCollisionID vs Light Condition ID
temp <- group_by(df,TypeOfCollisionId,LightConditionID) %>% summarize(n())
output <- data.frame(matrix(NA, nrow = length(levels(df$TypeOfCollisionId)), ncol = length(levels(df$LightConditionID))))
for(i in 1:length(levels(df$TypeOfCollisionId))){
  for(j in 1:length(levels(df$LightConditionID))){
    output[i,j] <- temp[temp$TypeOfCollisionId == levels(temp$TypeOfCollisionId)[i] & temp$LightConditionID == levels(temp$LightConditionID)[j],3] %>% 
      unlist()
  }
}
d_TypeOfCollisionId_LightConditionID_nonfatal <- output
row.names(d_TypeOfCollisionId_LightConditionID_nonfatal) <- levels(df$TypeOfCollisionId)
names(d_TypeOfCollisionId_LightConditionID_nonfatal) <- levels(df$LightConditionID)

# TypeOfCollisionID vs Intersection Type ID
temp <- group_by(df,TypeOfCollisionId,IntersectionTypeID) %>% summarize(n())
output <- data.frame(matrix(NA, nrow = length(levels(df$TypeOfCollisionId)), ncol = length(levels(df$IntersectionTypeID))))
for(i in 1:length(levels(df$TypeOfCollisionId))){
  for(j in 1:length(levels(df$IntersectionTypeID))){
    output[i,j] <- temp[temp$TypeOfCollisionId == levels(temp$TypeOfCollisionId)[i] & temp$IntersectionTypeID == levels(temp$IntersectionTypeID)[j],3] %>% 
      unlist()
  }
}
d_TypeOfCollisionId_IntersectionTypeID_nonfatal <- output
row.names(d_TypeOfCollisionId_IntersectionTypeID_nonfatal) <- levels(df$TypeOfCollisionId)
names(d_TypeOfCollisionId_IntersectionTypeID_nonfatal) <- levels(df$IntersectionTypeID)

# TypeOfCollisionID vs Alcohol
temp <- group_by(df,TypeOfCollisionId,Alcohol) %>% summarize(n())
output <- data.frame(matrix(NA, nrow = length(levels(df$TypeOfCollisionId)), ncol = length(levels(df$Alcohol))))
for(i in 1:length(levels(df$TypeOfCollisionId))){
  for(j in 1:length(levels(df$Alcohol))){
    output[i,j] <- temp[temp$TypeOfCollisionId == levels(temp$TypeOfCollisionId)[i] & temp$Alcohol == levels(temp$Alcohol)[j],3] %>% 
      unlist()
  }
}
d_TypeOfCollisionId_Alcohol_nonfatal <- output
row.names(d_TypeOfCollisionId_Alcohol_nonfatal) <- levels(df$TypeOfCollisionId)
names(d_TypeOfCollisionId_Alcohol_nonfatal) <- levels(df$Alcohol)

########################################################################################

# RoadwayDefectID vs Light Condition ID
temp <- group_by(df,RoadwayDefectID,LightConditionID) %>% summarize(n())
output <- data.frame(matrix(NA, nrow = length(levels(df$RoadwayDefectID)), ncol = length(levels(df$LightConditionID))))
for(i in 1:length(levels(df$RoadwayDefectID))){
  for(j in 1:length(levels(df$LightConditionID))){
    output[i,j] <- temp[temp$RoadwayDefectID == levels(temp$RoadwayDefectID)[i] & temp$LightConditionID == levels(temp$LightConditionID)[j],3] %>% 
      unlist()
  }
}
d_RoadwayDefectID_LightConditionID_nonfatal <- output
row.names(d_RoadwayDefectID_LightConditionID_nonfatal) <- levels(df$RoadwayDefectID)
names(d_RoadwayDefectID_LightConditionID_nonfatal) <- levels(df$LightConditionID)

# RoadwayDefectID vs Intersection Type ID
temp <- group_by(df,RoadwayDefectID,IntersectionTypeID) %>% summarize(n())
output <- data.frame(matrix(NA, nrow = length(levels(df$RoadwayDefectID)), ncol = length(levels(df$IntersectionTypeID))))
for(i in 1:length(levels(df$RoadwayDefectID))){
  for(j in 1:length(levels(df$IntersectionTypeID))){
    output[i,j] <- temp[temp$RoadwayDefectID == levels(temp$RoadwayDefectID)[i] & temp$IntersectionTypeID == levels(temp$IntersectionTypeID)[j],3] %>% 
      unlist()
  }
}
d_RoadwayDefectID_IntersectionTypeID_nonfatal <- output
row.names(d_RoadwayDefectID_IntersectionTypeID_nonfatal) <- levels(df$RoadwayDefectID)
names(d_RoadwayDefectID_IntersectionTypeID_nonfatal) <- levels(df$IntersectionTypeID)

# RoadwayDefectID vs Alcohol
temp <- group_by(df,RoadwayDefectID,Alcohol) %>% summarize(n())
output <- data.frame(matrix(NA, nrow = length(levels(df$RoadwayDefectID)), ncol = length(levels(df$Alcohol))))
for(i in 1:length(levels(df$RoadwayDefectID))){
  for(j in 1:length(levels(df$Alcohol))){
    output[i,j] <- temp[temp$RoadwayDefectID == levels(temp$RoadwayDefectID)[i] & temp$Alcohol == levels(temp$Alcohol)[j],3] %>% 
      unlist()
  }
}
d_RoadwayDefectID_Alcohol_nonfatal <- output
row.names(d_RoadwayDefectID_Alcohol_nonfatal) <- levels(df$RoadwayDefectID)
names(d_RoadwayDefectID_Alcohol_nonfatal) <- levels(df$Alcohol)
##################################################################
# write out csv files
write.csv(d_WeatherConditionID_Alcohol_nonfatal, "WeatherConditionID_Alcohol_nonfatal.csv")
write.csv(d_WeatherConditionID_IntersectionTypeID_nonfatal, "WeatherConditionID_IntersectionTypeID_nonfatal.csv")
write.csv(d_WeatherConditionID_LightConditionID_nonfatal, "WeatherConditionID_LightConditionID_nonfatal.csv")
write.csv(d_TypeOfCollisionId_Alcohol_nonfatal, "TypeOfCollisionId_Alcohol_nonfatal.csv")
write.csv(d_TypeOfCollisionId_IntersectionTypeID_nonfatal, "TypeOfCollisionId_IntersectionTypeID_nonfatal.csv")
write.csv(d_TypeOfCollisionId_LightConditionID_nonfatal, "TypeOfCollisionId_LightConditionID_nonfatal.csv")
write.csv(d_RoadwayDefectID_Alcohol_nonfatal, "RoadwayDefectID_Alcohol_nonfatal.csv")
write.csv(d_RoadwayDefectID_IntersectionTypeID_nonfatal, "RoadwayDefectID_IntersectionTypeID_nonfatal.csv")
write.csv(d_RoadwayDefectID_LightConditionID_nonfatal, "RoadwayDefectID_LightConditionID_nonfatal.csv")







