(deffacts what-day-is-it?
	(Today is Thursday)
	(Tomorrow is Friday)
)

(defrule find-today
	(today is ?day)
=>
	(printout t "Today is " ?day crlf)
)