\name{findOptimalApproxDesign}
\alias{findOptimalApproxDesign}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Find an Optimal Approximate Design for Poisson Regression}
\description{
This function will calculate the design weights for an A-optimal completely randomised design with a Poisson response.}
\usage{
findOptimalApproxDesign(means, silent = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{means}{A list of length v containing conditional means for each treatment e.g. c(1,1,2) for three treatments with means 1, 1, and 2 respectively}
  \item{silent}{a logical to indicate whether the design should be supressed out (TRUE) or not (FALSE)}
}
\value{
\item{design}{A list of the same dimension as means that contains the design weights for the corresponding treatments.}
}
\references{
Bush, S., and Ruggiero, K. (2016) Optimal block designs for experiments with responses drawn from a Poisson distribution, \emph{Under Review}, preprint available at \url{http://arxiv.org/abs/1601.00477}
}
\author{
Stephen Bush (stephen.bush@uts.edu.au)

Katya Ruggiero (k.ruggiero@auckland.ac.nz)
}

\seealso{
\code{\link{findOptimalExactDesign}}, \code{\link{findOptimalBlockDesign}}}
\examples{
# Calculating design weights for an approximate design with means 1, 2, and 4

findOptimalApproxDesign(c(1,2,4), silent = FALSE)

}
