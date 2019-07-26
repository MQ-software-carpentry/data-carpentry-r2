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
  
interviews %>%
  group_by(village) %>%
  summarize(mean_no_membrs = mean(no_membrs))

interviews %>%
  filter(!is.na(memb_assoc)) %>%
  group_by(village, memb_assoc) %>%
  summarize(mean_no_membrs = mean(no_membrs),
            min_membrs = min(no_membrs)) %>%
arrange(desc(min_membrs))

interviews %>% count(village, sort=TRUE)


interviews %>%
  group_by(village) %>%
  summarize(
    mean = mean(no_membrs),
    max = max(no_membrs),
    min = min(no_membrs),
    n = n()
  )


interviews_spread <- interviews %>%
  mutate(wall_type_logical = TRUE) %>%
  spread(key=respondent_wall_type, value = wall_type_logical, fill = FALSE)

View(interviews_spread)



interviews_gather <- interviews_spread %>%
  gather(key = "respondent_wall_type", value = "wall_type_logical",
         burntbricks:sunbricks) %>%
  filter(wall_type_logical) %>%
  select(-wall_type_logical)

View(interviews_gather)
