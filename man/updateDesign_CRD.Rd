\name{updateDesign_CRD}
\alias{updateDesign_CRD}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Update function for Completely Randomised Design search}
\description{
This function provides an update function for finding completely randomised designs. This function works by by making one or more substitutions. The number of substitutions made nd the probability of making a particular number of substitution is given in a vector of probabilities.
}
\usage{
updateDesign_CRD(des, ntmt, sige=0,means=c(1,1), probs=c(1))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{des}{
a vector indicating the initial design to which we will make substitutions.
}
  \item{ntmt}{
a numeric indicating the number of treatments in the design.
}
  \item{sige}{
a numeric indicating the within block standard deviation in excess of the Poisson residual error }
  \item{means}{
a vector specifying the means for each treatment group.%%     ~~Describe \code{means} here~~
}
  \item{probs}{
a list of probabilities specifying the probability that each step of the simulated annealing substitutes a certain number of design points. The first entry corresponds to the probability that only one substitution is made in a simulated annealing step, the second is the probability that two substitutions are made and so on. By default this is set to c(1) which means that only one substitution is made in each simulated annealing step.   %%     ~~Describe \code{probs} here~~
}
}
\details{This function is designed to work with \code{findOptimalExactDesign}, and as such shares the arguments of \code{objfnA_CRD} and \code{objfnD_CRD}. It can, however, be used on its own. The \code{sige} and \code{means} arguments are not used in this function, but are in \code{objfnA_CRD} and \code{objfnD_CRD}. If using this function on its own, then these terms may be omitted without changing the result of the function.
}
\value{
Returns a vector containing the new design.
}
\references{
Bush, S., and Ruggiero, K. (2016) Optimal block designs for experiments with responses drawn from a Poisson distribution, \emph{Under Review}, preprint available at \url{http://arxiv.org/abs/1601.00477}
}
\author{
Stephen Bush (stephen.bush@uts.edu.au)

Katya Ruggiero (k.ruggiero@auckland.ac.nz)
}

\seealso{
\code{\link{findOptimalExactDesign}} %% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
# Suppose that we have a completely randomised design (1,1,1,1,2,2,2,3,3,3) and would like
# to replace exactly one entry with a randomly sampled treatment. Then we set the
# probability that one entry is replaced equal to 1.

updateDesign_CRD(des=c(1,1,1,1,2,2,2,3,3,3),ntmt=3,probs=c(1))

# Now suppose that we would like to replace one entry with probability 0.6 and replace
# two entries with probability 0.4 then probs=c(0.6,0.4).

updateDesign_CRD(des=c(1,1,1,1,2,2,2,3,3,3),ntmt=3,probs=c(0.6,0.4))
}
