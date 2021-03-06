\docType{methods}
\name{plot,MessinaClassResult,missing-method}
\alias{plot,MessinaClassResult,missing-method}
\alias{plot,MessinaClassResult-method}
\title{Plot the results of a Messina analysis on a classification / differential expression problem.}
\usage{
\S4method{plot}{MessinaClassResult,missing}(x, y, ...)
}
\arguments{
  \item{x}{the result of a Messina analysis, as returned by
  functions \code{\link{messina}} or
  \code{\link{messinaDE}}.}

  \item{...}{additional options to control the plot:
  \describe{ \item{\code{indices}}{a vector of indices of
  features to plot.  If sort_features == FALSE, the indices
  are into the unsorted features, as originally supplied in
  x supplied to messina or messinaDE.  If sort_features ==
  TRUE, features are first sorted in order of decreasing
  margin, and then the indices in this parameter are
  plotted.  For example, if indices == 2 and sort_features
  == FALSE, the second feature in x will be plotted.
  However, if sort_features == TRUE, the feature with the
  second best classifier margin will be plotted.}
  \item{\code{sort_features}}{a boolean indicating whether
  to sort features by decreasing margin size before
  selecting from indices.  This affects the interpretation
  of the parameter 'indices'; for more details see the
  description of that parameter.} \item{\code{plot_type}}{a
  string giving the type of plot to produce, either "point"
  or "bar".  "bar" is the default, and shows expression
  levels as horizontal bars.  Although this representation
  is familiar, it can be misleading in the case of
  log-transformed data.  In that case, the "point" plot
  type is preferable.} }}

  \item{y}{the y coordinates of points in the plot,
  \emph{optional} if \code{x} is an appropriate structure.}
}
\description{
Produces a separate plot for each supplied feature index
(either as an index into the expression data x as-supplied,
or as an index into the features sorted by Messina margin,
depending on the value of sort_features), showing sample
expression levels, group membership, threshold value, and
margin locations.  Two different types of plots can be
produced.  See the vignette for examples.
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

## Make bar plots of the five best fits
plot(fit, indices = 1:5, sort_features = TRUE, plot_type = "bar")

## Make a point plot of the fit to the 10th feature
plot(fit, indices = 10, sort_features = FALSE, plot_type = "point")
}
\author{
Mark Pinese \email{m.pinese@garvan.org.au}
}
\seealso{
\code{\link{MessinaClassResult-class}}

\code{\link{messina}}

\code{\link{messinaDE}}
}

