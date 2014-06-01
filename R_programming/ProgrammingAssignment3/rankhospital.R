rankhospital <- function(state, outcome, num = "best") {

    #Describe the structure and valid values of the outcomes we are interested in.
    outcome.df = data.frame(outcomes=c("heart attack", "heart failure", "pneumonia"),
                            col=c(11, 17, 23))
    ## Read outcome data
    outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

    ## Check that state and outcome are valid
    if(! state %in% outcomes$State) {
        stop("invalid state")
    }

    if(! outcome %in% outcome.df$outcomes) {
        stop("invalid outcome")
    }

    ## Return hospital name in that state with the given rank
    state.outcomes = subset(outcomes, State == state)

    ## Convert the target outcome column data to numeric.
    oc.col = outcome.df[match(outcome, outcome.df[,1]),2]
    state.outcomes[,oc.col] = suppressWarnings(as.numeric(state.outcomes[,oc.col]))
    #state.outcomes

    # Sort the data of interest
    o = state.outcomes[order(state.outcomes[,oc.col], state.outcomes[,2], na.last=NA),]

    # How many samples are there? Manipulate best and worst into numberic values.
    o.last = length(o[,oc.col])

    if("best" == num) {
        num = 1
    } else if ("worst" == num) {
        num = o.last
    }

    ## 30-day death rate
    if(num > o.last) {
        NA
    } else {
        o[num, 2]
    }
}
