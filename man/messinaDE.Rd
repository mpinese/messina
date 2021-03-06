\name{messinaDE}
\alias{messinaDE}
\title{Detect differential expression in the presence of outliers}
\usage{
messinaDE(x, y, max_misattribution_rate, f_train = 0.9, n_boot = 50,
  seed = NULL, progress = TRUE, silent = FALSE)
}
\arguments{
  \item{max_misattribution_rate}{The maximum allowable
  sample misattribution rate, in [0, 0.5).  Increasing this
  value will increase the algorithm's resistance to
  outliers, at the cost of somewhat reduced sensitivity.
  Note that for values >= 0.95, a conventional statistical
  approach to identifying differential expression (eg.
  t-test) will likely be more powerful than Messina.  See
  details and the vignette for more information on
  selecting this parameter.}

  \item{x}{feature expression values, either supplied as an
  ExpressionSet, or as an object that can be converted to a
  matrix by as.matrix.  In the latter case, features should
  be in rows and samples in columns, with feature names
  taken from the rows of the object.}

  \item{y}{a binary vector (TRUE/FALSE or 1/0) of class
  membership information for each sample in x.}

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
\description{
Run the Messina algorithm to find differentially-expressed
features (eg. genes) in the presence of outliers.
}
\details{
The Messina classification algorithm (see main page at
\code{\link{messina}}) can be adapted to identify
differentially-expressed features in a two-class setting,
with tunable resistance to outliers. This convenience
function simplifies the setting of parameters for this
task.
}
\section{Outlier differential expression}{
  Outliers in differential expression measurements are
  common in many experimental contexts.  They may be due to
  experimental errors, sample misidentification, or the
  presence of unknown structure (eg. disease subtypes) in
  what was supposed to be a homogeneous sample group.  The
  latter two causes are particularly troublesome in
  clinical samples, where diagnoses can be incorrect,
  samples impure, and subtypes common.  The effect of these
  outliers is to inflate within-group variance estimates,
  reducing the power for detecting differential expression.
  Messina provides a principled approach to detecting
  differential expression in datasets containing at most a
  specified level of outlier samples.
}

\section{Misattribution rate}{
  In the Messina framework, for each feature each of the
  two classes of samples is considered to have a typical
  signal level.  Most samples in each class will display
  the level of signal that matches their class, but a small
  number will display a level of signal consistent with the
  \emph{wrong} class.  We call these samples with signal
  matching the wrong class 'misattributed samples'.
  Messina can be tuned to ignore a given rate of sample
  misattribution when detecting differential expression,
  and therefore can be smoothly adjusted to deal with
  varying levels of outlier contamination in an experiment.

  messinaDE assumes that the probability of an outlier
  sample is equal in each of the two classes.  There are
  situations where this assumption is likely incorrect: for
  example, in a cancer vs normal comparison, the normal
  samples are likely to have much more consistent
  expression than the highly perturbed and variable cancer
  samples.  In these cases, the user can call the worker
  function \code{\link{messina}} directly, with min_sens
  and min_spec parameters set appropriately to the expected
  outlier rate in each class.  An example of how to
  calculate the required parameters is given in the
  vignette.
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

## Find differentially-expressed probesets.  Allow a sample misattribution rate of
## at most 20\%.
fit = messinaDE(x, y == "tumor", max_misattribution_rate = 0.2)

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

\code{\link{messina}}

\code{\link{messinaSurv}}
}

