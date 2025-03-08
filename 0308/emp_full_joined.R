library(dplyr)  # 로드

emp = read.csv('emp.csv') #파일 불러오기
# group by + summarise
# group by(~로): 
# 특정 열(컬럼) 묶어 그룹화합니다. 
group_job = emp %>% group_by(JOB)
print(group_job)

# R에 group by는 summarise, mutate, filter 등의 기능과 함께
# 사용하여 그룹별로 계산을 진행합니다.

# 부서별(group_by) 평균(mean) 급여 계산
# summarise: 요약하다
dept_avg_sal = emp %>% 
  group_by(DEPTNO) %>%
  summarise(AVG_SAL = mean(SAL))
print(dept_avg_sal)

# 직업별 평균 급여 계산, 단 평균 급여 내림차순 정렬하시오.
job_avg_sal = emp %>% 
  group_by(JOB) %>%
  summarise(AVG_SAL = mean(SAL)) %>%
  arrange(desc(AVG_SAL)) #내림차순 정렬
print(job_avg_sal)

# 직업(JOB)별 직원 수 계산, 단 직원 수 내림차순 정렬
job_count = emp %>% 
  group_by(JOB) %>%
  summarise(EMP_COUNT = n()) %>% # n() : 행 개수
  arrange(desc(EMP_COUNT))
print(job_count)

# CSV 파일 2개 이용하기
emp = read.csv('emp.csv')
dept = read.csv('dept.csv') 
# 두 데이터프레임 병합하기
# 교집합 컬럼을 이용한 데이터 병합(JOIN)
# inner_join: 내부조인
emp_with_dept = emp %>% 
  inner_join(dept, by = "DEPTNO")
# View(emp_with_dept)

# 40번 부서인 운영팀도 출력하기
# left : 왼쪽
# dept %>% left_join : 왼쪽에 있는 데이터프레임 데이터를
# 모두 병합하겠다.
# *****left_join
emp_with_dept = dept %>% left_join(emp, by = "DEPTNO")
#View(emp_with_dept)

# full_join(합집합) 모두 다 병합
emp_full_joined = full_join(emp,dept,by = "DEPTNO")
#View(emp_full_joined)

# 근무지가 "DALLAS"인 직원들의 `이름` 출력하기
result = emp %>% # DALLAS라는 컬럼(열)이 없기에 조인부터
  inner_join(dept, by = "DEPTNO") %>%
  filter(LOC == "DALLAS") %>%
  select(ENAME, LOC)
print(result)

# Slice : 특정 위치 조회
result = emp %>% slice(2,4) #2행과 4행 출력
print(result)

result = emp %>% slice(1 : 5) #1행 부터 ~ 5행까지
print(result)
# 부서별(group by) 최대 연봉 사원 조회
# n : 행 , n = 1 => 행 1개만 
result = emp %>% group_by(DEPTNO) %>% slice_max(SAL, n = 1)
print(result)

## 날짜/시간 데이터 처리
# as.Date: 문자열을 날짜형으로 변환
# difftime: 두 날짜 간의 차이를 계산
# format <=***시험&실무***

dates = c('2025-03-08','2025-03-01','2025-01-01') # 컴퓨터는 문자로 인식
dates = as.Date(dates) # 날짜형으로 변환
str(dates) #데이터 타입 확인

#오늘 날짜 조회
today = Sys.Date()
print(today)

#오늘 날짜와 각 날짜의 차이를 계산
result = today - dates
print(result)

#각 날짜에 일수 더하기
result = dates + 7
print(result) # 각 날짜에 7일을 더한 결과

# 날짜 포맷 변경
formatted_dates = format(dates, '%Y년 %m월 %d일')  # 20xx년 x월 x일
print(formatted_dates)

formatted_dates2 = format(dates, '%y년 %m월 %d일') # xx년 x월 x일
print(formatted_dates2)

# 두 날짜 간의 차이 계산
hire_date = as.Date('2025-01-02')  # 입사 날짜
current_date = as.Date('2025-02-13') # 특정 날짜

# 근속일 계산
# units = 'mins': 두 날짜 간의 분
# units = 'hours': 두 날짜 간의 시간
# units = 'weeks': 두 날짜 간 주
days = difftime(current_date, hire_date, units = 'weeks')
print(days)

# 특정 기간에 고용된 직원 조회
# 81년 01월 01일 ~ 81년 12월 31일 사이에 입사한 직원

result = emp %>%
  filter(HIREDATE >= as.Date('1981-01-01')& HIREDATE <= as.Date('1981-12-31'))
print(result)

# 월별(group by) 고용된 사원 수 집계

# 월 추출
emp&HIRE_MONTH = format(emp$HIREDATE, '%Y - %m')
print(emp$HIRE_MONTH)
month_hire = emp%>%
  group_by(HIRE_MONTH) %>%
  summarise(EMP_COUNT = n()) #n():행 수
print(month_hire)

# substr()
# strsplit()
# gsub()
# 데이터 스케일링, 데이터 이상치 <- 5회차 수업진행예정




