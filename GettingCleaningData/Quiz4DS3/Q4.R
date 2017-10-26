library(dplyr)

##Q1 
url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url1,destfile = "Idahohousing",mode="wb")
wgtpsplit <- strsplit(names(idahostats),"wgtp")

##Q2
url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url2,destfile = "FGDP.csv",mode="wb")
###select required column,skip 4 rows and take 217 rows into dataset
fgdp <- read.csv("FGDP.csv",skip=4,nrows=217,header=FALSE,na.string="NA") %>%
select(c(1,2,4,5)) %>% filter(!(is.na(V1)|V1==""))
###label the column
names(fgdp) <- c("CountryCode","rank","name","gdp")
### get the mean after replacing , with "" and convert to numeric
 mean(as.numeric(gsub(",","",fgdp$gdp)),na.rm=TRUE)

##Q3
grep("^United",fgdp$name)
grep("^United",fgdp$name,value=TRUE)

##Q4
url4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url4,destfile="./country.csv",mode="wb")
countryds <- read.csv("country.csv",header=TRUE)
#fgdp <- rename(fgdp,"country"="CountryCode")
names(fgdp)<- c("CountryCode","rank","name","gdp")
merged <- merge(fgdp,countryds,by="CountryCode")
length(grep("Fiscal year end.*June",merged$Special.Notes))

## SETTING PROXY
curl <- getCurlHandle()
curlSetOpt(.opts = list(proxy = '172.16.32.151:8001'), curl = curl)
Res <- getURL('http://www.cricinfo.com', curl = curl)


##Q5
if(!"quantmod" %in% installed.packages()) 
{
  install.packages("quantmod")
}
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

library(lubridate)
sum(year(sampleTimes)==2012)
#[1] 250
sum(year(sampleTimes)==2012&weekdays(sampleTimes)=="Monday")
#[1] 47

