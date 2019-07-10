#finds elements of B corresponding to element A, need to find specific heat later
findSpecificHeat = function(elementA){
  bIndices = which(battery_data$A == elementA)
  print(battery_data$B[min(bIndices):max(bIndices)])
  #specificHeat = subset(elemental_data, )
}