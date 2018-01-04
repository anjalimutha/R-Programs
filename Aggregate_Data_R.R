#open data 
data(stulevel)
# Average ability for all students
stulevel_agg_1<- mean(stulevel$ability, na.rm=TRUE)
# Show results
stulevel_agg_1

# Convert stulevel to data table
stulevel <- data.table(stulevel)
# Declare which variable you want to group on (optional).
# List the name of the data table first, then the name of the field(s).
setkey(stulevel, grade)
# Average ability by grade
stulevel_agg_2 <- as.data.frame(stulevel[, mean(ability, na.rm = TRUE),by = grade])
# Show results
stulevel_agg_2

# Average ability by grade
stulevel_agg_3 <- as.data.frame(stulevel[, j=list(mean(ability, na.rm = TRUE),mean(attday, na.rm = TRUE)),by = grade])
# Show results
stulevel_agg_3

# Average ability by grade
stulevel_agg_4 <- as.data.frame(stulevel[, j=list(mean(ability, na.rm = TRUE),mean(attday, na.rm = TRUE)),by = list(year,grade)])
# Show results
stulevel_agg_4

# Average ability by grade and rename
stulevel_agg_5 <- as.data.frame(stulevel[, j=list(mean_ability = mean(ability, na.rm = TRUE), mean_attendance = mean(attday, na.rm = TRUE)), by = list(year,grade)])
# Show results
stulevel_agg_5
