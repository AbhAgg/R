# Load the database/ dataframe
data(mtcars)

# Displaying the internal structure of the R object mtcars
str(mtcars)

# Get the dimension of the dataframe
dim(mtcars)

# Show data types for each column
sapply(mtcars, class)

# Checking if there are any NULL values
sum(is.na(mtcars))

# Standardizing the variables 
mtcars_standard = scale(mtcars)


# wss = Within Cluster Sum of Squares

# Calculate the total variance for the entire data 
# "apply" function has 3 values data, 1 for Rows,2 for Columns, Function (Variance)
wss = (nrow(mtcars_standard)-1)*sum(apply(mtcars_standard,2,var))

# Calculating variance values for 19 clusters to compare stabilization of sum of squares
for (i in 2:19) wss[i] <- sum(kmeans(mtcars_standard,centers=i)$withinss)
wss

# Plotting sum of squares with respect to No. of Clusters
plot(1:19, wss, type="o", xlab="Number of Clusters",ylab="Within groups sum of squares")

# The sum stabilizes around 7 clusters, so number of clusters will be 7 
# Compute k-means with k = 7
Cluster_Model <- kmeans(mtcars_standard, 7) 

# Computing the mean of each variable by clusters
aggregate(mtcars_standard, by=list(cluster=Cluster_Model$cluster), mean)


# Plotting clusters according to the model calculated above
library(cluster)
clusplot(mtcars_standard, Cluster_Model$cluster, color=TRUE, shade=TRUE, labels=0, lines=0)

