\name{updateDesign_BD}
\alias{updateDesign_BD}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Updating a Block Design
}
\description{
This function provides an update function for finding block designs. This function works by by making one or more substitutions. The number of substitutions made and the probability of making a particular number of substitution is given in a vector of probabilities.
}
\usage{
updateDesign_BD(des,ntmt,blksz,sigb=0,sige=0,means=c(1,1),probs=c(1))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{des}{
a vector indicating the initial design to which we will make substitutions.
}
  \item{ntmt}{
a numeric indicating the number of treatments in the design.
}
  \item{blksz}{
an integer specifying the number of experimental units that are in each block. For this function, the block size is constant across all blocks.
}
  \item{sigb}{
a numeric indicating the between block standard deviation.%%     ~~Describe \code{sigmaB} here~~
}
  \item{sige}{
a numeric indicating the within block standard deviation in excess of the Poisson residual error.
}
  \item{means}{
a vector specifying the means for each treatment group.%%     ~~Describe \code{means} here~~
}
  \item{probs}{
a list of probabilities specifying the probability that each step of the simulated annealing substitutes a certain number of design points. The first entry corresponds to the probability that only one substitution is made in a simulated annealing step, the second is the probability that two substitutions are made and so on. By default this is set to c(1) which means that only one substitution is made in each simulated annealing step.   %%     ~~Describe \code{probs} here~~
}
}
\details{This function is designed to work with \code{findOptimalBlockDesign}, and as such shares the arguments of \code{objfnA_BD} and \code{objfnD_BD}. It can, however, be used on its own. The \code{sige}, \code{sigb}, and \code{means} arguments are not used in this function, but are in \code{objfnA_BD} and \code{objfnD_BD}. If using this function on its own, then these terms may be omitted without changing the result of the function.
}
\value{
Returns a vector containing the new design in flattened form.
}
\references{
Bush, S., and Ruggiero, K. (2016) Optimal block designs for experiments with responses drawn from a Poisson distribution, \emph{Under Review}, preprint available at \url{http://arxiv.org/abs/1601.00477}
}

\author{
Stephen Bush (stephen.bush@uts.edu.au)

Katya Ruggiero (k.ruggiero@auckland.ac.nz)
}

\seealso{
\code{\link{findOptimalBlockDesign}}
}
\examples{
# Suppose that we have a block design ((1,1,2,2),(1,1,2,3),(1,2,2,3)) and would like to
# replace exactly one entry with a randomly sampled treatment. Then we set the probability
# that one entry is replaced equal to 1.

updateDesign_BD(des=c(1,1,2,2,1,1,2,3,1,2,2,3),ntmt=3,blksz=4,probs=c(1))

# Now suppose that we would like to replace one entry with probability 0.6 and replace
# two entries with probability 0.4 then probs=c(0.6,0.4).

updateDesign_BD(des=c(1,1,2,2,1,1,2,3,1,2,2,3),ntmt=3,blksz=4,probs=c(0.6,0.4))
}
