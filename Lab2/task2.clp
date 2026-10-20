(deftemplate product
   (slot type)
   (slot description)
)

(deftemplate shift
   (slot name)
   (slot start-time)
   (slot end-time)
)

(deftemplate machine
   (slot id (type INTEGER))
   (slot product-type)
   (slot rate-per-hour (type INTEGER))
)

(deftemplate operator
   (slot name)
   (slot assigned-machine (type INTEGER))
   (slot shift-name)
   (slot producing-product)
)

(deffacts production-system-state
   (product 
      (type "тип А") 
      (description "Деталь тип А"))

   (shift 
      (name "ранкова") 
      (start-time "08:00") 
      (end-time "16:00"))

   (machine 
      (id 5) 
      (product-type "тип А") 
      (rate-per-hour 10))

   (operator 
      (name "Іванов") 
      (assigned-machine 5) 
      (shift-name "ранкова") 
      (producing-product "тип А"))
)
