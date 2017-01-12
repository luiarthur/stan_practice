#include "mcmc.h"

// refer to model3/ purity3.cpp for examples

//[[Rcpp::export]]
NumericMatrix /*fn-name*/(/*fn-args*/ , int mcmc_iterations, int burn, int printEvery) {

  /*fn-pre-computes*/
  //const int N = y.size();

  // preallocate output
  List ret;

  //gibbs
  for (int mcmc_it=0; mcmc_it<mcmc_iterations;  mcmc_it++) {
    /*gibbs-core*/
  } 


  // e.g. NumericMatrix / NumericVector
  /*R-data-struct*/
  // NumericVector out_mu(B);

  // gibbs sampler
  auto samps = gibbs<State>(init, update, B, burn, printEvery);

  for (int i=0; i<B; i++) {
    /*cpp-data-structs-to-r-data-structs*/
    // out_mu[i] = samps.mu[i];
  }

  /*ret-fill*/
  // ret["mu"] = out_mu;

  return ret;
}
