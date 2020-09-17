# 1. R 설치와 실행 

## 1. R 설치와 KoNLP 패키지 설치
1. 운영체제와 비트에 맞는 R(3.6.0)을 관리자 권한으로 설치하고 관리자 권한으로 실행
- R : https://cran.r-project.org/
  * 관리자권한으로 설치
  * R 3.6.0 우클릭-속성-호환성-관리자권한으로 이 프로그램 실행
- JAVA : https://www.java.com/ko/

2. KoNLP 설치
```R
install.packages("KoNLP")
```
3. KoNLP 실행
```R
library("KoNLP")
```

4. 패키지 설치 경로 확인
```R
.libPaths()
```


## 2. 스크립트 이용
- 파일-스크립트
- 필요한 부분만 드래그 후 실행 : Crtrl+R

## 3. 작업 폴더(디렉토리)
- 기본 작업폴더 : 내 문서(Doucuments)
- 작업 폴더 지정 : R 우클릭-속성-시작위치 변경

```R
# 현재 작업 폴더의 경로
getwd()

# 작업폴더 변경(윈도우) 
setwd("c:\\temps")
or
setwd("c:/temps")
```
