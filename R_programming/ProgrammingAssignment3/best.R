best <- function(state, outcome) {

    #Describe the structure and valid values of the outcomes we are interested in.
    outcome.df = data.frame(outcomes=c("heart attack", "heart failure", "pneumonia"),
                            col=c(11, 17, 23))

    ## Read outcome data
    outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

    ## Check that the state and the outcome are valid
    if(! state %in% outcomes$State) {
        stop("invalid state")
    }

    if(! outcome %in% outcome.df$outcomes) {
        stop("invalid outcome")
    }

    ## Filter to only the state of interest.
    #state.outcomes = outcomes[outcomes$State == state]
    state.outcomes = subset(outcomes, State == state)

    ## Convert the target outcome column data to numeric.
    oc.col = outcome.df[match(outcome, outcome.df[,1]),2]
    state.outcomes[,oc.col] = suppressWarnings(as.numeric(state.outcomes[,oc.col]))

    ## Return hospital name in state with the lowest 30-day death rate.
    low = min(state.outcomes[,oc.col], na.rm=TRUE)
    ans=subset(state.outcomes, state.outcomes[,oc.col]==low, select=Hospital.Name)

    ## Sort in alphebetcal order and output the first match.
    ans=sort(ans)
    ans[,1]
}
