# Install < remotes > package (if not already installed) ----
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}

# Install < fairpub > from GitHub ----
remotes::install_github("frbcesab/fairpub")

library("fairpub")

options(openalexR.mailto = 'barragansljose@gmail.com')

doi_list = c(
  "https://doi.org/10.1111/1365-2664.70216", #J. Appl. Ecol.
  "https://doi.org/10.1111/geb.70000", #Glob. Ecol. Biogeogr.
  "https://doi.org/10.1098/rsbl.2023.0296", #Bio. Lett.
  "https://doi.org/10.1111/1365-2435.14340", #Funct. Ecol.
  "https://doi.org/10.1111/ele.14206", #Eco. Lett.
  "https://doi.org/10.1111/geb.13643", #Glob. Ecol. Biogeogr.
  "https://doi.org/10.1111/1365-2656.13889", #J. Anim. Ecol.
  "https://doi.org/10.7818/ECOS.2380", #Ecosistemas
  "https://doi.org/10.1111/1365-2745.13640", #J. Ecol.
  "https://doi.org/10.1111/ele.12954") #Eco. Lett.

fp_compute_ratio(doi = doi_list)
fp_journal_fairness(journal = "Ecosistemas")

journals = c("Journal of applied Ecology",
             "Global Ecology and Biogeography", 
             "Biology Letters", 
             "Functional Ecology", 
             "Ecology Letters", 
             "Global Ecology and Biogeography", 
             "Journal of Animal Ecology", 
             "Ecosistemas", 
             "Journal of Ecology",
             "Ecology Letters")

library(dplyr)

results_df <- bind_rows(lapply(journals, fp_journal_fairness), .id = "journal")

fp_journal_fairness(journal = journals)
