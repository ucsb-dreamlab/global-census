# a quick international census demo

library(idbr)
library(tidycensus)
library(tidyverse)
library(jsonlite)
library(scales)


# read api key file
census_key <- readLines("census-apikey.txt", n = 1)

idb_api_key(census_key)

# get all the countries from the idb
countries <- get_idb(country = "all", 
                     year = 2021,
                     api_key = idb_api_key)

unique(countries)
str(countries)

# can you edit this code to get your country?
china_pop <- get_idb(
  country = "China",
  variables = "pop",
  year = 1990:2100, 
  api_key = idb_api_key
)

china_pop

ggplot(china_pop, aes(x = year, y = pop)) + 
  geom_line(color = "darkgreen") + 
  theme_minimal() + 
  scale_y_continuous(labels = label_comma()) + 
  labs(title = "Population of the PRC",
       subtitle = "1990 to 2100 (projected)",
       x = "Year",
       y = "Population at midyear")



# can Omar's students do pre-work?