
#finds elements of B corresponding to element A, need to find specific heat later
Li = "Li"
Ca = "Ca"
Mg = "Mg"
Y = "Y"
Zn = "Zn"
elementA=c(Li,Ca,Mg,Y,Zn)

findSpecificHeat = function(elementA){
  
  bIndices = which(battery_data$A == elementA)
  bElements = as.vector(battery_data$B[min(bIndices):max(bIndices)])  #gives list of elements that
  #could help with the battery
  # print(sort(bElements, index.return = TRUE))
  specificHeat = as.vector(subset(elemental_data, Symbol %in% bElements, select = c("Specific Heat", "Symbol"), drop = TRUE))
  specificHeat = data.frame(specificHeat)   #creates a data frame of the heat capacity and bElements, ordered numerically,
  #not alphabetically like we need
  # specificHeat= (as.vector(unlist(specificHeat[1])))
  #sort(specificHeat$A)
  print(specificHeat)
  intermediateData1=merge(battery_data, specificHeat, by.x = "B", by.y = "Symbol", all.x = TRUE)
  intermediateData2=intermediateData1[,c(2,1,3,4,5)]
  intermediateData2[order(intermediateData2$A), ]
  battery_data=intermediateData2[order(intermediateData2$A), ]
  
}

graph = function(x, y, title, inputData, xTitle, yTitle){
  plot(formula = y~x, data = inputData, main = title, ylab = yTitle, xlab = xTitle, col = "Blue")
  abline(lm(y~x), col = "Sky Blue")
  summary(lm(y~x))
}


predict = function(specificHeat, a, b){
  #y = a + bx
  capacity = a + b * specificHeat
  print(capacity)
}

percentError = function(measured, actual){
  return((measured - actual)/actual * 100)
  
}

combo = function( B){
  specificHeat = as.vector(subset(elemental_data, Symbol = B, select = c("Specific Heat"), drop = TRUE))
  print(specificHeat)
}


multiColored = function(){
  p = ggplot() +
    geom_point(data = predKnow, aes(x = predKnow$`Specific Heat`, y = predKnow$Predicted), color = 'red') +
    geom_point(data = predKnow, aes(x = predKnow$`Specific Heat`, y = predKnow$Known), color = 'blue') +
    xlab('Specific Heat') +
    ylab("Capacity")
}