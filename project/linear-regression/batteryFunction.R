#finds elements of B corresponding to element A, need to find specific heat later
Li = "Li"
Ca = "Ca"
Mg = "Mg"
Y = "Y"
Zn = "Zn"
findSpecificHeat = function(elementA){

  bIndices = which(battery_data$A == elementA)
  bElements = as.vector(battery_data$B[min(bIndices):max(bIndices)])
  specificHeat = as.vector(subset(elemental_data, Symbol %in% bElements, select = c("Specific Heat", "Symbol"), drop = TRUE))
  specificHeat = (data.frame(specificHeat))
  #specificHeat= (as.vector(unlist(specificHeat[1])))
  print(specificHeat)
  betterData = merge(battery_data, specificHeat, by.Symbol, by.B)
  #View(betterData)
  
  
  
  
}