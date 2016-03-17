###
### Problem Set 06
### Taishi Muraoka
### March 21
###



##
## setup
##
library(devtools);library(roxygen2)

setwd("C:/Users/Taishi/Documents/PS6")

current.code <- as.package("PS6Package")

load_all(current.code)

document(current.code)



##
## test createCandidate
##
help(createCandidate)

createCandidate("obama", 333, "Republican") # this works

createCandidate(1, 333, "Republican") # error because name should not be a number

createCandidate("obama", -200, "Republican") # error because the number is strange

createCandidate("obama", 333, "Whig") # error because party should be Democratic or
                                      # Republican



##
## try show() and print()
##
obama <- createCandidate("obama", 333, "Republican")

show(obama)

print(obama)



##
## test proNeeded
##
help(propNeeded)

propNeeded(obama, 1500) # this works

propNeeded("aaa", 1500) # error because the first argument is not a Candidate class

propNeeded(obama, "ten") # error because remaining should be numeric

propNeeded(obama, 2000000000) # error because the remaining number is inaccurate

propNeeded(obama, 100) # error because there is no chance of winning

as(object=obama, Class="Remaining") # moving between classes



##
##
##
