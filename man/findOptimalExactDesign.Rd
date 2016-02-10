\name{findOptimalExactDesign}
\alias{findOptimalExactDesign}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Find optimal Completely Randomised Design using Simulated Annealing}
\description{
\code{findOptimalExactDesign} finds a D-optimal or A-optimal completely randomised design for a Poisson generalised linear model using simulated annealing.}
\usage{
findOptimalExactDesign(numunits, means, sigma, probs = c(1),criterion="D",
                        link="Poisson", trace = FALSE, iter = 10000, temp = 10,
                        tmax = 10, silent = FALSE, tol = 1e-04, maxtime = 60)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{numunits}{
the total number of experimental units in the design
}
  \item{means}{
a vector specifying the means for each treatment group.%%     ~~Describe \code{means} here~~
}
  \item{sigma}{
a numeric indicating the within block standard deviation in excess of the Poisson residual error %%     ~~Describe \code{sigma} here~~
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
 a numeric value indicating the numerical tolerance required to stop the simulated annealing algorithm from restarting.%%     ~~Describe \code{temp} here~~
}
  \item{maxtime}{
 a numeric value indicating the maximum amount of time the fiunction is allowed to take before stopping optimisation.%%     ~~Describe \code{temp} here~~
}
}
\details{
This function uses the simulated annealing algorithm provided in the \code{optim} function to find optimal completely randomised designs for a Poisson generalised linear model. The linear predictor for the experimental unit j in using this model is:

\eqn{\eta_{R(j)} = \mu + \tau_{R(j)} + e_{j}}{\eta_[R(j)] = \mu + \tau[R(j)] + e[j]}

where j=1,...,k and R(j) is the treatment assigned to experimental unit j.
}
\value{
\item{design}{a matrix containing the optimal design.}
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
\code{\link{findOptimalBlockDesign}}, \code{\link{findOptimalApproxDesign}}, \code{\link{updateDesign_CRD}}, \code{\link{objfnA_CRD}}, \code{\link{objfnD_CRD}}
}
\examples{

# Finding a D-optimal completely randomised design with 10 observations, three treatments
# with means 1,2, and 4 and no overdispersion.

findOptimalExactDesign(numunits=10, means=c(1,2,4), sigma=0, criterion="D")

# Finding an A-optimal completely randomised design with 10 observations, three treatments
# with means 1,2, and 4 and no overdispersion.

findOptimalExactDesign(numunits=10, means=c(1,2,4), sigma=0, criterion="A")
}
