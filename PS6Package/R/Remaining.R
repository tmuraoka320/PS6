#' A Remaining object 
#' 
#' Objects of class \code{Remaining} are created by the \code{propNeeded} function
#'
#' 
#' An object of the class `Squares' has the following slots:
#' \itemize{
#'  \item{name}{The name of a candidate}
#'  \item{delegatesWon}{The number of delegates won by the candidate}
#'  \item{party}{The name of the candidate's party}
#'  \item{delegatesNeeded}{The total number of delegates needed by the candidate. For 
#'                         Democratic candidates, it is 2383, and for Republican 
#'                         candidates, it is 1237}
#'  \item{The proportion of delegates remaining needed for the candidate to win}
#'  }
#'
#' @author Taishi Muraoka: \email{tmuraoka@@wustl.edu}
#' 
#' @aliases Remaining-class initialize,Remaining-method 
#' 
#' @rdname Remaining-class
#' 
#' @export
setClass(Class="Remaining",
         contain="Candidate",
         slots=list(name="character",
                    delegatesWon="numeric",
                    party="character",
                    delegatesNeeded="numeric",
                    remain_prop="numeric"))

#' @export
setMethod("initialize", "Remaining", 
          function(.Object, ...){
            value=callNextMethod()
            return(value)
          }) 