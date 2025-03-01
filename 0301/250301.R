# *****: 시험의 중요도 표시

## CSV(Comma-Separated Values)
## CSV -> 콤마로 구성된 데이터 ex) csv파일(엑셀) 중 하나를 메모장 연결프로그램으로 연결하면 콤마로 나누어진 데이터 파일형식을 확인할 수 있음
## CSV 파일은 데이터 분석에서 매우 많이 사용

# CSV 파일 장점: '광범위한 호환성'(R, Python, C, C++)'
# CSV <-- 데이터 프레임 <-- 분석하고 시각화

## R 저장, 불러오는 파일 경로 수정하기
setwd('D:/r-data'); # D 드라이브에 만들어둔 r-data 폴더로 경로 수정

print(list.files()) # 현재 경로에 있는 파일 목록 출력

# 엑설(csv)파일 불러오기
emp = read.csv('emp.csv') # 엑셀 불러오기
# View(emp)
# 퀴즈 -> 1~5행까지 출력, 아래 3행만 출력, 행/열 수 확인, 데이터프레임의 컬럼 별 데이터 타입 확인
# Answer
print(head(emp,5))
print(tail(emp,3))
print(dim(emp))
print(str(emp))

# 데이터 형 변환
# 예제1/ 문자-> 숫자로 변환
num = c('100','200','300')   # 숫자를 문자로 저장한 경우 (계산이 되지 않음)
num = as.numeric(num)        # 문자형태의 데이터를 숫자 데이터로 변환함
num = num * 2
print(num)                   # 계산이 됨

# 예제2/ 숫자-> 문자로 변환
num2 = c(100, 200, 300)   
num2 = as.character(num2)
print(num2)

# 날짜형을 변환(이유? 날짜관련 계산하기 위해서)
str(emp)
# 예제3/ 문자형 -> 날자형으로 변환
emp$HIREDATA = as.Date(emp$HIREDATE)
str(emp)

# 형변환 연습문제 #
data = data.frame(
  product_number = c('A001','A002','A003'), # 제품번호
  product_name = c('Skin', 'Sunscreen', 'Lipstic'), # 제품
  price = c('15000$','22000$','18000$')
  )

# 데이터 프레임 엑셀로 저장
write.csv(data, file = "화장품.csv", row.names = FALSE)
read.csv("화장품.csv")

# 1. '$' 기호 없애기
# gsub : 특정 문자 제거
data$price = gsub('\\$', "", data$price) # $ ->"" 변경
print(data)

# 2. 문자 -> 숫자로 변환
# price를 문자에서 숫자로 변환해서 str로 최종확인
data$price = as.numeric(data$price)
str(data)

# 3. 계산(총합)
print('제품총합')
print(sum(data$price)) # sum : 총합구하기(엑셀 함수랑 동일)

# 총합, 평균, 최소/최대 값 알아내기(emp)
# 1.전체 사원 총 급여
result = (sum(emp$SAL))
print(result)

# 2. 전체 사원의 급여 평균
result2 = mean(emp$SAL)
print(result2)

# 3. 사원 중 가장 많은 급여를 받는 사람의 급여 알아내기
result3 = max(emp$SAL)
print(result3)
cat("최댓값:", result3, "\n" )

# 4.사원 중 가장 적은 급여를 받는 사람의 급여 알아내기
result4 = min(emp$SAL)
cat("최솟값:", result4, "\n")

# 5. 다중 컬럼의 합, 평균 구하기
# 급여(SAL)와 커미션(COMM)합, 평균 구하기
# 5-1 합

total_sum = colSums(emp[,c("SAL","COMM")])    # col(컬럼)Sums(여러 컬럼 더하기)
print(total_sum)
# *****결측값: 관측/측정에 실패한 값
# NA(결측값)이 포함되어 합이 도출되지 않음
# 즉, NA를 제거 후 총합을 구해야함
# na.rm(remove) = TRUE : 결측값 제거
total_sum2 = colSums(emp[,c("SAL","COMM")],na.rm =TRUE) 
print(total_sum2)

# 5-2 퀴즈. 사원의 급여와 커미션 평균 계산, 단  NA는 제외
total_meanSAL = mean(emp$SAL)
total_meanCOMM = mean(emp$COMM, na.rm =TRUE)
print(total_meanSAL)
print(total_meanCOMM)
total_mean = mean(total_sum2)
print(total_mean)

# 5-2 답
total_mean0 = colMeans(emp[,c("SAL","COMM")],na.rm =TRUE) 
print(total_mean0)

# 단일 컬럼 COMM, 총합구하기 단, 결측값 제거
# *****na.omit(): 결측값 제거
comm = sum(na.omit(emp$COMM))
cat("COMM총합:",comm,"\n")

# 중앙값, 표준편차
# 표준편차: 데이터가 평균적으로 얼마나 퍼져있는지를 나타내는 통계적 지표 (흩어진 정도)
# ex) 한반 수학점수 평균이 78~82가 나옴, 평균점수가 80인 경우, 표준편차 작음
# 만약, 점수가 60~100까지 다양한 경우, 표준편차는 큼

# ***급여의 표준편차 구하기
# R은 sd() => Standard Deviation
sal_sd = sd(emp$SAL)    # 급여 표준편차
cat('급여 표준편차:',sal_sd,'\n')
# 도출된 급여 표준편차 값의 의미: '평균'으로부터 약+- 1267.568 만큼 퍼져있음을 의미


# 중앙값
sal_median = median(emp$SAL)
cat('급여 중앙값:', sal_median,'\n')

# ******최빈값, 분위수
# 최빈값: 데이터가 가장 많이 몰려있는 위치 값
# 분위수: 데이터를 크기순으로 정렬 후 특정 비율에 해당하는 값을 보여줌

# JOB 최빈값 구하기
# 1. table 문법
print(table(emp$JOB))  # JOB별 인원을 알수 있음
# 2. which.max
x = c(10, 23, 1000, 1, 5) # 숫자형 벡터 생성
print(which.max(x))  # 벡터에서 최댓값의 위치를 알려줌
# 3. 최빈값 구하기
job = names(which.max(table(emp$JOB)))
# names: 컬럼 이름 출력
cat('job 최빈값은:', job)

# 퀴즈. 부서번호의 최빈값 구하기
print(table(emp$DEPTNO))
deptno = names(which.max(table(emp$DEPTNO)))
cat('부서번호의 최빈값은:', deptno,'\n')
# 결과 값이 동일한 경우,  wihch.max 때문에 30은 조회 불가능

# 분위수
# 급여 분위수 알아내기
sal = quantile(emp$SAL)
print(sal)
# 0% 최솟값
# 50% 중앙값
# 100% 최댓값

# 특정 분위수 구하기 (하위10%, 상위 90%)
# sal = qauntile(emp$SAL) # 사분위수: 데이터를 4등분애서 나온 값
sal = quantile(emp$SAL, probs = c(0.1, 0.9)) 
print(sal)

# 연습문제2
# 결측치를 제거한 SAL(급여) 평균 구하기
mean_sal = mean(na.omit(emp$SAL))
cat('급여평균:', mean_sal,'\n')

# 결측지를 제거한 SAL(급여) 총합 구하기
sum_sal = sum(na.omit(emp$SAL))
cat('급여합:',sum_sal,'\n')

# 결측치를 제거한 COMM 표준편차 구하기
# COMM은 결측치가 많은 컬럼이므로 na.rm = TRUE
sd_comm = sd(emp$COMM, na.rm = TRUE)
cat('comm표준편차:',sd_comm,'\n')

# 데이터프레임 기초 통계량 전체 확인
# summary 사용하면 각 컬럼(열)별 기본 통계 확인
# print(summary())