(deftemplate person
    (multislot name)
    (slot age (type INTEGER))
    (slot gender (allowed-values male female))
)

(deffacts people-extended
    (person (name John Doe) (age 22) (gender male))
    (person (name Berta) (age 28) (gender female))
    (person (name Alex Smith) (age 35) (gender male))
)