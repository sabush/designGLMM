\name{objfnD_BD}
\alias{objfnD_BD}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculate D-optimality criterion value for a Block Design
}
\description{
This function calculates the determinant of the Fisher information matrix for a block design with a Poisson response. This function assumes that there are b blocks, each containing k experimental units and v treatments in total. Block effects are assumed to be normal with mean 0 and standard deviation \code{sigb}. Additional residual error can be specified through \code{sige}.%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
objfnD_BD(des, ntmt, blksz, sigb, sige, means, probs)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{des}{
The design under consideration, a list of length b x k containing treatment indices (1, 2, ..., v)}
  \item{ntmt}{The number of distinct treatments (v)}
  \item{blksz}{The number of treatments in each block (k)}
  \item{sigb}{Standard deviation of block effect}
  \item{sige}{Standard deviation of excess error}
  \item{means}{A list of length v containing conditional means for each treatment e.g. c(1,1,2) for three treatments with means 1, 1, and 2 respectively}
  \item{probs}{
a list of probabilities specifying the probability that each step of the simulated annealing substitutes a certain number of design points. The first entry corresponds to the probability that only one substitution is made in a simulated annealing step, the second is the probability that two substitutions are made and so on. By default this is set to c(1) which means that only one substitution is made in each simulated annealing step.   %%     ~~Describe \code{probs} here~~
}
}
\details{
This function is designed to work with \code{findOptimalBlockDesign}, and as such shares the arguments of \code{updateDesign_BD}. It can, however, be used on its own. The \code{probs} argument is not used in this function, but is in \code{updateDesign_BD}.}
\value{
Returns the negative of the determinant of the Fisher information matrix for the proveded design.
}
\references{
Bush, S., and Ruggiero, K. (2016) Optimal block designs for experiments with responses drawn from a Poisson distribution, \emph{Under Review}, preprint available at \url{http://arxiv.org/abs/1601.00477}
}
\author{
Stephen Bush (stephen.bush@uts.edu.au)

Katya Ruggiero (k.ruggiero@auckland.ac.nz)
}

\seealso{
\code{\link{findOptimalBlockDesign}}, \code{\link{updateDesign_BD}}
}
\examples{
# Finding the D-optimality objective value for the design ((1,1,2,2),(1,1,2,3),(1,2,2,3))
# where there are three treatments in three blocks of size four when the treatment means
# are 1, 2, and 4, the between block standard deviation is 0.2 (sigb=0.2) and there is
# no overdispersion (sige=0)

objfnD_BD(c(1,1,2,2,1,1,2,3,1,2,2,3), ntmt=3, blksz=4, sigb=0.2, sige=0, means=c(1,2,4))
}
