(deftemplate person
    (slot name)
    (slot gender (allowed-values male female))
    (slot role)
)

(deftemplate parent-child
    (slot child)
    (slot parent)
    (slot relation (allowed-values father mother))
)

(deftemplate parents-of
    (slot child)
    (multislot parents)
)

(deffacts control-state
    (step 1)
)

(deffacts family-facts
    (person (name John)  (gender male)   (role son))
    (person (name Tom)   (gender male)   (role father))
    (person (name Susan) (gender female) (role mother))

    (parent-child (child John) (parent Tom)   (relation father))
    (parent-child (child John) (parent Susan) (relation mother))

    (parents-of (child John) (parents Tom Susan))
)

(defrule print-1-father
    ?s <- (step 1)
    (parent-child (child John) (parent ?f) (relation father))
    =>
    (printout t "The father of John is " ?f "." crlf)
    (retract ?s)
    (assert (step 2))
)

(defrule print-2-mother
    ?s <- (step 2)
    (parent-child (child John) (parent ?m) (relation mother))
    =>
    (printout t "The mother of John is " ?m "." crlf)
    (retract ?s)
    (assert (step 3))
)

(defrule print-3-parents
    ?s <- (step 3)
    (parents-of (child John) (parents ?p1 ?p2))
    =>
    (printout t "The parents of John are " ?p1 " and " ?p2 "." crlf)
    (retract ?s)
    (assert (step 4))
)

(defrule print-4-tom-role
    ?s <- (step 4)
    (person (name Tom) (role ?role))
    =>
    (printout t "Tom is a " ?role "." crlf)
    (retract ?s)
    (assert (step 5))
)

(defrule print-5-susan-role
    ?s <- (step 5)
    (person (name Susan) (role ?role))
    =>
    (printout t "Susan is a " ?role "." crlf)
    (retract ?s)
    (assert (step 6))
)

(defrule print-6-john-role
    ?s <- (step 6)
    (person (name John) (role ?role))
    =>
    (printout t "John is a " ?role "." crlf)
    (retract ?s)
    (assert (step 7))
)

(defrule print-7-tom-gender
    ?s <- (step 7)
    (person (name Tom) (gender ?g))
    =>
    (printout t "Tom is a " ?g "." crlf)
    (retract ?s)
    (assert (step 8))
)

(defrule print-8-susan-gender
    ?s <- (step 8)
    (person (name Susan) (gender ?g))
    =>
    (printout t "Susan is a " ?g "." crlf)
    (retract ?s)
    (assert (step 9))
)

(defrule print-9-john-gender
    ?s <- (step 9)
    (person (name John) (gender ?g))
    =>
    (printout t "John is a " ?g "." crlf)
    (retract ?s)
)
