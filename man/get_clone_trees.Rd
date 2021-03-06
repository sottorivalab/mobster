% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_clone_trees.R
\name{get_clone_trees}
\alias{get_clone_trees}
\title{Return clone trees from the fit.}
\usage{
get_clone_trees(x, ...)
}
\arguments{
\item{x}{A MOBSTER fit.}

\item{...}{Extra parameters passed to the constructor \code{ctree::cetrees}, which
affect the sampling of the trees.}
}
\value{
The output of the constructor \code{ctree::cetrees}.
}
\description{
This function uses the output fit of MOBSTER
to create a call to \code{ctree} (\url{https://caravagn.github.io/ctree/}),
a package to create clone trees for cancer evolution models.

Creation of a clone tree requires annotations that are not usually 
necessary for just a plain MOBSTER analyses. These annotations report the status of \code{driver} 
and \code{gene} for each one of the input datapoints, and should
be part of data given in input for MOBSTER (so they should be in \code{x$data}). 

MOBSTER clusters are only used if the come from a Beta distribtutions; that is
the tail is removed. The clonal cluster is estimated from the cluster with the highest parameter
value for the Beta peak.

The output is the result of calling the constructor \code{ctree::cetrees}
on the input clustering results \code{x}.
}
\examples{
# We take one of the released datasets
x = mobster::PD4120a_breast_sample$best

# Genes are already annotated
head(x$data$gene)

# Drivers we add, just taken at random from the exonic mutations.
# Just print: x$data \%>\% filter(region == 'exonic')
# SETD2 could really be a driver.
require(dplyr)
genes_list = c('ARHGAP31', 'ABCC5', 'SETD2')
x$data = x$data \%>\% 
  dplyr::mutate(
    driver = ifelse(region == 'exonic' & gene \%in\% genes_list, TRUE, FALSE)
    )

# Get the trees
trees = get_clone_trees(x)

# Print and plot the first tree (top rank)
ctree:::print.ctree(trees[[1]])
ctree::plot.ctree(trees[[1]])
ctree::plot_CCF_clusters(trees[[1]])
ctree::plot_icon(trees[[1]])
ctree::plot_clone_size(trees[[1]])
}
