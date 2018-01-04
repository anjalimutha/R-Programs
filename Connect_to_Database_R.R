# Create a connection to the database called "channel"
# If you are using operating system authentication (the computer already knows who you
# are because you are logged into it) you can leave out the uid="USERNAME", part.
channel <- odbcConnect("DATABASE", uid="USERNAME", pwd="PASSWORD", believeNRows=FALSE)

# Check that connection is working (Optional)
odbcGetInfo(channel)

# Find out what tables are available (Optional)
Tables <- sqlTables(channel, schema="SCHEMA")

# Query the database and put the results into the data frame "dataframe"
dataframe <- sqlQuery(channel, "
                      SELECT *
                      FROM
                      SCHEMA.DATATABLE")

# Find out what fields are available in the table (Optional)
# as.data.frame coerces the data into a data frame for easy viewing
Columns <- as.data.frame(colnames(sqlFetch(channel, "SCHEMA.DATATABLE")))

# Query the database and put the results into the data frame "dataframe"
dataframe <- sqlQuery(channel, "
                      SELECT SCHOOL,
                      STUDENT_NAME
                      FROM
                      SCHEMA.DATATABLE")

# Query the database and put the results into the data frame "dataframe"
dataframe <- sqlQuery(channel, "
                      SELECT SCHOOL,
                      STUDENT_NAME
                      FROM
                      SCHEMA.DATATABLE
                      WHERE
                      SCHOOL_YEAR='2011-12'")

# Query the database and put the results into the data frame "dataframe"
dataframe <- sqlQuery(channel, "
 SELECT
 DT.SCHOOL_YEAR,
 DTTWO.DISTRICT_NAME AS DISTRICT,
 DTTWO.SCHOOL_NAME AS SCHOOL,
 DT.GRADE_LEVEL AS GRADE,
 DT.ACTL_ATT_DAYS AS ACTUAL_DAYS,
 DT.POSS_ATT_DAYS AS POSSIBLE_DAYS
 FROM
 (SCHEMA.DATATABLE DT INNER JOIN SCHEMA.DATATABLE_TWO DTTWO
 ON (DT.SCHOOL_YEAR = DTTWO.SCHOOL_YEAR AND
 DT.SCHOOL_NUMBER = DTTWO.SCHOOL_CODE))
 WHERE
 DT.SCHOOL_YEAR = '2011-12' AND
 DTTWO.SCHOOL_NAME = 'Pine Tree Elementary School'")

# Parameter
YEAR <- "2010-11"

# Query the database and put the results into the data frame "dataframe"
dataframe <- sqlQuery(channel, paste("
                                     SELECT
                                     YEAR,
                                     SCHOOL_YEAR,
                                     DISTRICT_CODE,
                                     GRADE_LEVEL
                                     FROM SCHEMA.DATATABLE
                                     WHERE
                                     ((SCHEMA.DATATABLE.SCHOOL_YEAR='", YEAR, "'))
                                     ", sep=""
))

# Parameter
YEARS <- c("2012", "2013", "2014")

# Query the database and put the results into the data frame "dataframe"
dataframe <- sqlQuery(channel, paste("SELECT 
                                     YEAR,
                                     SCHOOL_YEAR,
                                     DISTRICT_CODE,
                                     GRADE_LEVEL
                                     FROM SCHEMA.DATATABLE 
                                     WHERE SCHEMA.DATATABLE.SCHOOL_YEAR IN ('", paste(YEARS, collapse = "', '"), "') 
                                     ", sep=""))

sqlGetResults(channel)
sqlTables(channel)
