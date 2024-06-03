#dataset dahil edildi
dataset=read.csv("Salary_Data.csv")

#dataset egtim ve test seti olmak uzere 2 parcaya ayrildi
library(caTools)
set.seed(123)
split=sample.split(dataset$Salary,SplitRatio = 2/3)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)



############
regressor=lm(formula = Salary ~ YearsExperience,
             data = training_set)
#summary(regressor) ile detaylara ulasabiliriz


y_pred=predict(regressor,newdata = test_set)



library(ggplot2)

ggplot() +
        geom_point(aes(x = training_set$YearsExperience,y = training_set$Salary),
                      colour="red") +
        geom_line(aes(x = training_set$YearsExperience,y =predict(regressor,newdata = training_set) ),
                  colur="blue")   +
        ggtitle("Salary vs Experience (Training set)") + 
        xlab("Years  of experience ") +
        ylab("Sallary")


ggplot() +
  geom_point(aes(x = test_set$YearsExperience,y = test_set$Salary),
             colour="red") +
  geom_line(aes(x = training_set$YearsExperience,y =predict(regressor,newdata = training_set) ),
            colur="blue")   +
  ggtitle("Salary vs Experience ( test set)") + 
  xlab("Years  of experience ") +
  ylab("Sallary")



