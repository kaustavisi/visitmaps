library(highcharter)
library(jsonlite)
library(tibble)

visited_country <- tribble(
  ~country, ~year,    ~stay,
  "India",  "1994",   "27 years",
  "Brazil", "2016",   "15 days",
  "Germany", "2022",  "xyz months"
  )

visited_country$visited <- 1

md_map_json <- fromJSON(txt = "https://gist.githubusercontent.com/dwannat/24d6e65c6770faad006e3f613036deb4/raw/de76b23b7b7d55a68becb5ca977420b7e41cd05a/world-india.map.json",
                        simplifyVector = FALSE)
highchart() %>%
  hc_add_series_map(md_map_json, 
                    visited_country, 
                    value = "visited", 
                    joinBy = c("name", "country")) %>%
  hc_tooltip(formatter = JS("function(){
                            return ('<b>' + this.point.country +'</b><br> Visited in: ' + this.point.year + '<br> Stayed for: ' + this.point.stay)
                            }"))
