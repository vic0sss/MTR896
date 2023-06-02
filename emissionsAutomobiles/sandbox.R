## data

veh_en_circulation <- head(
  read.csv("C:/Users/victo/OneDrive - ETS/MTR896/TRAVAIL/00_Donnees/vehicule-en-circulation-2018.csv")
)

cotes_conso <- head(
  read.csv("C:/Users/victo/OneDrive - ETS/MTR896/TRAVAIL/00_Donnees/AM2018 Cotes de consommation de carburant.csv",
           header = T, fileEncoding="windows-1252")
)
cotes_conso <- cotes_conso[,1:15]
