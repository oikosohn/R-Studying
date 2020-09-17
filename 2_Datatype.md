# 2 . 자료형과 연산

## 1. 숫자형
```R
2.5-1.5
```
1

```R
10 %% 3
```
1

```R
5e2
```
500

```R
5e-1
```
0.5

```R
5e-2
```
0.05

```R
celing(4.3)
```
5

```R
floor(4.3)
```
4

```R
round(5.33,0)
```
5

```R
round(5.33,1)
```
5.3

```R
# 소수점 이하 삭제
trunc(5.5)
```
5

## 2. 문자

```R
# 숫자
class(5)

#문자
class('5')

#문자
class("5")

```
```R
1+'2'
```
Error in 1 + "2" : 이항연산자에 수치가 아닌 인수입니다


## 3. 날짜

```R
# R에서 날짜 핸들링하는데 용이한 패키지
lubridate()
```

## 4. NA와 NULL 
- 데이터 분석시 신경 많이 써야한다. 분석 시 반드시 처리해야함 
1. NA : 데이터가 있는데 잘 몰라서 사용할 수 없는 데이터
   * 산술연산 결과 : NA
   * 비교연산 결과 : NA
2. NULL : 데이터가 아예 없는 것

```R
3+NA
```
NA

```R
3<NA
```
NA

```R
sum(1,2,NA)
```
NA

```R
sum(1,2,NULL)
```
3

## 5. 벡터
```R
no <- c(100,200,300)
no
```
100 200 300

```R
# 동일한 유형의 데이터를 담아야 한다
no2 <- c(1,2,'3')
no2
```
"1" "2" "3"

```R
# Indexing
var <- c('피자','치킨','햄버거')
var[2]
```
치킨

```R
# Slicing
var[c(1,3)]
```
"피자", "햄버거"

```R
# Length of Vector
length(var)
```
3

```R
var1 = c(1,2,3)
var2 = c(4,5,6)
var3 = c(1,2,3,4)
```

```R
# Union 
union(var1,var2)
```
1 2 3 4 5 6

```R
# Set difference
setdiff(var3,var1)
```
4

```R
# Intersect
intersect(var1,var3)
```
3
```R
# vector 안  특정 데이터 조회하기
1 %in% var1
```
True

## 6. 행렬
- 열 먼저 채워짐
```R
# row = 2
mat1 <-matrix(c(1,2,3,4), nrow=2)
mat1
```
output:
```R
    [,1] [,2]
[1,]    1    3
[2,]    2    4
```  

#
```R
# Transpose?
mat2 <-matrix(c(1,2,3,4), nrow=2, byrow=TRUE)
mat2
```
output:
```R
     [,1] [,2]
[1,]    1    2
[2,]    3    4
```  

#
```R
mat3 = matrix(c(1:20),nrow=4)
mat3
mat3[c(1,3), c(1,3,4)]
```
```R
    mat3[c(1,3), ]
```
output:

```R
      [,1] [,2] [,3] [,4] [,5]
[1,]    1    5    9   13   17
[2,]    3    7   11   15   19
```
```
    mat3[c(1,2), ]
```
output:

```R
      [,1] [,2] [,3] [,4] [,5]
[1,]    1    5    9   13   17
[2,]    2    6   10   14   18
```
```R
mat3[c(1,3), c(1,2,4)]
```
ouput:
```R
     [,1] [,2] [,3]
[1,]    1    5   13
[2,]    3    7   15
```

## 7. 배열
```R
# dim = c(가로,세로,높이)
array1 = array(c(1:12), dim=c(2,2,3))
array1
```
ouput:
```R
, , 1

     [,1] [,2]
[1,]    1    3
[2,]    2    4

, , 2

     [,1] [,2]
[1,]    5    7
[2,]    6    8

, , 3

     [,1] [,2]
[1,]    9   11
[2,]   10   12

```

## 8. 리스트
- 서로 다른 자료형도 저장가능
```R
list1 = list(NUM=1000, NAME="Kim", PRICE="500")
list1
```
ouput:
```R
$NUM
[1] 1000

$NAME
[1] "Kim"

$PRICE
[1] "500"
```


``` R
list2 = list( student1 = c(NAME='Kim',BIRTH='2000',NUM='1111'),
              student2 = c(NAME='Lee',BIRTH='2002',NUM='1112'),
              student2 = c(NAME='Park',BIRTH='2007',NUM='1113') )
list2
```
output:
```R
$student1
  NAME  BIRTH    NUM 
 "Kim" "2000" "1111" 

$student2
  NAME  BIRTH    NUM 
 "Lee" "2002" "1112" 

$student2
  NAME  BIRTH    NUM 
"Park" "2007" "1113" 

```

## 9. 데이터프레임
```R
sID=c(01,02,03)
name=c("Kim","Lee","Park")
birth=c("1980","1985","1990")
member=data.frame(STUDENT_NUM=sID, NAME=name, BIRTH=birth)
member
```
ouput:
```R
  STUDENT_NUM NAME BIRTH
1           1  Kim  1980
2           2  Lee  1985
3           3 Park  1990
```
```R
member$NAME
```
ouput:
```R
[1] Kim  Lee  Park
Levels: Kim Lee Park
```

```R
member[c(1,3),c(1,2)]
```
ouput:

```R
STUDENT_NUM NAME
1           1  Kim
3           3 Park
```

```R
d1 = data.frame(name=c("Kim", "Lee"), height=c(160, 170))
d2 = data.frame(name=c("Choi"),height=c(175))
merge(d1,d2, all=T)
```
ouput:
```R
 name height
1  Kim    160
2  Lee    170
3 Choi    175
```

```R
d3 = data.frame(name="Park", height=180)
member = rbind(d1, d3)
```
ouput:
```R
name height
1  Kim    160
2  Lee    170
3 Park    180
```

```R
member = cbind(member, data.frame(grade=c(1,2,3,4)))
member
```

ouput:
```R
  name height grade
1  Kim    160     1
2  Lee    170     2
3 Park    180     3
```

