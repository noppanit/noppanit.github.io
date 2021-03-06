---
title: Maps all parking signs in NYC.
comments: true
author: Noppanit Charassinvichai
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

{% img /wp-content/uploads/2015/07/Screenshot-2015-07-30-12.52.32.jpg Parking signs on Qgis %}

One thing I learnt was that you cannot just click **Open** and choose the file. What you need to do is to <string>Add Vector Layer</strong>. You can use shortcut **Ctrl+Shift+v**

{% img /wp-content/uploads/2015/07/Screenshot-2015-07-30-12.55.56.jpg Add Vector Layer %}

## Export to Google Fusion

Now what we need is to import what we have to Google Fusion Table. How are we going to turn this beautiful layer to Google Maps. We need CSV&#8230;

In QGis you can download the file as CSV. It&#8217;s in **Layer > Save As**. You just need to make sure that **Geometry** has to be set so you get the coordinates.

{% img /wp-content/uploads/2015/07/Screenshot-2015-07-30-13.02.06.jpg Save to CSV %}

## Import to Google Fusion Table

Now we can use that CSV to import to Google Fusion. It would look something like this.

{% img /wp-content/uploads/2015/07/Screenshot-2015-07-30-13.04.35.jpg Google Fusion Table %}

what you need to make sure is that you need to specify which fields are Lat, Long so Google can plot that for you.

Here&#8217;s how you do it.

{% img /wp-content/uploads/2015/07/Screenshot-2015-07-30-13.05.41.jpg %}

The click **change** You will see something like this and you can choose which field you want to be Longitude or Latitude. 

{% img /wp-content/uploads/2015/07/Screenshot-2015-07-30-13.06.33.jpg Set Location %}

Once the coordinates have set we can go to Map tab and see beautiful little dots that show where all the signs are in NYC.

{% img /wp-content/uploads/2015/07/Screenshot-2015-07-30-13.07.47.jpg Parking signs in Google Fusion Table %}

Walla! Now you have something you can build an application on top of it. The next post, I will create an application on top of this map to make use of our data. 

## Things I have tried and failed

I&#8217;ve tried using [Proj4][11] on both R and Python to convert X,Y WGS84 to Lat, Long. Here&#8217;s my little snippet.

``` plain

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

{% codeblock python %}
from pyproj import Proj
import pandas as pd

data = pd.read_csv('parking_regulation.csv')

p = Proj(r'+proj=lcc +lat_1=40.66666666666666 +lat_2=41.03333333333333 +lat_0=40.16666666666666 +lon_0=-74 +x_0=300000 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs')

def cal_long_lat(row):
    return p(row['x'], row['y'],inverse=True)

data['lon'], data['lat'] = zip(data.apply (lambda row: cal_long_lat (row),axis=1))
data.head()
{% endcodeblock %}

I will need to learn more about State Pane and what is the correct format.

This article takes 2 pomodoros to complete.

 [1]: http://www.nyc.gov/html/dot/html/about/datafeeds.shtml#parking
 [2]: https://support.google.com/fusiontables/answer/2571232?hl=en
 [3]: http://www.qgis.org/en/site/
 [11]: https://github.com/OSGeo/proj.4
