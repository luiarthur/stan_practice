data {
  int S;
  int<lower=0> n1[S];
  int<lower=0> N1[S];
  int<lower=0> N0[S];
  real<lower=0> M[S];
}

transformed data {
  real X[S];
  real logM[S];

  for (s in 1:S) {
    X[s] = log(N1[s]) -log(N0[s]);
    logM[s] = log(M[s]);
  }
}

parameters {
  real<lower=0,upper=1> mu;
  real<lower=0> sig;
  real phi[S];
  real<lower=0> m[S];
  real<lower=0,upper=1> v[S];
}

transformed parameters {
  real<lower=0,upper=1> p[S];
  real psi[S];
  real logm[S];

  for (s in 1:S) {
    p[s] = (mu * v[s] * m[s]) / (2*(1-mu) + mu*m[s]);
    psi[s] = log((2*(1-mu)+mu*m[s]) / 2) + phi[s];
    logm[s] = log(m[s]);
  }
}

model {
  for (s in 1:S) {
    n1[s] ~ binomial(N1[s],p[s]);
    X[s] ~ normal(psi[s],sig);
    logM[s] ~ normal(logm[s],.1);
  }
}
