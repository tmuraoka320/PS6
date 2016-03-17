#' A Candidate Object 
#' 
#' Objects of class \code{PS6Package} are created by the \code{createCandidate} function
#'
#' 
#' An object of the class 'Candidate' has the following slots:
#' \itemize{
#'  \item{name}{The name of a candidate}
#'  \item{delegatesWon}{The number of delegates won by the candidate}
#'  \item{party}{The name of the candidate's party}
#'  \item{delegatesNeeded}{The total number of delegates needed by the candidate. For 
#'                         Democratic candidates, it is 2383, and for Republican 
#'                         candidates, it is 1237}
#'  }
#'
#' @author Taishi Muraoka: \email{tmuraoka@@wustl.edu}
#' 
#' @aliases Candidate-class initialize,Candidate-method
#' 
#' @rdname Candidate-class
#' 
#' @export
setClass(Class="Candidate", 
         slots=list(name="character",
                    delegatesWon="numeric",
                    party="character",
                    delegatesNeeded="numeric"))

#' @export
setMethod("initialize", "Candidate", 
          function(.Object, ...){
            value=callNextMethod()
            return(value)
          })