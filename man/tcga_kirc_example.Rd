\docType{data}
\name{tcga_kirc_example}
\alias{kirc.exprs}
\alias{kirc.surv}
\alias{tcga_kirc_example}
\title{Example TCGA KIRC RNAseq expression and survival data}
\format{a \code{matrix} of RNAseq (TCGA platform "illuminahiseq_rnaseqv2") expression estimates kirc.exprs,
  with genes in rows and patients in columns; and a \code{Surv} object kirc.surv, giving patient survival
  times and status.}
\source{
TCGA, downloaded on 16 Jan 2014, and only a small random
subset of genes retained, to reduce size.
}
\usage{
tcga_kirc_example
}
\description{
A small subset of the TCGA KIRC (kidney renal clear cell
carcinoma) expression and survival data, for use as an
example for messinaSurv.
}
\author{
Mark Pinese, 20 March 2014.
}

