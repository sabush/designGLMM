\name{findOptimalBlockDesign}
\alias{findOptimalBlockDesign}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Find an efficient block design for a Poisson GLMM
}
\description{
\code{findOptimalBlockDesign} finds a D-optimal or A-optimal block design for a Poisson generalised linear mixed model with gamma distributed random effects (Poisson-Gamma mixture) using simulated annealing.
}
\usage{
findOptimalBlockDesign(numblock,blksize,means,sigma,sigmaB,probs=c(1),
                        criterion="D",link="Poisson",trace=FALSE,iter=10000,
                        temp=10,tmax=10,silent=FALSE,tol=0.0001,maxtime=60,
                        startdes="random")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{numblock}{
an integer specifying the number of blocks in the block design to be constructed. %%     ~~Describe \code{numblock} here~~
}
  \item{blksize}{
an integer specifying the number of experimental units that are in each block. For this function, the block size is constant across all blocks. %%     ~~Describe \code{blksize} here~~
}
  \item{means}{
a vector specifying the means for each treatment group.%%     ~~Describe \code{means} here~~
}
  \item{sigma}{
a numeric indicating the within block standard deviation in excess of the Poisson residual error %%     ~~Describe \code{sigma} here~~
}
  \item{sigmaB}{
a numeric indicating the between block standard deviation.%%     ~~Describe \code{sigmaB} here~~
}
  \item{probs}{
a list of probabilities specifying the probability that each step of the simulated annealing substitutes a certain number of design points. The first entry corresponds to the probability that only one substitution is made in a simulated annealing step, the second is the probability that two substitutions are made and so on. By default this is set to c(1) which means that only one substitution is made in each simulated annealing step.   %%     ~~Describe \code{probs} here~~
}
  \item{criterion}{
Optimality criterion. For D-optimality use \code{"D"} and for A-optimality use \code{"A"}.
}
  \item{link}{
The link function used. Currently only  \code{"Poisson"} is supported.
}
  \item{trace}{
 a logical indicating whether the function should return information about the iterations of the simulated annealing algorithm. %%     ~~Describe \code{trace} here~~
}
  \item{iter}{
 the number of simulated annealing iterations per round. This variable is passed to the \code{optim} function.%%     ~~Describe \code{iter} here~~
}
  \item{temp}{
 starting temperature for simulated annealing algorithm. This variable is passed to the \code{optim} function.%%     ~~Describe \code{temp} here~~
}
  \item{tmax}{
 the number of function evaluations at each temperature in the simulated annealing algorithm. This variable is passed to the \code{optim} function.%%     ~~Describe \code{temp} here~~
}
  \item{silent}{
 a logical indicating whether any output should be returned.%%     ~~Describe \code{temp} here~~
}
  \item{tol}{
 a numeric value indicating the numerical tolerance required to stop the simulated annealing algorithm from restarting%%     ~~Describe \code{temp} here~~
}
  \item{maxtime}{
 a numeric value indicating the maximum amount of time the fiunction is allowed to take before stopping optimisation%%     ~~Describe \code{temp} here~~
}
  \item{startdes}{
 either \code{"random"} or \code{"approximate"}. If random is chosen then a random starting design will be used. If "approximate" is used then the approximate proportions of each treatment in the optimal completely randomised design will appear in each block. If the block size is less than or close to the number of treatments, then "approximate" is not recommended. %%     ~~Describe \code{temp} here~~
}

}
\details{
This function uses the simulated annealing algorithm provided in the \code{optim} function to find optimal block designs for a Poisson generalised linear mixed model. The linear predictor for the experimental unit j in block i using this model is:

\eqn{\eta_{R(i,j)} = \mu + \tau_{R(i,j)} + B_i + e_{i,j}}{\eta_[R(i,j)] = \mu + \tau[R(i,j)] + B[i] + e[i,j]}

where i = 1,...,b,  j=1,...,k and there are b blocks each with k experimental units. R(i,j) is the treatment assigned to experimental unit j in block i.

}
\value{
\item{design}{a matrix containing the optimal design. Each row corresponds to a single block.}
\item{value}{the value of the D or A optimality criterion value for the optimal design, depending on whether \code{"D"} or \code{"A"} was specified under the criterion option.}
\item{iter}{lists the evolution of the criterion value through iterations of the simulated annealing algorithm.}
}
\references{
Bush, S., and Ruggiero, K. (2016) Optimal block designs for experiments with responses drawn from a Poisson distribution, \emph{Under Review}, preprint available at \url{http://arxiv.org/abs/1601.00477}
}
\author{
Stephen Bush (stephen.bush@uts.edu.au)

Katya Ruggiero (k.ruggiero@auckland.ac.nz)
}

\seealso{
\code{\link{findOptimalExactDesign}}, \code{\link{findOptimalApproxDesign}}, \code{\link{updateDesign_BD}}, \code{\link{objfnA_BD}}, \code{\link{objfnD_BD}}
}
\examples{

## Constructing a D-optimal block design with 7 blocks of size 3 with seven treatments
## with means c(5,5.5,6,5.5,7,10,4) with between block standard deviation 0.3
## and no overdispersion (sigma=0)

findOptimalBlockDesign(numblock = 7, blksize = 3, means = c(5,5.5,6,5.5,7,10,4),
  sigma = 0, sigmaB = 0.3)

## Constructing an A-optimal design with the same means

findOptimalBlockDesign(numblock = 7, blksize = 3, means = c(5,5.5,6,5.5,7,10,4),
  sigma = 0, sigmaB = 0.3, criterion = "A")

}
