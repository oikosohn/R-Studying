install.packages("KoNLP")
# 한국서버 선택 후 OK

# 설치한 패키지 실행
library("KoNLP")

txt <- '피자는 치킨보다 맛있다'
extractNoun(txt)
