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

(deffacts family-facts
   (person (name John)  (gender male)   (role son))
   (person (name Tom)   (gender male)   (role father))
   (person (name Susan) (gender female) (role mother))

   (parent-child (child John) (parent Tom)   (relation father))
   (parent-child (child John) (parent Susan) (relation mother))

   (parents-of (child John) (parents Tom Susan))
)
