# R 디렉토리 변경
 setwd('D:/r-data')
 print(list.files())  # 해당 경로 파일 확인
 
# CSV(엑셀) 불러오기
data = read.csv('student_data.csv')
# View(data)

# 각 과목(Math, Science, English)의 평균 점수를 계산하세요

math = mean(data$Math)
cat('수학 평균 점수:', math,'\n')

science = mean(data$Science)
cat('과학 평균 점수:', science,'\n')

english = mean(data$English)
cat('영어 평균 점수:', english ,'\n')

# 컴퓨터 점수 총합을 구하시오. *na.rm = TRUE

computer = sum(data$Computer, na.rm = TRUE)
cat('컴퓨터 점수 총합:', computer,'\n')

# 영어과목 표준편차
# sd = standard deviation (표준편차)
sd_eng = sd(data$English)
cat('영어성적 표준편차:',sd_eng,'\n')
# 결과값 분석: 전체 영어성적은 평균으로 부터 +- 4.9 만큼 분포되어 있음

# 과학 과목 중앙값
median_sci = median(data$Science)
cat('과학성적 중앙값:',median_sci,'\n')

# 수학 사분위수 
q_math = quantile(data$Math)
cat('수학 사분위수:',q_math,'\n')
print(q_math)

#최댓값, 최솟값
#수학 과목의 최댓값, 최솟값 구해보기
math_max = max(data$Math) # 최댓값
math_min = min(data$Math) # 최솟값
cat('최솟값:', math_max,'\n')
cat('최댓값:', math_max,'\n')

# table
print(table(data$English)) # 점수별 인원 통계

# 데이터프레임 기초 통계량 전체 확인
# summary 사용하면 각 컬럼(열)별 기본 통계 확인
print(summary(data))

# install.packages("ggplot2")
library(ggplot2)

graph_data = data.frame(
  x = c('수학평균', '영어평균', '과학평균'),
  y = c(math, english, science)  # 각 과목 평균값
)


#  그래프 생성
 result = ggplot(data = graph_data,
                 aes(x = x, y = y)) +
   geom_col(fill = 'steelblue') +
   labs(``
     title = '과목 평균',
     x = '과목',
     y = '평균점수'
   ) + 
   theme_minimal()
 print(result)
 