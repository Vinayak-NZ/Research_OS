library(highcharter)
library(htmlwidgets)
library(tidyr)

country <- read.csv("data/country.csv", header=TRUE)
never_internet <- read.csv("data/never_internet.csv", header=TRUE)
region_never <- read.csv("data/region_never.csv", header=TRUE)
region_zero <- read.csv("data/region_zero.csv", header=TRUE)

hc_country <- country %>% 
  hchart('bar', hcaes(x = 'Country', y = 'Percentage'))

hc_never_int <- never_internet %>% 
  hchart('area', hcaes(x = 'Year', y = 'Percentage'))

region_zero_long <- gather(region_never, year, percentage, X2012:X2018, factor_key=TRUE)

hc_zero_int <- region_zero_long  %>% 
  hchart('bar', hcaes(x = 'Region', y = 'percentage', group = 'year'))

saveWidget(hc_country, file="country.html")
saveWidget(hc_never_int, file="never_internet.html")
saveWidget(hc_zero_int, file="zero_internet.html")


