#Libraries
library(rvest)
library(tidyverse)
library(lubridate)

#Parse HTML tables for the Urls

urls <- c("https://sacoronavirus.co.za/2020/03/24/latest-confirmed-cases-of-covid-19-24th-march-2020/", "https://sacoronavirus.co.za/2020/03/26/latest-confirmed-cases-of-covid-19-26th-march-2020/", "https://sacoronavirus.co.za/2020/03/28/update-of-covid-19-28th-march-2020-2/", "https://sacoronavirus.co.za/2020/03/29/latest-confirmed-cases-of-covid-19-29th-march-2020/", "https://sacoronavirus.co.za/2020/03/31/update-of-covid-19-31st-march-2020/", "https://sacoronavirus.co.za/2020/04/04/update-of-covid-19-04th-april-2020/", "https://sacoronavirus.co.za/2020/04/05/update-of-covid-19-05th-april-2020/", "https://sacoronavirus.co.za/2020/04/06/update-on-covid-19-06th-april-2020/", "https://sacoronavirus.co.za/2020/04/08/update-on-covid-19-08th-april-2020/", "https://sacoronavirus.co.za/2020/04/12/update-on-covid-19-12th-april-2020/", 
          "https://sacoronavirus.co.za/2020/04/14/update-on-covid-19-14th-april-2020/", 
          "https://sacoronavirus.co.za/2020/04/15/update-on-covid-19-15th-april-2020/",
          "https://sacoronavirus.co.za/2020/04/17/update-on-covid-19-17th-april-2020/",
          "https://sacoronavirus.co.za/2020/04/18/update-on-covid-19-18th-april-2020/",
          "https://sacoronavirus.co.za/2020/04/19/update-on-covid-19-19th-april-2020/",
          "https://sacoronavirus.co.za/2020/04/21/update-on-covid-19-21st-april-2020/",
          "https://sacoronavirus.co.za/2020/04/22/update-on-covid-19-22nd-april-2020/", 
          "https://sacoronavirus.co.za/2020/04/25/update-on-covid-19-25th-april-2020/",
          "https://sacoronavirus.co.za/2020/04/26/update-on-covid-19-26-april/",
          "https://sacoronavirus.co.za/2020/04/27/update-on-covid-19-27th-april-2020/",
          "https://sacoronavirus.co.za/2020/04/28/update-on-covid-19-28th-april-2020-with-media-presentation/",
          "https://sacoronavirus.co.za/2020/04/29/update-on-covid-19-29th-april-2020/",
          "https://sacoronavirus.co.za/2020/04/30/update-on-covid-19-30th-april-2020/",
          "https://sacoronavirus.co.za/2020/05/01/update-on-covid-19-1st-may-2020/",
          "https://sacoronavirus.co.za/2020/05/03/update-on-covid-19-3rd-may-2020/",
          "https://sacoronavirus.co.za/2020/05/04/update-on-covid-19-4th-may-2020/",
          "https://sacoronavirus.co.za/2020/05/05/update-on-covid-19-5th-may-2020/",
          "https://sacoronavirus.co.za/2020/05/06/update-on-covid-19-6th-may-2020/",
          "https://sacoronavirus.co.za/2020/05/07/update-on-covid-19-7th-may-2020/",
          "https://sacoronavirus.co.za/2020/05/08/update-on-covid-19-8th-may-2020/",
          "https://sacoronavirus.co.za/2020/05/10/update-on-covid-19-10th-may-2020/",
          "https://sacoronavirus.co.za/2020/05/12/update-on-covid-19-12th-may-2020/",
          "https://sacoronavirus.co.za/2020/05/13/update-on-covid-19-13th-may-2020/",
          "https://sacoronavirus.co.za/2020/05/14/update-on-covid-19-14th-may-2020/",
          "https://sacoronavirus.co.za/2020/05/15/update-on-covid-19-15th-may-2020/",
          "https://sacoronavirus.co.za/2020/05/16/update-on-covid-19-16th-may-2020/",
          "https://sacoronavirus.co.za/2020/05/17/update-on-covid-19-17th-may-2020/",
          "https://sacoronavirus.co.za/2020/05/18/update-on-covid-19-18th-may-2020/",
          "https://sacoronavirus.co.za/2020/05/19/update-on-covid-19-19th-may-2020/",
          "https://sacoronavirus.co.za/2020/05/20/update-on-covid-19-20th-may-2020/",
          "https://sacoronavirus.co.za/2020/05/21/update-on-covid-19-21st-may/",
          "https://sacoronavirus.co.za/2020/05/22/update-on-covid-19-22nd-may-2020/",
          "https://sacoronavirus.co.za/2020/05/23/update-on-covid-19-23rd-may-2020/",
          "https://sacoronavirus.co.za/2020/05/24/update-on-covid-19-24th-may-2020/")

dates <- str_extract(urls, "2020/\\d{2}/\\d{2}")
dates <- dates[c(-21, -22)]

df <- lapply(urls, function(url){
  h <- read_html(url)
  nodes <- html_nodes(h, "table")
  html_table(nodes[[1]])
})

df1 <- df[[1]] 

listofdfs <- list(df1)

for(i in 2:20){
  listofdfs[[i]] <- df[[i]][-10,]
}


listofdfs[[23]]  <- df[[23]][c(-1, -11, -12),]
listofdfs[[24]] <- df[[24]][c(-1,-11),-3]


for(i in 25:32){
  listofdfs[[i]] <- df[[i]][c(-1, -11, -12),]
}

listofdfs[[33]] <- df[[33]][c(-1, -11, -12), c(-2, -4)]

for(i in c(34, 36, 38:44)){
  listofdfs[[i]] <- df[[i]][c(-1, -11, -12), -3]
}

for(i in c(35, 37)){
  listofdfs[[i]] <- df[[i]][c(-1, -11, -12), c(-2, -4)]
}

listofdfs <- listofdfs[-which(sapply(listofdfs, is.null))]

for(i in 1:length(listofdfs)){
  listofdfs[[i]][,1] <- tolower(listofdfs[[i]][,1])
}

for(i in 1:length(listofdfs)){
  colnames(listofdfs[[i]]) <- c("Provinces", "Total")
}

for(i in seq_along(listofdfs)){
  listofdfs[[i]][,1][str_detect(listofdfs[[i]][,1], "^kwazulu*")] <- "kwazulu natal"
}

#Put tables into a wide dataframe
wide_df <- listofdfs %>% reduce(left_join, by = "Provinces")
colnames(wide_df) <- c("Provinces", dates)
wide_df[, c("2020/05/01")][8] <- "18"

#Convert to a long dataframe
long_df <- gather(wide_df, key = "Date", value = "Total", -Provinces)
long_df$Date <- ymd(long_df$Date)
long_df$Provinces <- str_to_title(long_df$Provinces, locale = "en")
long_df$Total <- as.numeric(long_df$Total)

#Final Covid Case Totals Dataframe
covid_data <- long_df

#Create Location dataframe
map_data <- data.frame(Provinces = c("Eastern Cape", "Free State", "Gauteng", "Kwazulu Natal", "Limpopo", "Mpumalanga", "North West",
                                     "Northern Cape", "Western Cape"),
                       latit = c(-32.8499, 	-29.087217, -25.7479, -29.6006, -23.8962, -25.4753, -25.8560, -28.7282, -33.918861),
                       long = c(27.4410, 26.154898, 28.2293, 	30.3794, 29.4486, 30.9694, 25.6403, 24.7499, 18.423300))

#Merge the two data frames for final data
data <- left_join(covid_data, map_data, by = "Provinces")

#Export dataframe as a CSV
write.csv(data, "RSACovid.csv")