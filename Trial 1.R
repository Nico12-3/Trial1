library(tidyverse)
library(readxl)
library(ggpmisc)

data <- read_excel("Data/R trial.xlsx")

head(data)

library(ggplot2)

ggplot(data, aes(x = Day, y = Height_cm)) +
  geom_line(color = "#23f540", size = 1) +  # line graph
  geom_point(color = "#cd011d", size = 2) + # data points
  geom_text(aes(label = Height_cm), vjust = -0.5, size = 3) + #add data label, vjust label positioning
  geom_smooth(method = "lm", se = FALSE, color = "grey", linetype = "dashed") + #adding regression line
  stat_poly_eq(
    formula = y ~ x,
    aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~~")), #glue equation and R with separator ~~~, how many spaces
    label.x = "left",
    label.y = "top"
  )+
  labs(  # labels for title and axes
    title = "Plant Height over Time",
    x = "day",
    y = "height (cm)"
  ) +
  theme_minimal() + #no background box, subtle grid lines
  theme( #controls the appearance (fonts, alignment, spacing, etc.)
    plot.title = element_text(hjust = 0.5) # center the title
  )

ggsave("Trial1.png", dpi = 300, type = "cairo-png") #cairo-png: anti aliasing, better rendering, high quality
