\name{messina}
\alias{messina}
\title{Find optimal single feature classifiers}
\usage{
messina(x, y, min_sens, min_spec, f_train = 0.9, n_boot = 50, seed = NULL,
  progress = TRUE, silent = FALSE)
}
\arguments{
  \item{x}{feature expression values, either supplied as an
  ExpressionSet, or as an object that can be converted to a
  matrix by as.matrix.  In the latter case, features should
  be in rows and samples in columns, with feature names
  taken from the rows of the object.}

  \item{y}{a binary vector (TRUE/FALSE or 1/0) of class
  membership information for each sample in x.}

  \item{min_sens}{the minimum acceptable sensitivity that a
  classifier separating the two groups of y must achieve.}

  \item{min_spec}{the minimum acceptable specificity that a
  classifier separating the two groups of y must achieve.}

  \item{f_train}{the fraction of samples to be used in the
  training splits of the bootstrap rounds.}

  \item{n_boot}{the number of bootstrap rounds to use.}

  \item{seed}{an optional random seed for the analysis.  If
  NULL, a random seed derived from the current state of the
  PRNG is used.}

  \item{progress}{display a progress bar tracking the
  computation?}

  \item{silent}{be completely silent (except for error and
  warning messages)?}
}
\value{
an object of class "MessinaClassResult" containing the
results of the analysis.
}
\description{
Run the Messina algorithm to find features (eg. genes) that
optimally distinguish between two classes of samples,
subject to minimum performance requirements.
}
\details{
Note: If you wish to use Messina to detect differential
expression, and not construct classifiers, you may find the
\code{\link{messinaDE}} function to be a more convenient
interface.

Messina constructs single-feature threshold classifiers
(see below) to separate two sample groups, that are in a
sense the most robust single-gene classifiers that satisfy
user-supplied performance requirements.  It accepts as
primary input a matrix or ExpressionSet of feature data x;
a vector of sample class membership y; and minimum
classifier target performance values min_sens, and
min_spec.  Messina then examines each feature of x in turn,
and attempts to build a threshold classifier that satisfies
the minimum performance requirements, based on that
feature.  The results of this classifier training and
testing are then returned in a MessinaClassResult object.

The features measured in x must be numeric and contain no
missing values, but apart from that are unrestricted --
common use cases are mRNA measurements and protein
abundance estimates.  Messina is not sensitive to the data
transformation used, although for mRNA abundance
measurements a log-transform or similar is suggested to aid
interpretability of the results.  x containing discrete
values can also be examined by Messina, though if the
number of possible values of the members of x is very low,
the algorithm is unlikely to be very powerful.
}
\section{Threshold classifiers}{
  Messina trains single-feature threshold classifiers.
  These are classifiers that place unknown samples into one
  of two groups, based on whether the sample's measurement
  for a given feature is above or below a constant
  threshold value.  They are the one-dimensional version of
  support vector machines (SVMs), where in this case the
  feature set is one-dimensional, and the 'support vector'
  (the threshold) is a zero-dimensional point.  Threshold
  classifiers are defined by two properties: their
  threshold value, and their direction, which is the class
  assigned if a sample's measurement exceeds the threshold.
}
\examples{
## Load some example data
library(antiProfilesData)
data(apColonData)

x = exprs(apColonData)
y = pData(apColonData)$SubType

## Subset the data to only tumour and normal samples
sel = y \%in\% c("normal", "tumor")
x = x[,sel]
y = y[sel]

## Run Messina to rank probesets on their classification ability, with
## classifiers needing to meet a minimum sensitivity of 0.95, and minimum
## specificity of 0.85.
fit = messina(x, y == "tumor", min_sens = 0.95, min_spec = 0.85)

## Display the results.
fit
plot(fit)
}
\author{
Mark Pinese \email{m.pinese@garvan.org.au}
}
\references{
Pinese M, Scarlett CJ, Kench JG, et al. (2009) Messina: A
Novel Analysis Tool to Identify Biologically Relevant
Molecules in Disease.  PLoS ONE 4(4): e5337.
\url{doi:10.1371/journal.pone.0005337}
}
\seealso{
\code{\link{MessinaClassResult-class}}

\code{\link[Biobase]{ExpressionSet}}

\code{\link{messinaDE}}

\code{\link{messinaSurv}}
}

