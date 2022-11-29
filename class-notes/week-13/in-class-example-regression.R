
## Investigate data --------------------------------
?mtcars
head(mtcars)
str(mtcars)



## Build model -----------------------------------------------
#make appropriate variables factors
mtcars <- mtcars %>%
  mutate(across(c("cyl", "vs", "am", "carb"), as.factor))
str(mtcars)

#model
mod1 <- lm( qsec ~  vs + wt + hp +cyl, data = mtcars)

## Inspect results ------------------------------------------
summary(mod1)
mod1$coefficients
mod1$residuals
mod1$fitted.values



#### In class model 

# response  = weight 
# predictors = engine, transmission, cylinders, carborators 


mod2 <- lm(wt ~ vs + am + cyl + carb, data = mtcars)
summary(mod2)


#### All variables 


mod3 <- lm( wt ~ ., data = mtcars)
summary(mod3)


#### Regression Trees 

mod1.tree <- rpart( qsec ~  vs + wt + hp +cyl, data = mtcars)
prp(mod1.tree)

