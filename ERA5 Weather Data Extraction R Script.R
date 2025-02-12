library(mcera5)
library(ecmwfr)
library(ncdf4)
library(microclima)

#Set my credentials with CDS

UID <- "104850"
cds_api_key <- "11fcf9f6-8ab9-4b48-9d00-a2edd6806914"

ecmwfr::wf_set_key(user=UID, key = cds_api_key, service = "cds")

#Lat and Long bounding box data for inland WA site. 

xmx <- -121.25 
xmn <- -121.5
ymn <- 45.5
ymx <- 45.75

#Designate your desired temporal extent
 
st_time <- lubridate::ymd("2008:01:01")
en_time <- lubridate::ymd("2012:12:31")

# Set the file name and location for downloaded .nc files

file_prefix <- "era5_InlandSite_5yr"

op <- "C:/Users/mattm/OneDrive/Desktop"

# Build a request

req <- build_era5_request(xmin = xmn, xmax = xmx,
                          ymin = ymn, ymax = ymx,
                          start_time = st_time,
                          end_time = en_time,
                          outfile_name = file_prefix)

request_era5(request = req, uid = "104850", out_path = op)

# List the path of the .nc file that was downloaded via request_era5()`

#my_nc <- "C:/Users/mattm/OneDrive/Desktop/era5_InlandSite_2016.nc"

# Specify desired single point (within the bounds of your .nc file)

#long <- -121.25
#lat <- 45.5

# Gather all hourly variables

#point_out_Inland <- extract_clim(nc = my_nc, long = long, lat = lat,
#                         start_time = st_time, end_time = en_time,
#                         dtr_cor = FALSE)

#write.csv(point_out_Inland, ".\\ERA5 Weather Data Inland_2016.csv")

#max(point_out_Inland[2])

######################################################################################
######################################################################################

#Lat and Long bounding box data for coastal WA site. 

xmx <- -122.25
xmn <- -122.50
ymn <- 48.0
ymx <- 48.25

#Designate your desired temporal extent

st_time <- lubridate::ymd("2017:01:01")
en_time <- lubridate::ymd("2017:12:31")

# Set the filename and location for downloaded .nc files

file_prefix <- "era5_CoastalSite_5yr"

op <- "C:/Users/mattm/OneDrive/Desktop"

# Build a request

req <- build_era5_request(xmin = xmn, xmax = xmx,
                          ymin = ymn, ymax = ymx,
                          start_time = st_time,
                          end_time = en_time,
                          outfile_name = file_prefix)

request_era5(request = req, uid = "104850", out_path = op)

# List the path of the .nc file that was downloaded via request_era5()`

#my_nc <- "C:/Users/mattm/OneDrive/Desktop/era5_CoastalSite_2016.nc"

# Specify desired single point (within the bounds of your .nc file)

#long_c <- -122.
#lat_c <- 48.

# Gather all hourly variables

#point_out_Coast <- extract_clim(nc = my_nc, long = long_c, lat = lat_c,
#                          start_time = st_time, end_time = en_time,
#                          dtr_cor = TRUE)

#max(point_out_Coast[2])

#write.csv(point_out_Coast, ".\\ERA5 Weather Data Coastal_2016.csv")

#plot(point_out_Inland$temperature~point_out_Inland$obs_time, type="p", col="red")
#points(point_out_Coast$temperature~point_out_Inland$obs_time, type="p", col="blue")

######################################################################################
######################################################################################

#Lat and Long bounding box data for highland, inland WA site. 

xmx <- -120.25
xmn <- -120.75
ymn <- 48.5
ymx <- 48.75

#Designate your desired temporal extent

st_time <- lubridate::ymd("2017:01:01")
en_time <- lubridate::ymd("2017:12:31")

# Set the filename and location for downloaded .nc files

file_prefix <- "era5_HighlandSite_5yr"

op <- "C:/Users/mattm/OneDrive/Desktop"

# Build a request

req <- build_era5_request(xmin = xmn, xmax = xmx,
                          ymin = ymn, ymax = ymx,
                          start_time = st_time,
                          end_time = en_time,
                          outfile_name = file_prefix)

request_era5(request = req, uid = "104850", out_path = op)

# List the path of the .nc file that was downloaded via request_era5()`

#my_nc <- "C:/Users/mattm/OneDrive/Desktop/era5_HighlandSite_2016.nc"

# Specify desired single point (within the bounds of your .nc file)

#long_c <- -120.43
#lat_c <- 48.6

# Gather all hourly variables

#point_out_Highland <- extract_clim(nc = my_nc, long = long_c, lat = lat_c,
#                                start_time = st_time, end_time = en_time,
#                                dtr_cor = FALSE)

#max(point_out_Highland[2])

#write.csv(point_out_Highland, ".\\ERA5_Weather_HighlandWA_2016.csv")

######################################################################################
######################################################################################

#Lat and Long bounding box data for highland, inland WA site. 

#xmx <- 239.75
#xmn <- 239.25
#ymn <- 48.5
#ymx <- 48.75

#Designate your desired temporal extent

#st_time <- lubridate::ymd("2016:01:01")
#en_time <- lubridate::ymd("2016:12:31")

# Set the filename and location for downloaded .nc files

#file_prefix <- "era5_HighlandSite_360TEST"

#op <- "C:/Users/mattm/OneDrive/Desktop"

# Build a request

#req <- build_era5_request(xmin = xmn, xmax = xmx,
#                          ymin = ymn, ymax = ymx,
#                          start_time = st_time,
#                          end_time = en_time,
#                          outfile_name = file_prefix)
#
#request_era5(request = req, uid = "104850", out_path = op)