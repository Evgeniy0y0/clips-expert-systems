(deftemplate cloud
    (slot height)
    (slot appearance)
    (slot precipitation (allowed-values yes no))
    (slot color)
)

(deffacts input-clouds
    (cloud (height 1200) (appearance smooth-sheets) (precipitation no) (color white))
    (cloud (height 7500) (appearance hair-tufts) (precipitation no) (color white))
    (cloud (height 1000) (appearance rounded-heaps) (precipitation yes) (color dark-gray))
)

(deffunction show-cloud-result (?typeName ?tier)
    (if (eq ?tier "") 
        then (printout t "Тип хмари - " ?typeName "." crlf)
        else (printout t "Тип хмари - " ?typeName " (" ?tier ")." crlf)
    )
)

(defrule identify-stratus
    (cloud (height ?h&:(<= ?h 1800)) (appearance smooth-sheets) (precipitation no))
    =>
    (show-cloud-result "Шаруваті хмари" "нижній ярус")
)

(defrule identify-stratocumulus
    (cloud (height ?h&:(<= ?h 1800)) (appearance rounded-heaps))
    =>
    (show-cloud-result "Шарувато-купчасті хмари" "нижній ярус")
)

(defrule identify-altostratus
    (cloud (height ?h&:(and (> ?h 1800) (<= ?h 6000))) (appearance smooth-sheets))
    =>
    (show-cloud-result "Високо-шаруваті хмари" "середній ярус")
)

(defrule identify-cirrus
    (cloud (height ?h&:(> ?h 6000)) (appearance hair-tufts))
    =>
    (show-cloud-result "Перисті хмари" "верхній ярус")
)

(defrule identify-nimbostratus
    (cloud (precipitation yes) (color dark-gray) (appearance smooth-sheets))
    =>
    (show-cloud-result "Шарувато-дощові хмари" "")
)

(defrule identify-cumulonimbus
    (cloud (precipitation yes) (color dark-gray) (appearance rounded-heaps))
    =>
    (show-cloud-result "Купчасто-дощові хмари" "")
)

(defrule identify-cumulus
    (cloud (appearance rounded-heaps) (precipitation no))
    =>
    (show-cloud-result "Купчасті хмари" "")
)
