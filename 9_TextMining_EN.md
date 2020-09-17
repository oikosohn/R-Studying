# 9. R을 활용한 영어 텍스트 분석
## 2. tm() : 영어 텍스트 분석
### Corpus
- tm패키지가 처리할 수 있는 말뭉치(Corpus) 형태로 변환
- Corpus란 영어사전 샘플을 의미
-- 공백을 잘라서 단어를 일렬로 만든 것 = Corpus
```
# Tokenizing : 공백을 잘라서 단어를 일렬로 만듦
corp1 = VCorpus(VectorSource(data1))
corp1
```

```
# 행렬로 만듦
tdm = TermDocumentMatrix(corp1)
tdm
m <- as.matrix(tdm)
m
```

```
# 기본 불용어와 추가로 안 쓸 단어(and,but,not)
sword2 <- c(stopwords('en'),"and","but","not") 

# 불용어 제거
corp2 <- tm_map(corp2,removeWords,stopword2)

corp3 <-TermDocumentMatrix(corp2,control=list(wordLengths=c(4,Inf)))
corp4 = as.matrix(corp3)

# column 이름 바꾸기
colnames(corp4) <- c(1:4)

# 문서유서도 측정(ex:논문 표절)에 많이 쓰임
feq = sort(colSums(corp4),decreasing=T)
head(freq,20)

# 언급횟수 2회인 것 출력
findFreaTerms(corp4,2)



```
