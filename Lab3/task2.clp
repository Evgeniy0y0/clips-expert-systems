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

(defrule identify-stratus
    (cloud (height ?h&:(<= ?h 1800)) (appearance smooth-sheets) (precipitation no))
    =>
    (printout t "Тип хмари: Шаруваті хмари (нижній ярус)." crlf)
)

(defrule identify-stratocumulus
    (cloud (height ?h&:(<= ?h 1800)) (appearance rounded-heaps))
    =>
    (printout t "Тип хмари: Шарувато-купчасті хмари (нижній ярус)." crlf)
)

(defrule identify-altostratus
    (cloud (height ?h&:(and (> ?h 1800) (<= ?h 6000))) (appearance smooth-sheets))
    =>
    (printout t "Тип хмари: Високо-шаруваті хмари (середній ярус)." crlf)
)

(defrule identify-cirrus
    (cloud (height ?h&:(> ?h 6000)) (appearance hair-tufts))
    =>
    (printout t "Тип хмари: Перисті хмари (верхній ярус)." crlf)
)

(defrule identify-nimbostratus
    (cloud (precipitation yes) (color dark-gray) (appearance smooth-sheets))
    =>
    (printout t "Тип хмари: Шарувато-дощові хмари." crlf)
)

(defrule identify-cumulonimbus
    (cloud (precipitation yes) (color dark-gray) (appearance rounded-heaps))
    =>
    (printout t "Тип хмари: Купчасто-дощові хмари." crlf)
)

(defrule identify-cumulus
    (cloud (appearance rounded-heaps) (precipitation no))
    =>
    (printout t "Тип хмари: Купчасті хмари." crlf)
)
