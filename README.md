# dsba5122_FinalProject

Purpose:
This project designed a shiny app application based on the recently released US College data.  The purpose of the tool was to provide parents and their children a means to make inform designs about a career path.  The tool specifically tries to answer the question of the best institution in the united states when cost and potential earnings are taken into consideration.

Design:
When the tool is launched, the side bar on the left provides customizable filteres that a user modifies to describe their desired seach.  The initial launch of the application gives the 10 best programs in the US with the best earning to cost ratios.  
  1.  Course Of Study :  A multiple selection list for the program or course of study.  It contains a list of all the
      available programs on the dataset.  A user can select more than one at a time or click
      "ALL".
  2.  Number Of Top Colleges To Display:   Slider to determine the ranking limits.  The top N schools that
                                          meet all criteria.
  3.  Rank By: How programs/colleges are ranked.  
  4.  Choose which Degree(s) to Rank:  A  checkbox with multiple selects to limit the type of college degree. 
  5.  Select A State:  A multiple Selection list containing all US states.
  6.  Select A US Region:  A multiple Selection list of predetermined US Regions.  When a state is already selected, the data
                          is combined with regional data.
  7.  Select Range of College Cost:  Slider that limits the cost to attend an institution.  The range was determined from all
                                    available data.
  8.  Select Range of College Earning:  Slider that limits the potential earning.  The range was determined from all available
                                        data.
  9.  Map: Leaflet map with ploted location of ranked colleges
  10. Histogram:  geom_bar plot of ranked colleges.
  11. Table:  DT table containing data of ranked colleges
                                        
  Data issues:
  The first issue had to do with the cost of attendance.  The dataset used did not have course/program specific cost.  It would have been nice to have this rather than the average cost to attend said college.   However, it should be easy to incorporate if available.
  
  No way of knowing how earnings was determined.  Was it the first job earnings?
  
  Some schools did not report data or choose to keep their data private.  These colleges were removed from the dataset.   College with no earning data were automatically removed.  Cost was set to zero for colleges with no cost data but had earning data.
  
  HOW TO BUILD:
  1.  Download all Files.
  2.  Get RStudio or any development environment that allows the execution of Shiny applications
  3.  Create a Directory called "DATA"
  4.  Unzip the files Most-Recent-Field-Data-Elements.csv.zip and Most-Recent-Cohorts-All-Data-Elements.csv.zip and move their       contents to the "DATA" directory
  5.  If RStudio makes sure the follow libraries have been installed:
      library(shiny)
library(data.table)
library(maps)
library(ggplot2)
library(tidyverse)
library(ggrepel)
library(scales)
library(DT)
library(plotly)
library(leaflet)
library(shinythemes)
library(rsconnect)
library(shinydashboard)
library(unrtf)
  6.  Run the shiny application.
      R -e "shiny::runApp('~/app')"
      By default runApp starts the application on a randomly selected port. For example, it might start on port 4700, in 	which case you can connect to the running application by navigating your browser to http://localhost:4700.
  
  DATASET STRUCTURE US_TUITION:

 UNITID	          Min.   :100654  
		  1st Qu.:155681  
		  Median :198464  
		  Mean   :231425  
		  3rd Qu.:236212  
		  Max.   :491303  
		  
CITY	          Length:43878      
              	  Class :character  
                  Mode  :character  
		  
STATE	          Length:43878      
	          Class :character  
                  Mode  :character  
		  
ZIP	          Length:43878      
 		  Class :character  
 		  Mode  :character
		  
REGION_CD	  Min.   :1.000  
                  1st Qu.:3.000  
                  Median :5.000  
                  Mean   :4.435  
                  3rd Qu.:6.000  
                  Max.   :9.000 
		  
LONGITUDE	  Min.   :-159.40  
                  1st Qu.: -96.80  
                  Median : -86.16  
                  Mean   : -90.13  
                  3rd Qu.: -78.87  
                  Max.   : 145.72 
		  
LATITUDE	  Min.   :13.43  
                  1st Qu.:34.06  
                  Median :39.25  
                  Mean   :37.87  
                  3rd Qu.:41.65  
                  Max.   :64.86
		  
COST	Min.   : 6276  
		  1st Qu.:19055  
		  Median :24064  
		  Mean   :28555  
		  3rd Qu.:33232  
		  Max.   :72717  
		  NA's   :6782 
		  
REGION	Length:43878      
		  Class :character  
		  Mode  :character
		  
COLLEGE	Length:43878      
		  Class :character  
		  Mode  :character 
		  
CIPCODE	Length:43878      
		  Class :character  
		  Mode  :character  
		  
COURSE	Length:43878      
		  Class :character  
		  Mode  :character 
		  
CREDLEV	          Min.   :1.000  
		  1st Qu.:2.000  
		  Median :3.000  
		  Mean   :3.046  
		  3rd Qu.:3.000  
		  Max.   :8.000  
		  
DEGREE	          Length:43878      
		  Class :character  
		  Mode  :character 
		  
MID_EARNING	  Min.   :  2700  
		  1st Qu.: 26700  
		  Median : 35500  
		  Mean   : 40060  
		  3rd Qu.: 49500  
		  Max.   :231200 
		  
COST_TO_EARNING	  Min.   : 0.0807  
		  1st Qu.: 1.0000  
		  Median : 1.3332  
		  Mean   : 1.6387  
		  3rd Qu.: 2.0519  
		  Max.   :10.4099 
		  
EARND	          Length:43878      
		  Class :character  
		  Mode  :character 
		  
COSTD	          Length:43878      
		  Class :character  
		  Mode  :character 
		  
COSTEARNP	  Length:43878      
		  Class :character  
		  Mode  :character  
		  

  
  
  
