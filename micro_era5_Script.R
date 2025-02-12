library(NicheMapR)
library(ncdf4)

#This script will help get NicheMapR soil data from the ERA5 weather data set
#Remember to set the names of each site before running the script!


#First, let's check the lat long to make sure we have the right location data

fn <- 'era5_CoastalSite_2017.nc'
ncin <- nc_open(fn)

print(as.data.frame(ncvar_get(ncin, 'latitude')))
print(as.data.frame(ncvar_get(ncin, 'longitude')))
min(ncvar_get(ncin, 'time'))/8760 #Add this number to 1900 to get the year

#Start by requesting the dates over which you want the data

dstart <- "01/01/2017"
dfinish <- "31/12/2017"

#Give it a location within the ERA5 .nc file from which to calculate microclimate

loc <- c(-122.335, 48.096) 

#Run the model. Need to be in working directory with NC file. 

micro<-micro_era5(loc = loc, dstart = dstart, dfinish = dfinish, Usrhyt =0.02, 
                  slope=30, aspect=190, minshade=0, maxshade=90, coastal=T,
                  spatial = "era5_CoastalSite")

metout<-as.data.frame(micro$metout) # above ground microclimatic conditions, min shade
soil<-as.data.frame(micro$soil) # soil temperatures, minimum shade

shadmet<-as.data.frame(micro$shadmet) # above ground microclimatic conditions, max shade
shadsoil<-as.data.frame(micro$shadsoil) # soil temperatures, max shade

# append dates
tzone<-paste("Etc/GMT+",0,sep="")
dates<-seq(as.POSIXct(dstart, format="%d/%m/%Y",tz=tzone)-3600*12, as.POSIXct(dfinish, format="%d/%m/%Y",tz=tzone)+3600*11, by="hours")

metout <- cbind(dates,metout)
shadmet <- cbind(dates,shadmet)
soil <- cbind(dates,soil)
shadsoil <- cbind(dates,shadsoil)

#Check the path location where you are writing the csv file. Might change based on how directories are organized.

write.csv(metout, "./Sunny Air/Coastal_Sunny_AirTemp_2017.csv", row.names=F)
write.csv(shadmet, "./Shady Air/Coastal_Shady_AirTemp_2017.csv", row.names=F)
write.csv(soil, "./Sunny Soil/Coastal_Sunny_SoilTemp_2017.csv", row.names=F)
write.csv(shadsoil, "./Shady Soil/Coastal_Shady_SoilTemp_2017.csv", row.names=F)
