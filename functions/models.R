
model_2025 <- function(frokostpause, vakst, elasticitet, ledighed, holdbarhed){
  round(frokostpause * (vakst * 0.5 + elasticitet * 0.1 + ledighed * 0.25 + holdbarhed * 1.5) * 9876.543,0)
}

model_2060 <- function(frokostpause, vakst, elasticitet, ledighed, holdbarhed){
  round(round(frokostpause * (vakst * 0.5 + elasticitet * 0.1 + ledighed * 0.25 + holdbarhed * 1.5) * 11379.5 - 50, digits = -2),0)
}

#model_2025(frokostpause = 2, vakst = 1.7, elasticitet = -5, ledighed = 3.1, holdbarhed = 0.6)
#model_2060(frokostpause = 2.3, vakst = 1.7, elasticitet = -5, ledighed = 3.1, holdbarhed = 0.6)
