
## Investigate data --------------------------------
head(mtcars)



## Build model -----------------------------------------------
#make appropriate variables factors
mtcars <- mtcars %>%
  mutate(across(c("cyl", "vs", "am", "carb"), as.factor))
str(mtcars)

#model
mod1 <- lm( RESPONSE.VARIABLE ~  PREDICTOR1 + PREDICTOR2 +    ,data = Carseats)



## Inspect results ------------------------------------------
summary(mod1)
mod1$coefficients

