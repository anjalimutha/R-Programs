#basic function in R

#setting a seed to make a random sample reproducible.You can choose any number.
set.seed(65)
#random number generator with arguments on uniform distribution
runif(n=9,min=3,max=6)

set.seed(65)
#without argument name
runif(9,3,6)

set.seed(65)
#using only first argument
runif(3)

set.seed(65)
#random number generator with arguments on normal distribution
rnorm(9,6,4)


