#' Plot an Object with class "Race"
#'
#' Create a plot using with S4 class "Race"
#'
#'
#' @param x An object of class "Race"
#' @param y Anything
#'
#' @return Create a barplot that shows the number of delegates each candidate won and the number of delegates each candidate has to gain in order to win the nomination
#'
#' @author Taishi Muraoka \email{tmuraoka@@wustl.edu}
#'
#' @examples
#' obama <- createCandidate("obama", 333, "Republican")
#' bush <- createCandidate("bush", 30, "Republican")
#' gore <- createCandidate("gore", 500, "Republican")
#' cand_list <- list(obama, bush, gore)
#' candidates <- createRace(cand_list)
#' plot(candidates, "ANYTHING")
#' 
#' @seealso \code{\link{createRace}}
#' 
#' @aliases plot,Race-method
#' 
#' @rdname plotRace
#' 
#' @export
setMethod("plot", "Race",
          function(x, y){
            mat <- matrix(c(x@delegatesWon, x@delegatesRequired), nrow=2, byrow=TRUE)
            colnames(mat) <- x@all_candidates
            rownames(mat) <- c("N of Delegates Won", "N of Delegates Required")
            barplot(mat, beside = TRUE, ylim=c(0, x@remaining+1200), legend=TRUE)
            abline(h=x@remaining, col="red", lty=3)
            text(2, x@remaining+100, "Remaining Delegates", col="red")
          })