\docType{class}
\name{MessinaResult-class}
\alias{MessinaClassResult-class}
\alias{MessinaResult-class}
\alias{MessinaSurvResult-class}
\title{The MessinaResult class}
\description{
A class to store the results of a messina or messinaSurv
analysis.
}
\section{Slots}{

\describe{
\item{\code{problem_type}}{A character string naming the variant of the messina
  algorithm used, either "classification" for the classification case
  (fit using the function messina), or "survival" for the outcome case
  (fit using the function messinaSurv).}

\item{\code{parameters}}{An object of class MessinaParameters, containing
  input data and parameters for the algorithm.}

\item{\code{perf_estimates}}{A data frame of summary performance estimates
  (evaluated on many out-of-bag sample draws), with one row per feature
  in the data matrix supplied to the fit functions (either messina or
  messinaSurv).  For a messina fit, this contains 10 columns:
  Mean TPR, Mean FPR, Mean TNR, Mean FNR, Variance of TPR, Variance
  of FPR, Variance of TNR, Variance of FNR, Mean sensitivity, Mean
  specificity.  For a messinaSurv fit, this contains a single column,
  of the mean objective value for that row's feature.}

\item{\code{fits}}{An object of class MessinaFits, containing details of the
  fits for each feature.}
}}
\author{
Mark Pinese \email{m.pinese@garvan.org.au}
}
\seealso{
\code{\link{messina}}

\code{\link{messinaSurv}}

\code{\link{MessinaParameters-class}}

\code{\link{MessinaFits-class}}
}

