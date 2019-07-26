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

interviews_ppl_room <- interviews %>%
  filter(memb_assoc == "yes") %>%
  mutate(people_per_room = no_membrs / rooms)

View(interviews_ppl_room)


total_meals <- interviews %>%
  mutate(total_meals = no_membrs * no_meals) %>%
  filter(total_meals > 20) %>%
  select(village, total_meals)
  
  
  
