% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_embedding.R
\name{.extract_matrix_helper}
\alias{.extract_matrix_helper}
\title{Matrix extraction helper for plotting}
\usage{
.extract_matrix_helper(
  common_score,
  distinct_score,
  svd_e,
  common_bool,
  distinct_bool,
  add_noise,
  center,
  renormalize
)
}
\arguments{
\item{common_score}{matrix of common scores}

\item{distinct_score}{matrix of distinct scores, with same number of rows as \code{common_score}}

\item{svd_e}{list containing the SVD of the full matrix}

\item{common_bool}{boolean}

\item{distinct_bool}{boolean}

\item{add_noise}{boolean, intended (if \code{TRUE}) to put the common and 
distinct scores "on the same scale" by adding appropriately-scaled Gaussian noise.
Which matrices get the added noise depends on \code{common_bool} or \code{distinct_bool})}

\item{center}{boolean. If \code{TRUE}, center each canonical variable (i.e., column)
where the centering is based on \code{common_score+distinct_score}}

\item{renormalize}{boolean. If \code{TRUE}, normalize each sample (i.e., row)
to have unit norm, where the rescaling factor is based on \code{common_score+distinct_score}.
This is suggested to be only used if \code{center=TRUE}, in which case the centering
happens before the renormalization}
}
\value{
a matrix
}
\description{
This function is designed to be called for plotting based on PCA
or UMAP.
One of \code{common_bool} and \code{distinct_bool} must be \code{TRUE}.
The options of \code{center} and \code{renormalize} are there
to emulate the typical UMAP where the cosine distance is used
to measure the distance between samples.
}
