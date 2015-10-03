---
title: Maps all parking signs in NYC.
comments: true
author: Noppanit Charassinvichai
layout: post
permalink: /maps-all-parking-signs-in-nyc/
dsq_thread_id:
  - 3987166645
categories:
  - Knowledges
tags:
  - data science
  - google fusion
  - map
  - nyc
  - parking
  - python
  - r
---
This post might be too easy for any Data-viz people but as a beginner tapping in this area. It took me quite a long time to figure it out so I just want to share this hoping that it might save people&#8217;s time. 

Parking in NYC is really a pain, especially street parking where there&#8217;re lots of signs and regulations. There are some apps on Android and iPhone that you can download and see signs but I haven&#8217;t been able to find the one that suits my needs. I want an application that can tell me where to circle arounds on which day and time to find parking spot. For example, I parked my car on a Tuesday which has street cleaning on Wednesday and Friday from 8:30 to 9:30. That means I have to move the car on Wednesday morning to find a spot for Friday. The problem is I don&#8217;t know what&#8217;s around me. The closest application I find is <http://www.nycparklife.com/streetparker/> which it doesn&#8217;t have Manhattan. 

## Getting the data

So, I googled and thank NYC.gov that provides the [data][1] for us. First, I played around with the csv files but they don&#8217;t have coordinates that I can place location on the map. And I have no experience dealing with shapefiles.

## Extracting the data

After a few hours of mangling and munching the csv with Pandas and R. I would not be able to get the exact locations of all the signs. So I turned to shapefile hoping that I might get lucky. And I found this <http://www.shpescape.com/> which promised to transform shapefile to [Google Fusion Table][2]. Awesome! I went ahead and tried it. It works great! but it only gives you the first 100,000 rows. So dug deeper. After another few hours of googling I found [qGis][3] which is a opensource project that you can use to open and view shapefile. 

Here&#8217;s the example.

[<img src="https://www.noppanit.com/wp-content/uploads/2015/07/Screenshot-2015-07-30-12.52.32.png" alt="Parking signs on Qgis" width="1008" height="734" class="aligncenter size-full wp-image-1466" />][4]

One thing I learnt was that you cannot just click **Open** and choose the file. What you need to do is to <string>Add Vector Layer</strong>. You can use shortcut **Ctrl+Shift+v**

[<img src="https://www.noppanit.com/wp-content/uploads/2015/07/Screenshot-2015-07-30-12.55.56.png" alt="Add Vector Layer" width="1433" height="836" class="aligncenter size-full wp-image-1467" />][5]

## Export to Google Fusion

Now what we need is to import what we have to Google Fusion Table. How are we going to turn this beautiful layer to Google Maps. We need CSV&#8230;

In QGis you can download the file as CSV. It&#8217;s in **Layer > Save As**. You just need to make sure that **Geometry** has to be set so you get the coordinates.

[<img src="https://www.noppanit.com/wp-content/uploads/2015/07/Screenshot-2015-07-30-13.02.06.png" alt="Save to CSV" width="591" height="652" class="aligncenter size-full wp-image-1468" />][6]

## Import to Google Fusion Table

Now we can use that CSV to import to Google Fusion. It would look something like this.

[<img src="https://www.noppanit.com/wp-content/uploads/2015/07/Screenshot-2015-07-30-13.04.35.png" alt="Google Fusion Table" width="1425" height="726" class="aligncenter size-full wp-image-1469" />][7]

what you need to make sure is that you need to specify which fields are Lat, Long so Google can plot that for you.

Here&#8217;s how you do it.

[<img src="https://www.noppanit.com/wp-content/uploads/2015/07/Screenshot-2015-07-30-13.05.41.png" alt="Screenshot 2015-07-30 13.05.41" width="226" height="116" class="aligncenter size-full wp-image-1470" />][8]

The click **change** You will see something like this and you can choose which field you want to be Longitude or Latitude. 

[<img src="https://www.noppanit.com/wp-content/uploads/2015/07/Screenshot-2015-07-30-13.06.33.png" alt="Set Location" width="518" height="673" class="aligncenter size-full wp-image-1471" />][9]

Once the coordinates have set we can go to Map tab and see beautiful little dots that show where all the signs are in NYC.

[<img src="https://www.noppanit.com/wp-content/uploads/2015/07/Screenshot-2015-07-30-13.07.47.png" alt="Parking signs in Google Fusion Table" width="1254" height="736" class="aligncenter size-full wp-image-1472" />][10]. 

Walla! Now you have something you can build an application on top of it. The next post, I will create an application on top of this map to make use of our data. 

## Things I have tried and failed

I&#8217;ve tried using [Proj4][11] on both R and Python to convert X,Y WGS84 to Lat, Long. Here&#8217;s my little snippet.

``` R
data = read.csv('./parking_regulation.csv')

library(proj4)
proj4string <- "+proj=lcc +lat_1=40.66666666666666 +lat_2=41.03333333333333 +lat_0=40.16666666666666 +lon_0=-74 +x_0=300000 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs"
latlong_list<-list()
calculate_long_lat <- function(x,y) {
  
  # Source data
  xy <- data.frame(x=x, y=y)
  
  # Transformed data
  pj <- project(xy, proj4string, inverse=TRUE)
  latlon <- data.frame(lat=pj$y, lon=pj$x)
  latlong_list[['latlong']] <- latlon
}

apply(data[,c('x','y')], 1, function(y) calculate_long_lat(y['x'], y['y']))
```

The result is not quite accurate which I think it&#8217;s because I need to find a correct **proj4string**.

Python has the same wrapper which is quite what I want as well.

``` python
from pyproj import Proj
import pandas as pd

data = pd.read_csv('parking_regulation.csv')

p = Proj(r'+proj=lcc +lat_1=40.66666666666666 +lat_2=41.03333333333333 +lat_0=40.16666666666666 +lon_0=-74 +x_0=300000 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs')

def cal_long_lat(row):
    return p(row['x'], row['y'],inverse=True)

data['lon'], data['lat'] = zip(data.apply (lambda row: cal_long_lat (row),axis=1))
data.head()
```

I will need to learn more about State Pane and what is the correct format.

This article takes 2 pomodoros to complete.

 [1]: http://www.nyc.gov/html/dot/html/about/datafeeds.shtml#parking
 [2]: https://support.google.com/fusiontables/answer/2571232?hl=en
 [3]: http://www.qgis.org/en/site/
 [4]: https://www.noppanit.com/wp-content/uploads/2015/07/Screenshot-2015-07-30-12.52.32.png
 [5]: https://www.noppanit.com/wp-content/uploads/2015/07/Screenshot-2015-07-30-12.55.56.png
 [6]: https://www.noppanit.com/wp-content/uploads/2015/07/Screenshot-2015-07-30-13.02.06.png
 [7]: https://www.noppanit.com/wp-content/uploads/2015/07/Screenshot-2015-07-30-13.04.35.png
 [8]: https://www.noppanit.com/wp-content/uploads/2015/07/Screenshot-2015-07-30-13.05.41.png
 [9]: https://www.noppanit.com/wp-content/uploads/2015/07/Screenshot-2015-07-30-13.06.33.png
 [10]: https://www.noppanit.com/wp-content/uploads/2015/07/Screenshot-2015-07-30-13.07.47.png
 [11]: https://github.com/OSGeo/proj.4
