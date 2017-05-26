# VA Car Crashes 
Dynamic visualization of crashes in virginia 2011-2015

## How to use
Go to www.github.io/tylerhutcherson/VACrashes. 
Due to the raw size of the data, it takes a few seconds for the page to load. 

### The Filter Grid
Once the small map of crashes is plotted to the right, it is ready to be explored. 
Select a bubble in the grid to filter the full data by occurence of various factors. 
The user may switch which categorical variables used to filter the map with the drop down lists. 
The size of each bubble represents the total number of crashes that occured in that "slice".  
For example, one may wish to see where crashes occured involving dark road conditions and alcohol consumption.  
Make a selection by clicking on a bubble.  Upon click, the user should see a number printed at the top of the screen for the total crashes in the datum.  
A sentence underneath the map will pop up describing more relevant details.

### The Map
Use the slider to select different years of data. One draw back of this design is that it uses only a subset of the data.  The full data could not be loaded due to size and d3 limitations.
Everytime the slider is changed, the map redraws.  This is another piece of functionality I would like to update.  Help and suggestions welcome!

## Resources
University of Virginia Data Science Institute 2017
Paper: Mixed Linear Modeling Techniques for Predicting Fatalities in Vehicle Crashes (Ge, Hutcherson, Tang, Qu 2017)
Virginia Department of Motor Vehicles
