#' Create an Object with class "Race"
#'
#' Create an instance with S4 class "Race"
#'
#'
#' @param candidate_list A list of objects of class "Candidate"
#'
#' @return An object of class "Candidate" containing
#'  \item{all_candidates}{The names of all candidates}
#'  \item{party}{The name of the candidates' party}
#'  \item{remaining}{The number of remaining delegates}
#'
#' @author Taishi Muraoka \email{tmuraoka@@wustl.edu}
#'
#' @examples
#' obama <- createCandidate("obama", 333, "Republican")
#' bush <- createCandidate("bush", 30, "Republican")
#' gore <- createCandidate("gore", 500, "Republican")
#' cand_list <- list(obama, bush, gore)
#' createRace(cand_list)
#' 
#' @seealso \code{\link{createCandidate}}, \code{\link{PropNeeded}}
#' 
#' @aliases createRace,Candidate-method
#' 
#' @rdname createRace
#' 
#' @export
setGeneric(name="createRace",
           def=function(candidate_list, ...){
             standardGeneric("createRace")
           })

#' @export
setValidity("Race", function(object){
  if(is.character(object@all_candidates)==FALSE){
    print("all_candidates should be character!")
  }
  if(length(object@party)!=1){
    print("party should be unique either Democratic or Republican!")
  }
  if(is.numeric(object@remaining)==FALSE){
    print("remaining should be numeric!")
  }
})

#' @export
setMethod("createRace",
          definition=function(candidate_list){
            if(is.list(candidate_list)==FALSE){
              stop("candidate_list should be list!")
            }
            else{
              if(FALSE %in% (sapply(candidate_list, class)=="Candidate")){
                stop("all the objects in candidate_list should be Candidate object!")
              }
              else{
                if(length(unique(sapply(candidate_list, function(x){x@party})))!=1){
                  stop("all the candidates' party should be same!")
                }
                else{
                  if(unique(sapply(candidate_list, function(x){x@party}))=="Democratic"){
                    if(sum(sapply(candidate_list, function(x){x@delegatesWon})) > 4765){
                      stop("the total number of delegates won is inaccurate!")
                    }
                    else{
                      names <- sapply(candidate_list, function(x){x@name})
                      party <- unique(sapply(candidate_list, function(x){x@party}))
                      remaining <- 4765 - sum(sapply(candidate_list, function(x){x@delegatesWon}))
                    }
                  }
                  else{
                    if(sum(sapply(candidate_list, function(x){x@delegatesWon})) > 2472){
                      stop("the number of delegates won is inaccurate!")
                    }
                    else{
                      names <- sapply(candidate_list, function(x){x@name})
                      party <- unique(sapply(candidate_list, function(x){x@party}))
                      remaining <- 2472 - sum(sapply(candidate_list, function(x){x@delegatesWon}))
                    }
                  }
                  newobject <- new("Race",
                                all_candidates=names,
                                party=party,
                                remaining=remaining)
                  return(newobject)
                }
              }
            }
          })