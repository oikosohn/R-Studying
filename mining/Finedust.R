#Step 1. 작업 디렉토리 설정 및 필수 패키지 설치와 실행
setwd("c:\\temps")  
install.packages("KoNLP") 
install.packages("wordcloud") 
install.packages("stringr")

library(stringr)
library(KoNLP)  
library(wordcloud)

useSejongDic() 

#Step 2. 원본 파일 불러오기
data1 <- readLines("미세먼지_지식인.txt",encoding="UTF-8")
head(data1,10)

#Step 3. 특수문자와 중복 댓글 제거하기
data1 <- unique(data1)  # 중복되는 줄 제거하기
length(data1)

# 아래 코드는 한글과 숫자와 영어를 제외한 특수문자를 모두 삭제하는 코드입니다
data2 <- str_replace_all(data1, "[^[:alpha:][:digit:][:blank:]]" , " " )

#Step 4. 한글 키워드중 명사 추출하기
data3 <- extractNoun(data2)
head(data3,5)


# 더 추가하기
#Step 5. 불용어 제거 및 단어 정제 하기
 
data4 <- unlist(data3)
data5 <- gsub("\\^", "", data4) 
data5 <- gsub("PM2", "PM2.5", data5)
data5 <- gsub("아토", "아토피", data5)
data5 <- gsub("조금씩", "", data5)
data5 <- gsub(paste(c("미세", "먼지","미세먼지"),collapse='|'),"미세먼지", data5)
data5 <- gsub("\\d+","",data5)
# 모음 제거
data5 <- gsub('(ㅜ|ㅠ)','',data5)
# 자음 제거
data5 <- gsub('[ㄱ-ㅎ]','',data5)
# 답변자에 위닉스 많아서...
data5 <- gsub("위닉", "위닉스", data5)
data5 <- gsub(paste(c("중국에서", "중국을","중국과","중국의","중국,","중국이","중국에서도"),collapse='|'),"중국", data5)
data5 <- gsub(paste(c("http", "https"),collapse='|'),"", data5)
data5 <- gsub("호두유기름을", "호두유기름", data5)

head(data5,5)

length(data5)


#Step 6. 임시 집계하여 추출된 키워드 확인
data6 <- Filter(function(y) {nchar(y) <= 10 & nchar(y) >1 },data5)
wordcount <-table(unlist(data6))
head(sort(wordcount, decreasing=T),100)

#Step 7. 필요 없는 명사들 다시 필터링하기

# 아래의 미세먼지gsub.txt 파일은 직접 만들어야 합니다.
txt <- readLines("미세먼지_삭제단어.txt",encoding="UTF-8")
txt
cnt_txt <- length(txt)
cnt_txt
for ( i in 1:cnt_txt ){
      data6 <- gsub((txt[i]),"", data6)   
      }

data7 <- Filter(function(y) {nchar(y) <= 10 && nchar(y) >1 },data6)
wordcount2 <- table(data7)
head(sort(wordcount2, decreasing=T),100)

#Step 8. 워드 클라우드로 시각화 하기

par(oma=c(0.1,0.1,0.1,0.1)) ## 출력될 화면의 여백 크기 지정하기
palete <- brewer.pal(7,"Set1")
wordcloud(names(wordcount2),freq=wordcount2,scale=c(5,1),rot.per=0.25,min.freq=10,
random.order=F,random.color=T,colors=palete)

#Step 9. 완성된 워드 클라우드를 그림파일로 저장합니다.
getwd( )

savePlot("wordcloud.png" , type="png")
