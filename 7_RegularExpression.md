# 7. 정규표현식

```R
# a 나 b를 포함하는 단어
[ab]

# a, b, c, d 만
[a-d]

# 0 또는 9
[09] 

# 모든 숫자를 포함하는 단어 찾기
[0-9] 

# a나 b로 시작하는 단어 찾기
^[ab]

# a나 b를 포함하지 않는 단어
[^ab] 

# 시작하는 글자가 a나 b가 아닌 단어 찾기
^[^ab] 

# 특수문자 제외, 문자와 숫자 찾기
[:alnum:]

# 특수문자 제외, 문자 찾기
[:alpha:] # 키보드에 있으면 특수문자 아니면 기호

```

## 1. grep() : 주어진 조건 골라 내는 함수
- grep("찾을 내용", data, 옵션)

### 예제 1
```R
grep_ex = c("a.txt","A.txt","ab.txt","123.txt","ba123.txt")
grep("^a",grep_ex)
```

**ouput**
```R
[1] 1 3
```

### 예제 2
```
grep_ex = c("a.txt"
```


## stringr()
### 1. stringr() 패키지 설치 및 실행
```
library("stringr")
install.packages("stringr")
```

### 예제 1
```R
# txt의 모든 a를 ?로 바꾸기
txt <- c("a.txt", "A.txt", "ba.txt", "123.txt", "12345")
str_replace_all(txt, 'a', '?')
```
**output**
```R
[1] "?.txt"   "A.txt"   "b?.txt"  "123.txt" "12345" 
```

### 예제 2
- 메타캐릭터 : 특별한 의미를 가진 글자나 기호
- 탈출문자 : Escape Character \\, 메타캐릭터의 의미를 취소시키는 글자
```R
# txt의 모든 .을 지우기
txt <- c("a.txt", "A.txt", "ba.txt", "123.txt", "12345")
str_replace_all(txt, '\\.', '?')
```
**ouput**
```R
[1] "atxt"   "Atxt"   "batxt"  "123txt" "12345"
```
