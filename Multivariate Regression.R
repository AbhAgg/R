#Step 1
#### Load Data 
data = read.csv("D:\\Distance Learning Courses\\Advanced Statistics\\Assignment 1 data.csv",header = TRUE)
attach(data)

#### Check Variable Type
str(data)
#### Converting char variable of Gender Column to Factors
data$gender = factor(data$gender, levels=c("F","M"))




#Step 2
#### Splitting Data into Train-Test 

data1 = subset(data,select = c(gender,age,visit.times,buy))
n = nrow(data1)
trainIndex = sample(1:n, size = round(0.8*n), replace=FALSE)
train = data1[trainIndex ,]
test  = data1[-trainIndex ,]


#Step 3
#### Fit a Logistic Regression Model using training data
model = glm(buy ~ gender + age + visit.times , data = train , family = binomial)

####Model Summary
summary(model)



#Predicting the output using developed model on test data

model_pred_probs = predict(model,test, type = "response")


#Classification/Confusion Matrix

model_pred_buy_nobuy = rep("0",20)
model_pred_buy_nobuy[model_pred_probs>0.5] = "1"

table(model_pred_buy_nobuy,test$buy)


