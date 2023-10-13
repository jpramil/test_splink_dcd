
chaine <- c("aaaaa", "bbbbbbbbb", "cccccccccccccc", "ddd", "eeeeeee", "fff")
n <- length(chaine)

library(stringr)


chaine %>% str_replace("^.", "x")
