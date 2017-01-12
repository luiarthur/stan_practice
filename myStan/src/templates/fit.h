#include "mcmc.h"

// refer to model3/ purity3.cpp for examples

struct State {
  /*state-core*/
};

//[[Rcpp::export]]
NumericMatrix /*fn-name*/(/*fn-args*/ , int B, int burn, int printEvery) {

  /*fn-pre-computes*/
  //const int N = y.size();

  auto update = [/*update-captures*/] (State& s_old, State& s_new) {
    /*update-core*/
    // update mu
    // s_new.mu = rnorm(0,1)
  };

  // preallocate output
  List ret;

  /*init-state-fields*/
  // double init_mu=0;

  auto init = State {
    /*init-state-core*/
    // init_mu
  };

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
