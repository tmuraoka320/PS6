#' A Race Object 
#' 
#' Objects of class \code{Race} are created by the \code{createRace} function
#'
#' 
#' An object of the class 'Race' has the following slots:
#' \itemize{
#'  \item{all_candidates}{The names of all candidates}
#'  \item{party}{The name of the candidates' party}
#'  \item{remaining}{The number of remaining delegates}
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
                    party="character",
                    remaining="numeric"))

#' @export
setMethod("initialize", "Race", 
          function(.Object, ...){
            value=callNextMethod()
            return(value)
          })