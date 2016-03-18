#' A Race Object 
#' 
#' Objects of class \code{Race} are created by the \code{createRace} function
#'
#' 
#' An object of the class 'Race' has the following slots:
#' \itemize{
#'  \item{all_candidates}{The vector of the names of all candidates}
#'  \item{delegatesWon}{The vector of the number of delegates won by all candidates}
#'  \item{party}{The name of the candidates' party}
#'  \item{remaining}{The number of remaining delegates}
#'  \item{delegatesRequired}{The vector of the number of delegates required by all candidates in order to win}
#'  }
#'
#' @author Taishi Muraoka: \email{tmuraoka@@wustl.edu}
#' 
#' @aliases Race-class initialize,Race-method
#' 
#' @rdname Race-class
#' 
#' @export
setClass(Class="Race", 
         slots=list(all_candidates="vector",
                    delegatesWon="vector",
                    party="character",
                    remaining="numeric",
                    delegatesRequired="vector"))

#' @export
setMethod("initialize", "Race", 
          function(.Object, ...){
            value=callNextMethod()
            return(value)
          })