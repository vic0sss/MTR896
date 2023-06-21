## Script pour la déclaration de fonctions nécessaires à diverses analyses
## Victor Nunzi
## 2023-05-18

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#### str_detect_vect
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

## description :

# permet de vérifier si au moins un des éléments d'un vecteur (pattern, type char)
#   sont dans au moins un des éléments d'un autre vecteur (string, type char)
#   str_detect_vect renvoie un vecteur de booléens de la dimension de string

# exemple :

# string  <- c("Toto", "Papa", "Maman", "Zuzu",)
# pattern <- c("o", "a", "i") 
# str_detect_vect(string, pattern)
# > c(TRUE, TRUE, TRUE, FALSE)

## code :

str_detect_vect <- function(string, pattern){
  
  str_detect_matrix <- Vectorize(str_detect, vectorize.args = "pattern") 
  
  MAT <- str_detect_matrix(string, pattern)
  MAT <- as.matrix(MAT)
  
  VECT <- rowSums(MAT)
  
  VECT.bool <- VECT >= 1
  
  return(VECT.bool)
  
}

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#### get_element
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

## description :

# retourne, pour chaque vecteur d'un champ ou d'un vecteur, l'élément à la position index de ce vecteur

## exemple :

# vect <- c(c(1, 2, 6), 
#           c(3, 4, 7))
# index <- 2
# get_element(vect, index)
# > c(2, 4)

## code :

get_element <- Vectorize(
  FUN = function(vect, index){return(vect[index])},
  vectorize.args = "vect")