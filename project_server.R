library("rjson")

main <- fromJSON(file = "https://data2.unhcr.org/population/get/sublocation?geo_id=0&forcesublocation=1&widget_id=283725&sv_id=54&color=%233c8dbc&color2=%23303030&population_group=5460")

refugee_daily_json <- fromJSON(file = "https://data2.unhcr.org/population/get/timeseries?widget_id=285656&sv_id=54&population_group=5460&frequency=day&fromDate=1900-01-01")

asylum_seeker <- fromJSON(file = "https://data2.unhcr.org/population/?widget_id=283733&sv_id=54&population_group=5459,5460&year=latest")

detail_info <- fromJSON(file = "https://data2.unhcr.org/population/get/sublocation?widget_id=283727&sv_id=54&population_group=5459,5460&forcesublocation=0&fromDate=1900-01-01")

country_name <- c()

refugee_count <- c()



for(i in 1:length(main$data)){
  country <- main$data[[i]]$geomaster_name
  country_name <- append(country_name, country)
  refugee <- main$dat[[i]]$individuals
  refugee_count<-append(refugee_count, refugee)
}

main_data <- data.frame(country_name, refugee_count)
