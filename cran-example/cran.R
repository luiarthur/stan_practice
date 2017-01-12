library(rstan)
library(rcommon)

code <- "
data {
  int<lower=0> N;
  real y[N];
}
parameters {
  real mu;
  real<lower=0> sig2;
}
model {
  target += normal_lpdf(mu | 0, 10);     // prior for mu
  target += inv_gamma_lpdf(sig2 | 2, 1); // prior for sig2
  target += normal_lpdf(y | mu, sig2);   // likelihood
}
"

dat <- list(N = 100, y = rnorm(100,0,2))

system.time(
  fit <- stan(model_code=code, data=dat, iter=2000, chains=4)
)

print(fit)
traceplot(fit)

# extract samples
e <- extract(fit, permuted = TRUE) # return a list of arrays
e <- extract(fit) # return a list of arrays

plotPosts(cbind(e$mu,e$sig2))
