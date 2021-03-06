% Generated by roxygen2 (4.1.0.9000): do not edit by hand
% Please edit documentation in R/accessors-minute.r
\name{minute}
\alias{minute}
\alias{minute<-}
\title{Get/set minutes component of a date-time.}
\usage{
minute(x)
}
\arguments{
\item{x}{a date-time object}
}
\value{
the minutes element of x as a decimal number
}
\description{
Date-time must be a  POSIXct, POSIXlt, Date, Period, chron, yearmon, yearqtr, zoo,
zooreg, timeDate, xts, its, ti, jul, timeSeries, and fts objects.
}
\examples{
x <- ymd("2012-03-26")
minute(x)
minute(x) <- 1
minute(x) <- 61
minute(x) > 2
}
\keyword{chron}
\keyword{manip}
\keyword{methods}
\keyword{utilities}

