# R programming 기초 및 실습 

- [1_Install.md : R 설치와 실행](./1_Install.md) 

- [2_Datatype.md : 자료형과 연산](./2_Datatype.md)

- [3_ReadWrite.md : 데이터 열기, 저장하기](./3_ReadWrite.md)

- [4_Function.md	: 사용자정의 함수](./4_Function.md)

- [5_Condition.md : 조건문](./5_Condition.md)

- [6_Loop : 반복문](./6_Loop.md)

- [7_RegularExpression : 정규표현식](./7_RegularExpression.md)

- [8_TextMining_KR : R을 활용한 한글 텍스트 분석](./8_TextMining_KR.md)

- [9_TextMining_EN : R을 활용한 영어 텍스트 분석](./9_TextMining_EN.md)

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
