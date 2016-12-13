## Course: Exploratory Data Analysis (https://class.coursera.org/exdata-032)
## Assignment: Course Project 2
## Himanshu Amin
## Question:
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.


# Read PM2.5 emissions dataset
emissions.df <- readRDS('/Users/hamin100/Documents/DataScienceWorkspace/assignment_3/data/summarySCC_PM25.rds')

# Read emission source classification dataset
scc.df <- readRDS('/Users/hamin100/Documents/DataScienceWorkspace/assignment_3/data/Source_Classification_Code.rds')


# Get the emissions in Baltimore City
baltimore.emissions.df = emissions.df[emissions.df$fips == '24510', ]

# Get the total emissions in Baltimore City by year
baltimore.emission.totals.by.year <- aggregate(Emissions ~ year, data = baltimore.emissions.df, FUN = sum)


# Open png device
png(filename='~/Users/hamin100/Documents/DataScienceWorkspace/assignment_3/data/plot2.png', width=480, height=480, units='px')

# Print numeric values in fixed notation
options(scipen=10)

with(baltimore.emission.totals.by.year, {
  plot(year, Emissions, type = 'b',
       xlab="Year",
       ylab='PM2.5 Emissions (tons)',
       main='Total PM2.5 Emissions in Baltimore City')
})

# Close png device
dev.off()