# united nations voting data
# load the readr, tidyr and dplyr package
library(tidyverse)
library(stringr)
library(lubridate)
library(data.table)


# Import the UNVotesPublished.tab file using readr package and save as votes
resolutions <-read_tsv("UNResolutions.txt")
View(resolutions)


# Look at the structure
str(resolutions)

# Filter for resolutions that are "yes", "abstain", or "no"
resolutions1 <- filter(resolutions, vote <=3 )

resolutions %>%
  filter(vote <= 3)

View(resolutions1)
write_tsv(resolutions,"resolutions1.txt")

# Add another %>% step to add a year column
resolutions2 <- mutate(resolutions1, year = session + 1945)

# or

resolutions %>%
  filter(vote <= 3) %>%
  mutate(year = session + 1945)


View(resolutions2)
write_tsv(resolutions,"resolutions2.txt")
# Load the countrycode package
install.packages("countrycode")
library(countrycode)

# Convert country code 160
countrycode(c(640,100,135,140,145,160), "cown", "country.name")

# Add a country column within the mutate: votes_processed
resolutions_country <- mutate(resolutions2, country = countrycode(ccode, "cown", "country.name"))
resolutions_country <- resolutions %>%
  filter(vote <= 3) %>%
  mutate(year = session + 1945,
         country = countrycode(ccode, "cown", "country.name"))

View (resolutions_country)
write_tsv(resolutions_country,"resolutions_country.txt")

# Eliminating not necessary, noisy columns- session, ccode, member
resolutions3 <- select(resolutions_country, -c(session, ccode, member))
View(resolutions3)
class(resolutions3$date)

# Convert date type in date column
resolutions3$date <- mdy(resolutions3$date)
View(resolutions3)
class(resolutions3$date)


#split (separate unres column into 3)
resolutions4 <-separate(resolutions3, unres, c("code1", "code2", "code3"))
View(resolutions4)

#rename columns

resolutions5 <- rename(resolutions4, middleeast = me, humanrights = hr, nuclear = nu, armscontrol = di, economic = ec)
View(resolutions5)


#Find total and fraction of "yes" votes
summarize(resolutions5, total = n(),
                                 percent_yes = mean(vote == 1),
                                percent_no = mean(vote == 3))
View(resolutions_country)
resolutions_country %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))


# Change this code to summarize by year
resolutions5 %>%
  group_by(year) %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))



# Summarize by country: by_country
by_country <- resolutions5 %>%
  group_by(country) %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))
View(by_country)


# Sort in ascending order of percent_yes
arrange(by_country, percent_yes)

by_country %>%
  arrange(percent_yes)


# Filter out countries with fewer than 2000 votes
arrange(filter(by_country, total >=2000), percent_yes)

resolutions_final <-by_country %>%
  arrange(percent_yes) %>%
  filter(total >= 2000)

View(resolutions_final)

# Define by_year
by_year <- resolutions5 %>%
  group_by(year) %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))
View(by_year)

## VISULIZATION


# Load the ggplot2 package
library(ggplot2)

# Create scatter plot
ggplot(by_year) +
  geom_point(mapping= aes(x=total, y=percent_yes))

# Change to scatter plot and add smoothing curve
ggplot(by_year, aes(year, percent_yes)) +
  geom_point() +
  geom_smooth()

# Group by year and country: by_year_country
by_year_country <- resolutions5 %>%
  group_by(year, country) %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))

View(by_year_country)


# Vector of four countries to examine
countries <- c("United States of America", "Turkey",
               "France", "India")

# Filter by_year_country: filtered_4_countries
filtered_4_countries <- by_year_country %>%
  filter(country %in% countries)

# Scatter plot of % yes in four countries
ggplot(filtered_4_countries, aes(year, percent_yes, color = country)) +
  geom_point()


# Faceting
# Vector of six countries to examine
countries <- c("United States of America", "Turkey",
               "France", "Japan", "Brazil", "India")

# Filtered by_year_country: filtered_6_countries
filtered_6_countries <- by_year_country %>%
  filter(country %in% countries)

# Line plot of % yes over time faceted by country
ggplot(filtered_6_countries, aes(year, percent_yes)) +
  geom_line() +
  facet_wrap(~ country)

# Vector of six countries to examine
countries <- c("United States", "Turkey",
               "France", "Japan", "Brazil", "India")


# Line plot of % yes over time faceted by country
ggplot(filtered_6_countries, aes(year, percent_yes)) +
  geom_line() +
  facet_wrap(~ country, scales = "free_y")
