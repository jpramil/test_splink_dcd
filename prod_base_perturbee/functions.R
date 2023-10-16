#' add_pattern
#' 
#' Ajoute un pattern à une chaine de charactères.
#' Taille et position du pattern à choisir.
#'
#' @param vecteur 
#' @param taille_pattern 
#' @param pos.pattern 
#'
#' @return vecteur character perturbé
#'
#' @examples
#' add_pattern( c("aaa", "bbbbb", "ccccccc"), 2, 10)
#' 
add_pattern <- function(vecteur, taille_pattern, pos.pattern){
  # taille_pattern <- 3
  # vecteur <- c("aaa", "bbbbb", "ccccccc")
  
  n <- length(vecteur)
  
  all_patterns <- vector()
  
  for (i in 1:taille_pattern) {
    if( i == 1){
      all_patterns <- letters
    }else{
      all_patterns <- expand.grid(all_patterns, letters) |> apply(1, paste,  collapse = "")
    }
  }

  vecteur_patterns <- sample(all_patterns, n, replace = TRUE) 
  
  
  if(pos.pattern == 1){
    vecteur_perturbe <- str_c(vecteur_patterns, vecteur) 
  }else{
    vecteur_perturbe <- str_sub(vecteur, 1, pos.pattern-1) |> 
      str_c(vecteur_patterns) |> 
      str_c(str_sub(vecteur, pos.pattern ))
  }
  
  
  return(vecteur_perturbe)
}





