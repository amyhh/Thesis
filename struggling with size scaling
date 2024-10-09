#primary intention to treat analysis 
#rt-pcr confirmed covid-19

#with forestplot package - have questions about why the black bars are so big
## install.packages("forestplot")
library(dplyr)
library(tidyverse)
library(gt)
library(ggplot2); theme_set(theme_classic(base_size=12))
library(grid)

#Hazard ratios setup

## Low priority, consider making a tsv or something and reading it in
country.name <- c("Canada", "Israel", "Pakistan", "Egypt", "All sites")
HR <- c(2.83, 1.54, 1.50, 0.95, 1.14)
lower.CI <- c(0.75, 0.43, 0.25, 0.60, 0.77)
upper.CI <- c(10.72, 5.49, 8.98, 1.50, 1.69)
sample.size <- c(266, 34, 186, 518, 1004)
data <- data.frame(country.name, HR, lower.CI, upper.CI, sample.size)
print(data)
view(data) #this lets me view as a table in another tab

######################################################################

## Think about what you would need to pass to make this a separate script
#using ggplot2
base <- (
  ggplot(data)
  + aes(y = fct_rev(country.name))) + 
  geom_point(aes(x=data$HR), shape=15, size = scale(sample.size)) +
  geom_linerange(aes(xmin=data$lower.CI, xmax=data$upper.CI)) +
  geom_vline(xintercept = 2, linetype="dashed") +
  geom_vline(xintercept = 1, linetype="dotted") +
  #this doesn't work axisTicks(c(min(data$lower.CI), max(data$upper.CI)), log = FALSE, axp = NULL, nint = 10) +
  labs(title = "Hazard Ratio of Covid-19 Infection for Surgical Masks vs.Respirator", x="Hazard Ratio (95% CI)", y="Country") +
  annotate("text", x = 1, y = 0.5, label = "HR = 1") +
  theme(panel.background = element_rect(fill = "white"), axis.line.x.bottom=element_line(color="black"), axis.line.y.left=element_line(color="black") )

## A lot like Loeb (although Loeb manages to be worse)
print(base + scale_x_continuous(breaks = c(1,seq(0, 10, 2))))

print(base + scale_x_continuous(breaks = c(log(2), log(4)), (trans="log2")))

print(base + scale_size(limits = c(0,50), breaks = unique(data$sample.size)))
