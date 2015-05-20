sl = c(7,6.4,6.9,5.5,6.5)
sw = c(3.2,3.2,3.1,2.3,2.8)

Esl = sum(sl*1:5)
Esw = sum(sw*1:5)
E2sl = sum(sl^2*1:5)

E2sw = sum(sw^2*1:5)
Eswsl = sum(sl*sw*1:5)
covswsl = Eswsl - Esw*Esl
covsw = E2sw - Esw*Esw
covsl = E2sl - Esl*Esl
covcoef = covswsl/(covsw*covsl)^0.5
covcoef



Esl = sum(sl/5)
Esw = sum(sw/5)
E2sl = sum(sl^2/5)
E2sw = sum(sw^2/5)

Eswsl = sum(sl*sw/5)
covswsl = Eswsl - Esw*Esl
covsw = E2sw - Esw*Esw
covsl = E2sl - Esl*Esl
covcoef = covswsl/(covsw*covsl)^0.5
covcoef