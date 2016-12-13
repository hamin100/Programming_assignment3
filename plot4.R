## Course: Exploratory Data Analysis (https://class.coursera.org/exdata-032)
## Assignment: Course Project 2
## Himanshu Amin
## Question:
## Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?


# Read PM2.5 emissions dataset
emissions.df <- readRDS('/Users/hamin100/Documents/DataScienceWorkspace/assignment_3/data/summarySCC_PM25.rds')

# Read emission source classification dataset
scc.df <- readRDS('/Users/hamin100/Documents/DataScienceWorkspace/assignment_3/data/Source_Classification_Code.rds')


# Get the coal combustion-related sources
# Use the 'Short.Name' field to find the coal combustion-related sources
scc.coal.df <- scc.df[grep('coal', scc.df$Short.Name), ]

# Get the emissions from coal combustion-related sources
coal.emissions.df <- emissions.df[emissions.df$SCC %in% scc.coal.df$SCC, ]
# Get the total emissions from coal combustion-related sources by year
coal.emissions.by.year.df <- aggregate(Emissions ~ year, data = coal.emissions.df, FUN = sum)


# Open png device
png(filename='~/Users/hamin100/Documents/DataScienceWorkspace/assignment_3/data/plot4.png', width=480, height=480, units='px')

# Print numeric values in fixed notation
options(scipen=10)

with(coal.emissions.by.year.df, {
  plot(year, Emissions, type = 'b',
       xlab="Year",
       ylab='PM2.5 Emissions (tons)',
       main='PM2.5 Emissions from coal combustion sources in U.S.A.')
})

# Close png device
dev.off()