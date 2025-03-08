# R 디렉토리 변경
setwd('D:/r-data') # 작업 디렉토리 변경
print(list.files()) #R 경로확인

# 데이터프레임 (행과 열(벡터))
# 데이터프레임 생성
df = data.frame(
  ID = c(1,2,3),
  Name = c('Brian', 'Bob', 'Jose')
)
# 출력
# View(df)
print(df$Name) #특정 열 출력

df$ID2 = df$ID + 1 #특정 열을 가져와서 값을 더한 후 
# 새로운 열에 추가함
print(df$ID2)

# 결측치(Missing Value) 'NA'로 표기
# 예제 데이터 생성
data = c(1 , 2 , NA, 4 , NA, 6)

# 결측치 확인
print(is.na(data)) # is -> ?, is.na => na가 있니?
# na가 있으면 true, 없으면 false

print(!is.na(data)) # !(부정) 반대


## csv(콤마로 구성된)파일 가져오기
emp = read.csv("emp.csv") # emp.csv 파일 읽어오기
#View(emp)

emp_clean = na.omit(emp) # omit: 제거하다
# View(emp_clean)

emp_comm = sum(emp$COMM, na.rm = TRUE) # rm: 제거하다
# print(emp_comm)


### 문제풀이_답변
### 데이터 전처리 -> 80~90%
## dplyr -> 데이터 프레임을 다루는 공구
install.packages('dylyr')

# 문제1. 직원 이름(ENAME), 직업(JOB), 그리고 부서 번호(DEPTNO) 컬럼(열)만 선택하세요.
emp_result = emp %>% select(ENAME,JOB,DEPTNO)
print(emp_result)

# 문제2. 급여(SAL)가 2000 이상인 직원만 필터링하세요.
# FILTER: 조건(WHERE)
sal2000 = emp %>% filter(SAL >= 2000)
print(sal2000)

# 문제3. 급여(SAL)를 기준으로 내림차순으로 정렬하세요.
# arrange: 정렬
# desc: 내립차순
sal_desc = emp %>% arrange(desc(SAL))
print(sal_desc)

# 문제4. 부서 번호(DEPTNO)가 30인 직원 중, 이름(ENAME)과 급여(SAL)만 선택하고 급여 순으로 내림차순 정렬하세요.
# 부서 번호(DEPTNO)가 30인 직원 중, => filter
# 이름(ENAME)과 급여(SAL)만 선택하고 => select
# 급여 순으로 내림차순 정렬 => arrange
name_sal30 = emp %>% filter(DEPTNO == 30) %>% select(ENAME,SAL) %>% arrange(desc(SAL))
print(name_sal30)

# 문제5. 직업(JOB)이 "MANAGER"인 직원 중, 부서 번호(DEPTNO)와 급여(SAL)를 선택하고 급여 순으로 오름차순 정렬하세요.
man_dept_sal = emp %>% filter(JOB == 'MANAGER') %>% select(DEPTNO, SAL) %>% arrange(SAL)
print(man_dept_sal)

# 문제6. 급여(SAL)가 1500 이상이고 부서 번호(DEPTNO)가 20인 직원의 이름(ENAME), 직업(JOB), 그리고 급여(SAL)를 선택한 뒤 이름 순으로 정렬(오름차순)하세요.
sal1500_20 = emp %>% filter(SAL >= 1500 & DEPTNO == 20 ) %>% select(ENAME, JOB, SAL) %>% arrange(ENAME)
print(sal1500_20)


# 문제7.  직업(JOB)이 "SALESMAN"인 직원 중, 급여(SAL)가 1500 이상인 직원의 이름(ENAME), 급여(SAL), 부서 번호(DEPTNO)를 선택하고 급여 순으로 내림차순 정렬하세요.
sale_1500 = emp %>% filter(JOB == 'SALESMAN'& SAL >= 1500) %>% select(ENAME,SAL,DEPTNO) %>% arrange(desc(SAL))
print(sale_1500)

# 문제 8. 부서 번호(DEPTNO)가 10 또는 30인 직원 중, 이름(ENAME), 직업(JOB), 급여(SAL)을 선택하고 이름 순으로 정렬하세요.
# in 연산자(or)
# filter(DEPTNO %IN% c(10,30)) = filter(DEPTNO == 10 | DEPTNO == 30)
dept_1030 = emp %>% filter(DEPTNO == 10 | DEPTNO == 30) %>% select(ENAME, JOB, SAL) %>% arrange(ENAME)
print(dept_1030)

# 문제 9. mutate()를 사용하여 급여(SAL)에 보너스(COMM, NA는 0으로 간주)를 더한 총 급여(Total_Salary) 열을 추가하세요.
# mutate: 컬럼(열) 추가
# Total_Salary = SAL + COMM
total_emp = emp %>% mutate(Total_Salary = SAL + ifelse(is.na(COMM), 0, COMM))
View(total_emp)

# 예시 답변: total_emp = emp %>% mutate(COMM = ifelse(is.na(COMM), 0, COMM),Total_Salary = SAL + COMM)
