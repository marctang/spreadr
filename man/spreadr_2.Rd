% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spreadr_2.R
\name{spreadr_2}
\alias{spreadr_2}
\title{Spread of activation process to determine activation of network nodes.}
\usage{
spreadr_2(network, start_run, retention = 0.5, time = 10, decay = 0,
  suppress = 0, ignore_time = F, threshold_to_stop = 0.01,
  create_names = TRUE)
}
\arguments{
\item{network}{Network where the spreading occurs. Must be specified. Must be an igraph object with a "name" property or an adjacency matrix.}

\item{start_run}{A non-empty dataframe with 'node' and 'activation' columns. Must be specified.}

\item{retention}{Proportion of activation that remains in the node from which activation is being spread from. Ranges from 0 to 1. Default is 0.5.}

\item{time}{Number of time steps to run the spreadr() function for. Default is 10.}

\item{decay}{Proportion of activation that is lost at each time step. Ranges from 0 to 1. Default is 0.}

\item{suppress}{Suppress nodes with a final activation of < x units at each time step to an activation value of 0. Default is 0.}

\item{ignore_time}{Indicate whether to ignore the number of time steps listed and allow for the spreading activation process to continue until the value listed in threshold_to_stop is achieved. Default = F}

\item{threshold_to_stop}{Stop spreading activation when the proportion of total activation in start_run is below the threshold. Default = 0.01}

\item{create_names}{Name nodes 1:number_of_nodes in case network is missing node names.}
}
\value{
A compiled dataframe with 'node', 'activation' and 'time' columns showing the spread of activation in the network over time.
}
\description{
This function takes in a dataframe with 'node' and 'activation' columns, and
simulates the spread of activation among nodes in a specified network structure.
Note that spreadr_2 is identical to spreadr, except that there is an additonal option for the user to
}
\examples{
g_d_mat <- matrix(sample(c(0,1), 100, replace = TRUE), 10, 10) 
# make an adjacency matrix and randomly fill some cells with 1s 
diag(g_d_mat) <- 0 # remove self-loops 
library(spreadr)
initial_df <- data.frame(node = 1, activation = 20, stringsAsFactors = FALSE)
result_d <- spreadr_2(start_run = initial_df, decay = 0, retention = 0.5, 
suppress = 0, network = g_d_mat, ignore_time = TRUE, threshold_to_stop = 0.01) 
head(result_d, 10)
tail(result_d, 10)
}
