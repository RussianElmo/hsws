a <- c(NA,NA,FALSE,TRUE)
class(a)
char = c(8, 0, 68)

x <- data.frame(Height=height, 
           Age=age,
           Handedness=handedness)

row.names(x) <- c("a", "b", "c")
print(x)
