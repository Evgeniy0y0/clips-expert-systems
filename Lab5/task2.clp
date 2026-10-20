(deftemplate father-of 
    (slot father) 
    (slot child)
)

(deftemplate mother-of 
    (slot mother) 
    (slot child)
)

(deftemplate male 
    (slot person)
)

(deftemplate female 
    (slot person)
)

(deftemplate wife-of 
    (slot wife) 
    (slot husband)
)

(deftemplate husband-of 
    (slot husband) 
    (slot wife)
)

(deftemplate grandparent 
    (slot gp) 
    (slot grandchild)
)

(deftemplate grandfather 
    (slot gf) 
    (slot grandchild)
)

(deftemplate grandmother 
    (slot gm) 
    (slot grandchild)
)

(deftemplate brother 
    (slot person) 
    (slot sibling)
)

(deftemplate sister 
    (slot person) 
    (slot sibling)
)

(deftemplate uncle 
    (slot un) 
    (slot person)
)

(deftemplate aunt 
    (slot au) 
    (slot person)
)

(deftemplate cousin 
    (slot cousin1) 
    (slot cousin2)
)

(deftemplate ancestor 
    (slot anc) 
    (slot desc)
)

(deffacts initial-family
    (male (person "Grandpa"))
    (female (person "Grandma"))
    (male (person "Tom"))
    (female (person "Susan"))
    (male (person "John"))
    (female (person "Mary"))
    
    (father-of (father "Grandpa") (child "Tom"))
    (mother-of (mother "Grandma") (child "Tom"))
    (father-of (father "Grandpa") (child "Susan"))
    
    (father-of (father "Tom") (child "John"))
    (mother-of (mother "Susan") (child "Mary"))
)

(defrule infer-grandparent-father
    (or (father-of (father ?p) (child ?c))
        (mother-of (mother ?p) (child ?c)))
    (father-of (father ?gp) (child ?p))
    =>
    (assert (grandparent (gp ?gp) (grandchild ?c)))
)

(defrule infer-grandparent-mother
    (or (father-of (father ?p) (child ?c))
        (mother-of (mother ?p) (child ?c)))
    (mother-of (mother ?gp) (child ?p))
    =>
    (assert (grandparent (gp ?gp) (grandchild ?c)))
)

(defrule infer-grandfather
    (grandparent (gp ?gp) (grandchild ?c))
    (male (person ?gp))
    =>
    (assert (grandfather (gf ?gp) (grandchild ?c)))
)

(defrule infer-grandmother
    (grandparent (gp ?gp) (grandchild ?c))
    (female (person ?gp))
    =>
    (assert (grandmother (gm ?gp) (grandchild ?c)))
)

(defrule infer-brother
    (or (father-of (father ?f) (child ?p1))
        (mother-of (mother ?f) (child ?p1)))
    (or (father-of (father ?f) (child ?p2))
        (mother-of (mother ?f) (child ?p2)))
    (male (person ?p1))
    (test (neq ?p1 ?p2))
    =>
    (assert (brother (person ?p1) (sibling ?p2)))
)

(defrule infer-sister
    (or (father-of (father ?f) (child ?p1))
        (mother-of (mother ?f) (child ?p1)))
    (or (father-of (father ?f) (child ?p2))
        (mother-of (mother ?f) (child ?p2)))
    (female (person ?p1))
    (test (neq ?p1 ?p2))
    =>
    (assert (sister (person ?p1) (sibling ?p2)))
)

(defrule infer-uncle
    (or (father-of (father ?p) (child ?c))
        (mother-of (mother ?p) (child ?c)))
    (or (brother (person ?un) (sibling ?p)))
    (male (person ?un))
    =>
    (assert (uncle (un ?un) (person ?c)))
)

(defrule infer-aunt
    (or (father-of (father ?p) (child ?c))
        (mother-of (mother ?p) (child ?c)))
    (or (sister (person ?au) (sibling ?p)))
    (female (person ?au))
    =>
    (assert (aunt (au ?au) (person ?c)))
)

(defrule infer-ancestor-direct
    (or (father-of (father ?p) (child ?c))
        (mother-of (mother ?p) (child ?c)))
    =>
    (assert (ancestor (anc ?p) (desc ?c)))
)

(defrule infer-ancestor-recursive
    (ancestor (anc ?p) (desc ?middle))
    (or (father-of (father ?middle) (child ?c))
        (mother-of (mother ?middle) (child ?c)))
    =>
    (assert (ancestor (anc ?p) (desc ?c)))
)
