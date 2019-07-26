library(dplyr)
library(tidyr)

interviews <- read_csv("data/SAFI_clean.csv", na="NULL")

select_cols <- select(interviews, village, no_membrs, years_liv)
god_data <- filter(select_cols, village == "God", no_membrs > 6)

interviews %>% 
  select(village, no_membrs, years_liv) %>% 
  filter(village == "God", no_membrs > 6)

# Exrcise
interviews %>% 
  filter(memb_assoc == "yes") %>%
  select(affect_conflicts, liv_count, no_meals)
