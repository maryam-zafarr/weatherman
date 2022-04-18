# Weatherman
Ruby application to generate weather reports

**1. For a given year display the highest temperature and day, lowest temperature and day, most humid day and humidity.**
```
ruby weatherman.rb -e 2007 /path/to/filesFolder
Highest: 45C on June 23 
Lowest: 01C on December 22 
Humid: 95% on August 14
```

**2. For a given month display the average highest temperature, average lowest temperature, average humidity.**
```
ruby weatherman.rb -a 2007/11 /path/to/files
Highest Average: 39C 
Lowest Average: 18C 
Average Humidity: 71%
```

**3.  For a given month draw two horizontal bar charts on the console for the highest and lowest temperature on each day. Highest in red and lowest in blue.**
```
ruby weatherman.rb -c 2007/11 /path/to/files
March 2011
01 +++++++++++++++++++++++++ 25C 
01 +++++++++++ 11C
```
**4. Bonus Task.  For a given month draw one horizontal bar chart on the console for the highest and lowest temperature on each day. Highest in red and lowest in blue.**
```
ruby weatherman.rb -c 2007/11 /path/to/files
March 2011
01 +++++++++++++++++++++++++++++++++++ 11C - 25C
02 +++++++++++++++++++++++++++++ 08C - 22C
```
