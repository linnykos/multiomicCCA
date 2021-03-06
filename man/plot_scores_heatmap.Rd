% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot.R
\name{plot_scores_heatmap}
\alias{plot_scores_heatmap}
\title{Side-by-side plot of the canonical scores as heatmaps}
\usage{
plot_scores_heatmap(
  obj,
  membership_vec = NA,
  num_col = 10,
  log_scale = F,
  scaling_power = 1,
  luminosity = F
)
}
\arguments{
\item{obj}{output of either \code{generate_data} or \code{dcca_decomposition}}

\item{membership_vec}{factor vector}

\item{num_col}{positive integers for number of distinct colors}

\item{log_scale}{boolean}

\item{scaling_power}{positive numeric}

\item{luminosity}{boolean}
}
\value{
shows a plot but returns nothing
}
\description{
Side-by-side plot of the canonical scores as heatmaps
}
