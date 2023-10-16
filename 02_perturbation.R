source("./functions.R")


deces_perturb <- deces
n <- nrow(deces_perturb)
part_a_perturber_addpattern <- 0.03
part_a_perturber_na <- 0.01
part_a_perturber_inversion_mois_annee <- 0.02
part_a_perturber_2lastletters <- 0.03

deb <- Sys.time()

# Ajout pattern à nom_etat_civil
lignes_a_perturber <- sample.int(n, floor(n * part_a_perturber_addpattern), replace = FALSE)

deces_perturb[lignes_a_perturber, 
     ':='(
       nom_etat_civil = add_pattern(nom_etat_civil, taille_pattern = 2, pos.pattern = 3),
       perturbation = TRUE
       )]

# Ajout pattern à prenoms_etat_civil
lignes_a_perturber <- sample.int(n, floor(n * part_a_perturber_addpattern), replace = FALSE)
deces_perturb[lignes_a_perturber, 
     ':='(
       prenoms_etat_civil = add_pattern(prenoms_etat_civil, taille_pattern = 1, pos.pattern = 1),
       perturbation = TRUE
     )]

# Ajout NA aléatoirement

for (var in c("nom_etat_civil", "prenoms_etat_civil", 
              "lieunaiss", "jnais_etat_civil", 
              "mnais_etat_civil", "anais_etat_civil")) {
  lignes_a_perturber <- sample.int(n, floor(n * part_a_perturber_na), replace = FALSE)
  deces_perturb[lignes_a_perturber, (var) := NA]
  deces_perturb[lignes_a_perturber, perturbation := TRUE]
}


# Remplacement du mois et du jour de naissance

lignes_a_perturber <- sample.int(n, floor(n * part_a_perturber_inversion_mois_annee), replace = FALSE)
deces_perturb[lignes_a_perturber, ':='(
  mnais_etat_civil = anais_etat_civil,
  anais_etat_civil = mnais_etat_civil,
  perturbation = TRUE) ]


# On retire les deux dernières lettres

for (var in c("nom_etat_civil", "prenoms_etat_civil")) {
  lignes_a_perturber <- sample.int(n, floor(n * part_a_perturber_2lastletters), replace = FALSE)
  deces_perturb[lignes_a_perturber, (var) := str_sub(get(var), 1, -3)]
  deces_perturb[lignes_a_perturber, perturbation := TRUE]
  
}



fin <- Sys.time()
fin - deb
