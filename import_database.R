library(rtweet)
library(dplyr)
library(ggplot2)
library(xlsx)
library(readxl)

# Import Twitter database with tweets from Donald Trump and Joe Biden

vignette("auth", package = "rtweet")

## working with the stream
vignette("stream", package = "rtweet")

candidates <- get_timelines(
  user = c("realDonaldTrump", "JoeBiden"),
  n = 10000
)

table(candidates$screen_name)

candidates %>%
  group_by(screen_name) %>%
  ts_plot(by = "week")

candidates <- apply(candidates,2,as.character)


#Export the final dataframe to a csv file
write.csv(candidates, "Candidates_tweets.csv")