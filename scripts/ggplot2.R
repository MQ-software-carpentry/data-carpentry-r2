library(ggplot2)
interviews_plotting <- readRDS("~/Desktop/data-carpentry-r2/data/Interviews_plotting.rds")

## ggplot(data = <DATA>, 
 ## mapping = aes(<MAPPINGS>)) + <GEOM_FUNCTION>()

ggplot(data = interviews_plotting, 
       aes(x = no_membrs, y = number_items)) +
  geom_point(alpha = 0.4)

ggplot(data = interviews_plotting, 
       aes(x = no_membrs, y = number_items)) +
  geom_jitter(alpha = 0.4)

ggplot(data = interviews_plotting, 
       aes(x = no_membrs, y = number_items)) +
  geom_jitter(alpha = 0.4, color = "blue")

ggplot(data = interviews_plotting, 
       aes(x = no_membrs, y = number_items)) +
  geom_jitter(alpha = 0.4, aes(color = village))

ggplot(data = interviews_plotting, 
       aes(x = no_membrs, y = number_items, 
           color = village)) +
  geom_jitter(alpha = 0.4, aes(size = no_membrs/3))

ggplot(data = interviews_plotting, 
       aes(x = village, y = rooms, 
           color = respondent_wall_type)) +
  geom_jitter(alpha = 0.6)

ggplot(data = interviews_plotting, 
       aes(x = respondent_wall_type, y = rooms))+
  geom_boxplot(alpha = 0) +
  geom_jitter(alpha = 0.5, color = "tomato", 
              width = 0.2)

ggplot(data = interviews_plotting, 
       aes(x = respondent_wall_type, y = rooms))+
  geom_jitter(alpha = 0.5, color = "tomato", 
              width = 0.2) +
  geom_boxplot(alpha = 0)

 
ggplot(data = interviews_plotting, 
       aes(x = respondent_wall_type, y = rooms))+
  geom_jitter(alpha = 0.5, color = "tomato", 
              width = 0.2) +
  geom_violin(alpha = 0)

ggplot(data = interviews_plotting, 
       aes(x = respondent_wall_type, 
           y = liv_count))+
  geom_jitter(alpha = 0.5, color = "tomato", 
              width = 0.2) +
  geom_boxplot(alpha = 0)

ggplot(data = interviews_plotting, 
       aes(x = respondent_wall_type, 
           y = liv_count))+
  geom_jitter(alpha = 0.5, width = 0.2, 
              aes(color = memb_assoc), height = 0.2) +
  geom_boxplot(alpha = 0)


ggplot(interviews_plotting, 
       aes(x = respondent_wall_type)) +
  geom_bar(aes(fill = village))

ggplot(interviews_plotting, 
       aes(x = respondent_wall_type)) +
  geom_bar(aes(fill = village), position = "dodge")

p <- ggplot(interviews_plotting, 
       aes(x = respondent_wall_type)) +
  geom_bar(aes(fill = village), position = "dodge") +
  labs(x = "Wall Type", y = "Count") +
  facet_grid(memb_assoc~village) + theme(axis.text.x = element_text(angle = 90))

