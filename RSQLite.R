#### Work with a SQLite database in R ############################
# Read data
dataset=read.csv("/yourdirectory/yourfile.csv",skip=1,header=TRUE)
# Create DB
testdb=dbConnect(SQLite(), dbname = "/yourdirectory/testdb.dat")
# Write the data set into a table called table1
dbWriteTable(testdb,"table1",dataset)
# List the tables available in the database
dbListTables(testdb)
# Remove the original data to free up memory
rm(dataset)
# Retrieve the entire table
dbReadTable(testdb,"table1")
# Retrieve the single column called series from the table
buf<-dbSendQuery(testdb,"select series from table1")
testing<-fetch(buf,n=-1); dbClearResult(buf)
dbDisconnect(testdb); rm(buf,testdb)
