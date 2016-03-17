#' Create an Object with class "Candidate"
#'
#' Create an instance with S4 class "Candidate"
#'
#'
#' @param name A character object with the name of the candidate
#' @param delegatesWon A numeric object with the number of delegates won by the 
#'        candidate
#' @param party A character object with the name of the candidate's party
#'
#' @return An object of class "Candidate" containing
#'  \item{name}{The name of a candidate}
#'  \item{delegatesWon}{The number of delegates won by the candidate}
#'  \item{party}{The name of the candidate's party}
#'  \item{delegatesNeeded}{The total number of delegates needed by the candidate. For 
#'                         Democratic candidates, it is 2383, and for Republican 
#'                         candidates, it is 1237}
#'
#' @author Taishi Muraoka \email{tmuraoka@@wustl.edu}
#'
#' @examples
#' createCandidate("Obama", 150, "Democratic")
#' createCandidate("Bush", 400, "Republican")
#' 
#' @seealso \code{\link{PropNeeded}}, \code{\link{createRace}}
#' 
#' @aliases createCandidate,ANY-method
#' 
#' @rdname createCandidate
#' 
#' @export
setGeneric(name="createCandidate",
           def=function(name, delegatesWon, party, ...){
             standardGeneric("createCandidate")
             })

#' @export
setValidity("Candidate", function(object){
  if(is.character(object@name)==FALSE){
    print("name should be character!")
    }
  if(is.numeric(object@delegatesWon)==FALSE){
    print("delegatesWon should be numeric!")
    }
  })

#' @export
setMethod("createCandidate",
          definition=function(name, delegatesWon, party){
            if(party!="Democratic" & party!="Republican"){
              stop("party should be Democratic or Republican!")
            }
            else{
              if(party=="Democratic"){
                if(delegatesWon < 0 | delegatesWon > 4765){
                  stop("delegatesWon should be larger than 0 and smaller than 4765 for a Democratic candidate!")
                }
                else{
                  delNeed <- 2383
                }
              }
              else{
                if(delegatesWon < 0 | delegatesWon > 2472){
                  stop("delegatesWon should be larger than 0 and smaller than 2472 for a Republican candidate!")
                }
                else{
                  delNeed <- 1237
                }
              }
            }
            object <- new("Candidate",
                          name=name,
                          delegatesWon=delegatesWon,
                          party=party,
                          delegatesNeeded=delNeed)
            return(object)
          })