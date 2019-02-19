# install packages Note# tidyverse installs packages for dplyr and ggplot2
install.packages("tidyverse")

#open the library
library(tidyverse)


setwd("~/Documents/data_files/pesticides")

p = read.table("pesticide.txt",header = TRUE)

p

# must use factor R thinks this is a integer
class(p$Block)

# is a factor
class(p$blend)

# numeric
class(p$pctloss)

# using block as a factor
p1=aov(p$pctloss~factor(p$Block)+p$blend)

summary(p1)

# the summary will show more than 0.05 Tukey shows difference in all samples

# In Tukey we see D&E the best. LM shows blend E signicant
# In terms of the intercept all could be dropped but E
TukeyHSD(p1)

# running linear model pesticides we show blend E < 0.05
p2=lm(p$pctloss~factor(p$Block)+p$blend)
summary(g2)



# In Tukey we see D&E the best. LM shows blend E signicant
# In terms of the intercept all could be dropped but E
# below we dropped the block, improves model
p3=lm(p$pctloss~p$blend)
summary(g4)

boxplot(p$pctloss ~ p$blend, data=p, main="Pesticides", xlab="Blends", ylab="pctloss")
