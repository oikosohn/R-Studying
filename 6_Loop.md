# 6. 반복문
## 1. while 문 - 조건

### 예제 1
```R
char <- c('a','b','c','d','e')
cnt <- length(char)
x <- 0
while (x < cnt) { x <- x + 1
					 if (char[x]=='c') next #continue / break
					print(char[x]) } 
```
ouput:
```R
[1] "a"
[1] "b"
[1] "d"
[1] "e"
```

### 예제 2
```R
fruit <- c("apple", "banana", "orange")
cnt <- 0
while (length(fruit)>cnt) {
					cnt <- cnt + 1
  					print( paste('fruit :', fruit[cnt]) )
      			}
```
ouput:
```R
[1] "fruit : apple"
[1] "fruit : banana"
[1] "fruit : orange"
```

### 예제 3
```R
fruit <- c("apple", "carrot", "orange")
cnt <- 0
while (length(fruit)>cnt) {
					cnt <- cnt + 1
					if (fruit[cnt] == "carrot") {
						print( paste('vegitable :',fruit[cnt]))
						}
					else {
						print( paste('fruit :', fruit[cnt]))
						}
      			}
```
ouput:
```R
[1] "fruit : apple"
[1] "vegitable : carrot"
[1] "fruit : orange"
```

## 2. for 문 - 횟수

### 예제 1
```R
for_ex <- function(x) {
			num = 0
			for ( i in 1 : x ) { num = num + i }
			print(num)
			}
for_ex(100)
```
ouput : 5050

### 예제 2
```R
gugudan = function(x) { for( i in 1 : 9 ) { print(paste( x , "X", i, "=", x*i )) } }
gugudan(3)
```

output :
```R
[1] "3 X 1 = 3"
[1] "3 X 2 = 6"
[1] "3 X 3 = 9"
[1] "3 X 4 = 12"
[1] "3 X 5 = 15"
[1] "3 X 6 = 18"
[1] "3 X 7 = 21"
[1] "3 X 8 = 24"
[1] "3 X 9 = 27"
```

### 예제 3
```
fruit <- c("apple", "carrot", "orange")
for (i in 1 : length(fruit)) {
				if (fruit[i] == "carrot") { print( paste('vegitable :',fruit[i])) }
				else {	print( paste('fruit :', fruit[i])) }
      				}
```

output:
```R
[1] "fruit : apple"
[1] "vegitable : carrot"
[1] "fruit : orange"
```

### 예제 4
```R
for_ex <-function(x) { for( i in 1: x) { print(paste("number :", i*10))} 
						}
for_ex(3)
```

ouput :
```R
[1] "number : 10"
[1] "number : 20"
[1] "number : 30"
```

### 예제 5
```R
gugudan = function(x,y) { for(m in x : y) {
						 { for( i in 1 : 9 ) 
							{ print(paste( m , "X", i, "=", m*i ))
						  }}}}
gugudan(2,3)						  
```

ouput : 
```R
[1] "2 X 1 = 2"
[1] "2 X 2 = 4"
[1] "2 X 3 = 6"
[1] "2 X 4 = 8"
[1] "2 X 5 = 10"
[1] "2 X 6 = 12"
[1] "2 X 7 = 14"
[1] "2 X 8 = 16"
[1] "2 X 9 = 18"
[1] "3 X 1 = 3"
[1] "3 X 2 = 6"
[1] "3 X 3 = 9"
[1] "3 X 4 = 12"
[1] "3 X 5 = 15"
[1] "3 X 6 = 18"
[1] "3 X 7 = 21"
[1] "3 X 8 = 24"
[1] "3 X 9 = 27"
```
							 
