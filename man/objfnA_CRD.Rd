\name{objfnA_CRD}
\alias{objfnA_CRD}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Calculate A-optimality criterion for Completely Randomised Design with Poisson response}
\description{
This function calculates the trace of the inverse of the Fisher information matrix for a completely randomised design with a Poisson response.
}
\usage{
objfnA_CRD(des,ntmt,sige,means,probs=c(1))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{des}{
The design under consideration, a list of length b x k containing treatment indices (1, 2, ..., v)}
  \item{ntmt}{The number of distinct treatments (v)}
  \item{sige}{Standard deviation of excess error}
  \item{means}{A list of length v containing conditional means for each treatment e.g. c(1,1,2) for three treatments with means 1, 1, and 2 respectively}
  \item{probs}{
a list of probabilities specifying the probability that each step of the simulated annealing substitutes a certain number of design points. The first entry corresponds to the probability that only one substitution is made in a simulated annealing step, the second is the probability that two substitutions are made and so on. By default this is set to c(1) which means that only one substitution is made in each simulated annealing step.   %%     ~~Describe \code{probs} here~~
}
}
\details{This function is designed to work with \code{findOptimalExactDesign}, and as such shares the arguments of \code{updateDesign_CRD}. It can, however, be used on its own. The \code{probs} argument is not used in this function, but is in \code{updateDesign_CRD}.
}
\value{
Returns the negative of the determinant of the Fisher information matrix for the provided design.
}
\references{
Bush, S., and Ruggiero, K. (2016) Optimal block designs for experiments with responses drawn from a Poisson distribution, \emph{Under Review}, preprint available at \url{http://arxiv.org/abs/1601.00477}
}
\author{
Stephen Bush (stephen.bush@uts.edu.au)

Katya Ruggiero (k.ruggiero@auckland.ac.nz)
}

\seealso{
\code{\link{findOptimalExactDesign}}, \code{\link{updateDesign_CRD}}
}
\examples{
# Finding the A-optimality objective value for the design (1,1,1,1,2,2,2,3,3,3)
# where there are three treatments, the treatment means are 1, 2, and 4, and
# there is no overdispersion (sige=0)

objfnA_CRD(c(1,1,1,1,2,2,2,3,3,3),ntmt=3,sige=0,means=c(1,2,4))
}
