# 8. R을 활용한 영어 텍스트 분석
## 1. KoNLP() : 한글 텍스트 분석
### 1. extractNoun() : 문장 분석
- 한국어의 어려움

```
예시 문장 : 나는 사과와바나나가 좋아요

1. 한국말 조사에 따라 뒷말 달라져...
사과는
사과만
사과도
사과와 

2. 띄어쓰기 받침도 고쳐야...
```
### 2. 사전 활용

#### 1. useSejongDic()
- 업데이트 된 사전
```
useSejongDic()
```
**Ouput**
```
Backup was just finished!
WARNING: Rtools is required to build R packages, but is not currently installed.
...
```
#### 2. 사전만들기

mergeUserDic(data.frame(c('유관순','안중근',c('ncn'))))
```
txt <-"우리는 유관순 의사와 안중근 의사가 독립투사임을 반드시 기억합니다"
extractNoun(txt)

```

```
[1] "우리"     "유관"     "순"       "의사"     "안중"     "근"      
[7] "의사"     "독립투사" "기억합니"

```

메모장에 단어치기
```
mergeUserDic(data.frame(readLines("mergefile.txt"),"ncn")) 
extractNoun(txt)
```

```
[1] "우리"     "유관순"   "의사"     "안중근"   "의사"     "독립투사"
[7] "기억합니"
```



#### 3. 중복값 제거

##### unique()

```
txt6 = unique(txt5)
txt6
```
**Ouput**
```

```

##### lapply()와 uinque 
```
txt7 = lapply(txt6,unique)
txt7
```


#### 4. 필터링 (반드시 벡터형태여야) : 필요없는 단어 지우기
- 벡터 형태
```
바나나
복숭아
사과
```
- 리스트
```
바나나, 사과, 바나나
```
##### 0. list를 vector로 변환
```
unlist(txt)
```

##### 1. str_reaplace_all()
- 없애고 싶은 글자 삭제

```
# 나 지우기
str_replace_all(txt, "나". "")
```

##### 2. gsub()
- gsub("변경 전 글자", "변경 후 글자", data)
```
gsub("나", "", txt)
```
-
```
```

##### 3. Filter()
- 없애고 싶은 글자의 수 지정
- Filter(남겨둘 조건)

#### 5. 워드클라우드2
wordcloud()



