(deftemplate person
    (slot name)
    (slot age)
    (slot gender)
)

(deffacts people
    (person (name "Alice") (age 25) (gender female))
    (person (name "Bob") (age 30) (gender male))
    (person (name "Charlie") (age 18) (gender male))
)