\docType{class}
\name{MessinaParameters-class}
\alias{MessinaParameters-class}
\title{The MessinaParameters class}
\description{
A class to store the parameters supplied to a messina or
messinaSurv
}
\section{Slots}{

\describe{
\item{\code{x}}{a matrix of expression values supplied to the messina or
  messinaSurv functions.  Features are in rows, samples in columns.}

\item{\code{y}}{either a vector of class membership indicators (0/1 or TRUE/FALSE),
  for the messina case, or a Surv object for the messinaSurv case.  In
  either case, each entry of y should match the corresponding sample
  column of x.}

\item{\code{features}}{a character vector of feature ids, matching the rows of x.}

\item{\code{samples}}{a character vector of sample ids, matching the columns of x
  and entries of y.}

\item{\code{perf_requirement}}{a list of performance requirements.  For messina
  results, contains named entries "min_sensitivity" and "min_specificity".
  For messinaSurv results, contains named entries "objective_type" and
  "min_objective".}

\item{\code{minimum_group_fraction}}{the size, relative to the full sample size, of
  the smallest subgroup that may be defined by a threshold.}

\item{\code{training_fraction}}{the fraction of samples used for training in each
  bootstrap round.}

\item{\code{num_bootstraps}}{the number of bootstrap iterations to perform.}

\item{\code{prng_seed}}{the PRNG seed used to initialize the PRNG before analysis.}
}}
\author{
Mark Pinese \email{m.pinese@garvan.org.au}
}
\seealso{
\code{\link{messina}}

\code{\link{messinaSurv}}

\code{\link{MessinaResult-class}}
}

