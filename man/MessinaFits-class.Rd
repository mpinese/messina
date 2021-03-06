\docType{class}
\name{MessinaFits-class}
\alias{MessinaFits-class}
\title{The MessinaFits class}
\description{
A class to store the individual messina or messinaSurv fits
to a dataset.
}
\section{Slots}{

\describe{
\item{\code{summary}}{a data frame containing summary performance measures
  for each feature, with features in rows, and columns:
    \describe{
      \item{"passed"}{did this feature pass the user requirements?  A
			boolean.}
      \item{"type"}{the type of classifier that was fit}
      \item{"threshold"}{the threshold expression value of the classifier}
      \item{"posk"}{the direction of the classifier}
      \item{"ptrue"}{the fraction of bootstrap replicates in which a
			classifier was successfully trained.}
      \item{"margin"}{the expression margin of the classifier}
    }}

\item{\code{objective_surfaces}}{a list of length equal to the number of features.
  each list entry contains a data frame of the objective function values
  at each threshold (cutoff) tested.  Currently only populated for
  messinaSurv fits, with columns cutoff, objective.}
}}
\author{
Mark Pinese \email{m.pinese@garvan.org.au}
}
\seealso{
\code{\link{messina}}

\code{\link{messinaSurv}}

\code{\link{MessinaResult-class}}

\code{\link{MessinaParameters-class}}
}

