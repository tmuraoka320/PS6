#' A Candidate Object 
#' 
#' Objects of class \code{Candidate} are created by the \code{createCandidate} function
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
#' @aliases Candidate-class initialize,Candidate-method, show,Candidate-method, print,Candidate-method
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

#' @export
setMethod("show", "Candidate",
          function(object){
            cat(sprintf("An object of class '%s'", class(object)))
            cat("\nslot 'name':\n")
            print(object@name)
            cat("\nslot 'delegatesWon':\n")
            print(object@delegatesWon)
            cat("\nslot 'party':\n")
            print(object@party)
            cat("\nslot 'delegatesNeeded':\n")
            print(object@delegatesNeeded)
            if(class(object)=="Remaining"){
              cat("\nslot 'remain_prop':\n")
              print(object@remain_prop)
            }
          })

#' @export
print.Candidate <- function(Candidate_object){
  cat(sprintf("An object of class '%s'", class(Candidate_object)))
  cat("\nslot 'name':\n")
  print(Candidate_object@name)
  cat("\nslot 'delegatesWon':\n")
  print(Candidate_object@delegatesWon)
  cat("\nslot 'party':\n")
  print(Candidate_object@party)
  cat("\nslot 'delegatesNeeded':\n")
  print(Candidate_object@delegatesNeeded)
  if(class(Candidate_object)=="Remaining"){
    cat("\nslot 'remain_prop':\n")
    print(Candidate_object@remain_prop)
  }
}