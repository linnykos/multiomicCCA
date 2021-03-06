% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_laplacian.R
\name{plot_laplacian}
\alias{plot_laplacian}
\title{Plot signal with respect to Laplacians}
\usage{
plot_laplacian(
  seurat_obj,
  var_name,
  prefix = "RNA",
  e_vec,
  c_vec,
  d_vec,
  e_res,
  c_res,
  d_res,
  sig_digits = 2,
  filename
)
}
\arguments{
\item{seurat_obj}{\code{Seurat} object, which is used to apply the plotting functions to.
We require 3 reductions available, \code{"common"}, \code{"distinct"}
and \code{"everything"}}

\item{var_name}{string, used for plotting aesthetics}

\item{prefix}{string, used for plotting aesthetics}

\item{e_vec}{vector representing the variable (i.e. column) that's the sum of \code{common_mat}
and \code{distinct_mat} from the \code{dcca_decomposition} function}

\item{c_vec}{vector representing the variable (i.e. column) in \code{common_mat}
from the \code{dcca_decomposition} function}

\item{d_vec}{vector representing the variable (i.e. column) in \code{distinct_mat}
from the \code{dcca_decomposition} function}

\item{e_res}{result applying \code{e_vec} to \code{compute_smooth_signal}}

\item{c_res}{result applying \code{c_vec} to \code{compute_smooth_signal}}

\item{d_res}{result applying \code{d_vec} to \code{compute_smooth_signal}}

\item{sig_digits}{integer}

\item{filename}{string, filename to save the plot to}
}
\value{
nothing
}
\description{
Plot signal with respect to Laplacians
}
