#' The Proportion of Remaining Delegates Required for Winning
#'
#' Calculate the proportion of delegates remaining needed for the candidate to win
#'
#'
#' @param candidate An object of class "Candidate"
#' @param remaining The number of remaining deligates
#' 
#' @return An object of subclass "Remaining" containing
#'  \item{name}{The name of a candidate}
#'  \item{delegatesWon}{The number of delegates won by the candidate}
#'  \item{party}{The name of the candidate's party}
#'  \item{delegatesNeeded}{The total number of delegates needed by the candidate. For 
#'                         Democratic candidates, it is 2383, and for Republican 
#'                         candidates, it is 1237}
#'  \item{remain_prop}{The proportion of delegates remaining needed for the candidate 
#'                     to win}
#'
#' @author Taishi Muraoka
#'
#' @examples
#' obama <- createCandidate("Obama", 1500, "Democratic")
#' propNeeded(obama, )
#'
#' @export
propNeeded <- function(candidate, remaining){
  
  # set s4 class "Remaining", which is a subclass of "Candidate"
  # name is character, delegatesWon is numeric, party is character,
  # delegatesNeeded is numeric, and remain_prop is numeric
  
  
  setAs(from="Candidate", to="Remaining",
        function(candidate){
          new("Remaining",
              name=candidate@name,
              delegatesWon=candidate@delegatesWon,
              party=candidate@party,
              delegatesNeeded=candidate@delegatesNeeded,
              remain_prop=prop)
        })
  
  if(is.numeric(remaining)==FALSE){
    stop("remaining should be numeric!")
  }
  else{
    if(candidate@party=="Democratic"){
      if(remaining < 0 | remaining > 4765 - candidate@delegatesWon){
        stop("Invalid number of remaining delegates!")
      }
      else{
        need <- candidate@delegatesNeeded - candidate@delegatesWon
        if(need > remaining){
          stop("This candidate has no chance of winning!")
        }
        else{
          prop <- need/remaining
        }
      }
    }
    else{
      if(remaining < 0 | remaining > 2472 - candidate@delegatesWon){
        stop("Invalid number of remaining delegates!")
      }
      else{
        need <- candidate@delegatesNeeded - candidate@delegatesWon
        if(need > remaining){
          stop("This candidate has no chance of winning!")
        }
        else{
          prop <- need/remaining
        }
      }
    }
  }
  newobject <- new("Remaining", 
                   name=candidate@name,
                   delegatesWon=candidate@delegatesWon,
                   party=candidate@party,
                   delegatesNeeded=candidate@delegatesNeeded,
                   remain_prop=prop)
  
  return(newobject)
}