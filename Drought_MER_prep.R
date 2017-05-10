#load package
library(dplyr)

#subset FC by indicator
FVsubset <- subset(ICPI_FactView_Site_IM_Malawi_20170324_v2_2, indicator=="TX_CURR" | indicator=="TX_NEW" | indicator=="TX_RET") %>%
  subset(disaggregate=="Total Numerator" | disaggregate=="Total Denominator") %>%
  subset(select = c(OperatingUnit, PSNU, PSNUuid, FacilityUID, FY16FacilityPrioritization, FY17FacilityPrioritization, indicator, disaggregate, FY2015Q2, FY2015Q3, FY2015Q4, FY2015APR, FY2016Q1, FY2016Q2, FY2016Q3, FY2016Q4, FY2016APR, FY2017Q1))

#load package
library(car)

#recode prioritization values
FVsubset$FY16FacilityPrioritization [FVsubset$FY16FacilityPrioritization=="5 - Centrally Supported"] <- "Centrally Supported"
FVsubset$FY16FacilityPrioritization [FVsubset$FY16FacilityPrioritization=="4 - Sustained"] <- "Sustained"
FVsubset$FY16FacilityPrioritization [FVsubset$FY16FacilityPrioritization=="3 - Scale-Up"] <- "Scale Up"
FVsubset$FY17FacilityPrioritization [FVsubset$FY17FacilityPrioritization=="5 - Centrally Supported"] <- "Centrally Supported"
FVsubset$FY17FacilityPrioritization [FVsubset$FY17FacilityPrioritization=="4 - Sustained"] <- "Sustained"
FVsubset$FY17FacilityPrioritization [FVsubset$FY17FacilityPrioritization=="3 - Scale-Up"] <- "Scale Up"