library(readr)
library(dplyr)
library("FactoMineR")
SUPPORT2I <- read_csv("C:/Users/Pc/Desktop/ciencia-de-datos-/SUPPORT2I.csv")
str(SUPPORT2I)
X<-SUPPORT2I%>%select(!hospdead,!death)
Y<-SUPPORT2I%>%select(death)
X[,c(38,39,40,41,42,43,44,45)] <- lapply(X[,c(38,39,40,41,42,43,44,45)], function(x) {
  as.character(factor(x, exclude = NULL))  # Convertir a carácter y mantener los NA como "NA"
})

# Reemplazar los valores NA por "Desconocido"
X[,c(38,39,40,41,42,43,44,45)] <- lapply(X[,c(38,39,40,41,42,43,44,45)], function(x) {
  replace(x, is.na(x), "Desconocido")  # Reemplazar NA por "Desconocido"
})
X<-FAMD(X,graph = F)
X<-X$ind$coord
SUPPORT2_FAMD<-cbind(X,Y)
write.csv(SUPPORT2_FAMD, "SUPPORT2_FAMD.csv", row.names = FALSE)
