library(rstan)
library(rcommon)
source("gendata.R")
source("plotPurity.R")


dat <- genData(phi_mean=0,phi_var=1,mu=.7,sig=1,
               meanN0=30,minM=0,maxM=5,c=.5,
               w2=.01, set_v=c(.1,.5,.9), numLoci=100)
dat$obs$S <- length(dat$obs$M)

system.time(
  fit <- stan(file="purity.stan", data=dat$obs, 
              iter=2000, chains=1)
)

print(fit)
traceplot(fit)

# extract samples
e <- extract(fit) # return a list of arrays

plotPost(e$mu)
plotPost(e$phi)
plot(dat$param$phi,apply(e$phi,2,mean))
