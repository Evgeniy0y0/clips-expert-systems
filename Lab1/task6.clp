(defrule find-men
   (person (name $?name) (gender male))
=>
   (printout t "Found man: " $?name crlf)
)

(defrule find-women
   (person (name $?name) (gender female))
=>
   (printout t "Found woman: " $?name crlf)
)

(defrule find-older-than-25
   (person (name $?name) (age ?a&:(> ?a 25)))
=>
   (printout t "Person older than 25: " $?name " (Age: " ?a ")" crlf)
)
