# package for data manipulation
install.packages("tidyverse")
# Activate the package
library(tidyverse)

data("iris")# import data set
view(iris)# visualize data

# use filter function----

?filter
# variable is filtered on the basis of specific data
a<- filter(iris, Species=="setosa")
#variable is filtered on the basis mutiple arugments
b<- filter(iris, Sepal.Width>3.0,Species=="versicolor")

# use select function----

?select # help of select function

# %>% , this pipe operate, function of tidyverse used to continue/connect codes 

# To select specific columns/variables
d<- iris %>% select(Petal.Length,Species) 

# another way to above command
e <-iris %>%  select(2:3)

# Select variables/columns start with particular alphabet
f <- iris %>% select(starts_with(c("S","P")))

# select variable/columns that contain "P" in their names
g<-  iris %>% select(contains("P"))

# when specific variable comes first from rest of variables
h<- iris %>% select( Species,everything())

# to remove particular variables from data frame
m<- iris %>% select(-Sepal.Width)
# use arrange function----

n<- iris %>% 
  arrange(Petal.Length)# Arrange petal.length in ascending order

p<- iris %>% 
  arrange(Species,Sepal.Length)# arrange (species and sepal legth) in increasing order

q<- iris %>% 
  arrange(desc(Petal.Width))# arrange petal.width variable in decreasing order

# use mutate function----

?mutate
r<- iris %>% 
  mutate(Sepal.Legth_cm= 100 * Sepal.Length)# change/create new variable with specific instruction 

q<-  iris %>%
  select(Petal.Length, Petal.Width) %>%
  mutate(Petal.Length2 = Petal.Length * 2,
         Peta.Length2_squared = Petal.Length * Petal.Length)# both select and mutate function is used 

s<- iris %>% mutate(ratio_of_S_length_S_width  = Sepal.Length/Sepal.Width)

w<- iris %>%
  select(Sepal.Length, Sepal.Width, Species) %>%
  mutate(across(Species, as.factor)) # change the Species variable from character to factor data type
tibble(w)

#watch out for other smaller verbs 

?slice_max

?bind_rows

?left_join

?rename

?case_when

# use group_by function----

iris %>% 
  group_by(Species) %>% 
  summarise(mean(Sepal.Length)) # grouping the species and find its mean value of Sepal.Length

iris %>% 
  group_by(Species) %>% 
  summarise(avg_sepal_length= mean(Sepal.Length),
            sd_sepal_width=sd(Sepal.Width),
            count=n()) # finding average of Sepal.Length and standard deviation of Sepal>width














