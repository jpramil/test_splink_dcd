perturb <- function(vecteur, taille_pattern, pos.pattern){
  n <- length(vecteur)
  
  all_patterns <- expand.grid(letters, letters, letters) |> apply(1, paste,  collapse = "")
  vecteur_patterns <- sample(all_patterns, n, replace = TRUE) 
  
  vecteur_perturbe <- str_sub(vecteur, -1, pos.pattern) |> 
    str_c(vecteur_patterns) |> 
    str_c(str_sub(vecteur, pos.pattern ))
  
  return(vecteur_perturbe)
}

perturb( c("aaa", "bbbbb", "ccccccc"), 2, 3)

deb <- Sys.time()

base <- deces[1:100]
n <- nrow(base)
part_a_perturber <- 0.50
 
lignes_a_perturber <- sample.int(n, floor(n * part_a_perturber), replace = FALSE)
base[lignes_a_perturber, new := perturb(nom_etat_civil, taille_pattern = 3, pos.pattern = 2)][
  !is.na(new), nom_etat_civil := new][
    , new := NULL
  ]

fin <- Sys.time()
fin - deb
