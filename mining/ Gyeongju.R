##############################################################
## 예제 1. 경주 여행지 추천 소스코드
##############################################################
setwd("c:\\temps\\")  
install.packages("KoNLP") 
install.packages("wordcloud") 
install.packages("stringr")

library(stringr)
library(KoNLP)  
library(wordcloud)
 
useSejongDic() 


data1 <- readLines("경주여행_지식인_2016.txt",encoding="UTF-8")
head(data1,10)
length(data1) # 총 데이터 건수

data1 <- unique(data1)

# 모든글자와 모든 숫자를 제외한 나머지를 공백으로 바꾸어라
data2 <- str_replace_all(data1,"[^[:alpha:][:digit:]]"," ")

data3 <- extractNoun(data2)
head(data3,5)

data4 <- lapply(data3, unique) # 각 리스트안에서 중복된 단어들 제거하기

# data4를 벡터로 바꾸고 \\d(숫자)를 없애기
data5 <- gsub("\\d+", "", unlist(data4)) 

# 스프링을 스프링돔으로 수정
data5 <- gsub("스프링", "스프링돔", data5)

data5 <- gsub("파크", "워터파크", data5) 

# ^^ 표시 없애기
data5 <- gsub("\\^", "", data5)

# 교촌, 마을, 한옥 중 하나 나오면 교촌한옥마을로 변경
# 만약 저 교촌이 교촌치킨이라면.....
# 주상이 어떻게 쓰였는지 확인해야...
data5 <- gsub(paste(c("교촌","마을","한옥"),collapse='|'), "교촌한옥마을", data5)

# 만약 저 주상이 주상전하라면....
# 주상이 어떻게 쓰였는지 확인해야...
data5 <- gsub(paste(c("주상","절리"),collapse='|'), "주상절리", data5)


data5 <- gsub(paste(c("보문단지","보문"),collapse='|'), "보문관광단지", data5)
data5 <- gsub(paste(c("달동네","추억","추억의달동네"),collapse='|'), "추억의달동네", data5)
data5 <- gsub(paste(c("한우","떡갈비"),collapse='|'), "한우수제떡갈비", data5)
data5 <- gsub(paste(c("게스트","하우스"),collapse='|'), "게스트하우스", data5)
data5 <- gsub(paste(c("월성","반월성"),collapse='|'), "반월성", data5)
data5 <- gsub(paste(c("맛집이","맛집"),collapse='|'), "맛집", data5)
data5 <- gsub(paste(c("교리","김밥","계란지단"),collapse='|'), "교리김밥", data5)
data5 <- gsub(paste(c("천마","천마총"),collapse='|'), "천마총", data5)
data5 <- gsub(paste(c("박물관","테디베어","테디베어박물관"),collapse='|'), "테디베어박물관", data5)
data5 <- gsub("월드", "월드엑스포", data5)
data5 <- gsub("순두부", "멧돌순두부", data5)
data5 <- gsub(paste(c("현대","밀면"),collapse='|'), "현대밀면", data5)
data5 <- gsub("한정", "이조한정식", data5)
data5 <- gsub("블루", "블루원워터파크",data5)

data5 <- lapply(data5, unique) # 각 리스트안에서 중복된 단어들 제거하기

# 필터로 필요없는 것 지움
data6 <- sapply(data5, function(x) {Filter(function(y) {nchar(y) <= 6 && nchar(y) > 1 },x)} ) # 글자수로 제거하기, 2글자 이상 6글자 이하만 출력


# table() : 빈도 계산, 인자는 벡터여야 함
wordcount <- table(unlist(data6)) 
wordcount <- Filter(function(x) {nchar(x) <= 10} ,wordcount)

# decreasing=T 내림차순, 언급된 순서 100위까지 추림
head(sort(wordcount, decreasing=T),100)


# UTF-8일 경우
# txt <- readLines("경주gsub.txt",encoding="UTF-8")

# 지울 단어
txt <- readLines("경주여행_삭제단어.txt")
txt
cnt_txt <- length(txt)
cnt_txt
for( i in 1:cnt_txt) {
      data5 <- gsub((txt[i]),"", data5)  
      }
head(data5,5)

data6 <- sapply(data5, function(x) {Filter(function(y) { nchar(y) >=2 },x)} )
head(data6,5)
 
#아래 과정이 필터링이 완료된 단어들을 언급 빈도수로 집계하는 과정입니다.
wordcount <- table(unlist(data6))
head(sort(wordcount, decreasing=T),100)



library(RColorBrewer) 
palete <- brewer.pal(7,"Set2")

wordcloud(names(wordcount),freq=wordcount,scale=c(5,1),rot.per=0.25,min.freq=28,
random.order=F,random.color=T,colors=palete)
