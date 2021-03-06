\docType{methods}
\name{plot,MessinaSurvResult,missing-method}
\alias{plot,MessinaSurvResult,missing-method}
\alias{plot,MessinaSurvResult-method}
\title{Plot the results of a Messina analysis on a survival problem.}
\usage{
\S4method{plot}{MessinaSurvResult,missing}(x, y, ...)
}
\arguments{
  \item{x}{the result of a Messina survival analysis, as
  returned by \code{\link{messinaSurv}}.}

  \item{...}{additional options to control the plot:
  \describe{ \item{\code{indices}}{a vector of indices of
  features to plot.  If sort_features == FALSE, the indices
  are into the unsorted features, as originally supplied in
  x supplied to messinaSurv.  If sort_features == TRUE,
  features are first sorted in order of decreasing margin,
  and then the indices in this parameter are plotted.  For
  example, if indices == 2 and sort_features == FALSE, the
  second feature in x will be plotted.  However, if
  sort_features == TRUE, the feature with the second best
  classifier margin will be plotted.}
  \item{\code{sort_features}}{a boolean indicating whether
  to sort features by decreasing margin size before
  selecting from indices.  This affects the interpretation
  of the parameter 'indices'; for more details see the
  description of that parameter.}
  \item{\code{bootstrap_type}}{a string giving the type of
  bootstrap error band to produce on the survival
  prediction plots.  Can take three values: "none",
  "stdev", and "ci".  "none", the default, plots no error
  bands.  "stdev" performs multiple rounds of Kaplan-Meier
  curve estimation on bootstrap samples, and plots
  prediction bands corresponding to +/- 1 bootstrap
  standard deviation from the mean.  "ci" performs
  bootstrapping as per "stdev", and plots prediction bands
  corresponding to the bootstrap_ci intervals.}
  \item{\code{bootstrap_ci}}{a value in (0.5, 1) giving the
  confidence interval for bootstrap_type == "ci".  Ignored
  otherwise.  Default 0.9 for 90\% confidence intervals.}
  \item{\code{nboot}}{the number of bootstrap iterations to
  perform for calculations.  Set to a reasonable default
  taking into account bootstrap_type and bootstrap_ci, so
  ordinarily does not need to be specified by the user.}
  \item{\code{parallel}}{a logical indicating whether
  multiprocessing using doMC should be used for the
  bootstrap calculations.  If NULL, multiprocessing will be
  used if doMC is loaded and more than one parallel worker
  is registered.} }}

  \item{y}{the y coordinates of points in the plot,
  \emph{optional} if \code{x} is an appropriate structure.}
}
\description{
Plots diagnostic and performance information for fits in a
MessinaSurvResult object, as returned by
\code{\link{messinaSurv}}.
}
\details{
For each feature index given by indices, produces four
plots: \describe{ \item{"Objective function"}{A plot of the
value of the objective function over all possible
thresholds.  Each sample is represented by a point on the
objective function trace.  The selected threshold, if any,
is shown by a solid vertical line, and the margins by
dotted vertical lines on either side of it.  The minimum
values of the objective function specified by the user are
shown as horizontal dotted lines.  This plot is useful for
assessing fit stability, particularly for the "coxcoef" and
"reltau" objective functions, which can be unstable at low
or high threshold values.  See \code{\link{messinaSurv}}
for details.} \item{"Separation performance at
threshold"}{This Kaplan-Meier plot shows two traces,
showing the outcomes of the two subgroups in the cohort
defined by whether the plotted feature is above or below
the threshold.  Optionally (if bootstrap_type != "none"),
the KM traces will be surrounded by shaded regions that
represent either +/- 1 SD (bootstrap_type == "stdev") or a
bootstrap_ci confidence interval (bootstrap_type == "ci").}
\item{"Separation performance at lower margin"}{This plot
is identical to the above, except that the performance when
the lower margin is used to separate the sample groups is
shown.} \item{"Separation performance at lower
margin"}{This plot is identical to the above, except that
the performance when the upper margin is used to separate
the sample groups is shown.  These last two plots give an
indication of the robustness of the MessinaSurv fit at its
extremes.}}

The Kaplan-Meier plots may optionally display bootstrap
bands, if bootstrap_type != "none".  Note that the
calculation of bootstrap bands is
computationally-intensive, and this function will by
default use multiprocessing to speed calculations if doMC
is loaded and more than one core registered for use. For
examples of the plots and their interpretation, see the
vignette.
}
\examples{
## Load a subset of the TCGA renal clear cell carcinoma data
## as an example.
data(tcga_kirc_example)

## Run the messinaSurv analysis on these data.  Use a tau
## objective, with a minimum performance of 0.6.  Note that
## messinaSurv analyses are very computationally-intensive,
## so multicore use with doMC loaded and parallel = TRUE is
## strongly recommended.  In this example we use a single
## core by default.
fit = messinaSurv(kirc.exprs, kirc.surv, obj_func = "tau", obj_min = 0.6)

## Plot the three best features found by Messina
plot(fit, indices = 1:3)

## Plot the best feature found by Messina, with 90\% confidence bands.
## Note that the bootstrap iterations can be slow, so it is
## recommended that multiple cores are used, with doMC loaded
## and parallel = TRUE.
plot(fit, indices = 1, bootstrap_type = "ci", bootstrap_ci = 0.9)

## Plot the Messina fit of the 10th feature in the dataset, with
## +/- 1 standard deviation bands.
plot(fit, indices = 10, sort_features = FALSE, bootstrap_type = "stdev")
}
\author{
Mark Pinese \email{m.pinese@garvan.org.au}
}
\seealso{
\code{\link{MessinaSurvResult-class}}

\code{\link{messinaSurv}}
}

