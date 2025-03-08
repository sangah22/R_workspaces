# dplyr 문제
setwd('D:/r-data')
print(list.files()) 

emp = read.csv('emp.csv')
# View(emp)

# install.packages('dplyr')
library(dplyr)

# 문제 1: 급여(SAL)가 3000 이상인 직원들의 이름(ENAME)과 직업(JOB)을 출력하세요.
# 힌트 : filter(), select()
result1 = emp %>% filter(SAL >= 3000) %>% select(ENAME, JOB)
print(result1)

# 문제 2: "RESEARCH" 부서에 근무하는 직원들의 이름(ENAME)과 급여(SAL)를 출력하세요.
# 힌트 :  inner_join(), filter(), select()
dept = read.csv('dept.csv')
emp_with_dept = emp %>% inner_join(dept, by = "DEPTNO")
# View(emp_with_dept)
result2 = emp_with_dept %>% filter(DNAME == 'RESEARCH') %>% select(ENAME, SAL)
# View(result2)

# 문제 3: 직업(JOB)별 평균 급여(SAL)를 계산하고 출력하세요.
# 힌트 : group_by(), summarize()
result3 = emp %>% group_by(JOB) %>% summarize(AVG_SAL = mean(SAL, na.rm = TRUE))
print(result3)

# 문제 4: 각 부서(DNAME)별 직원 수를 계산하고 출력하세요.
# 힌트 : group_by(), summarize()
# n() (SQL == count())
result4 = emp_with_dept %>% group_by(DNAME) %>% summarize(EMP_COUNT= n()) 
print(result4)

# 문제 5: 고용일(HIREDATE)이 "1981-01-01" 이후인 직원들의 이름(ENAME), 직업(JOB), 고용일(HIREDATE)을 출력하세요.
# 힌트 : filter(), select()
result5 = emp %>% filter(HIREDATE > as.Date('1981-01-01')) %>% select(ENAME, JOB, HIREDATE)
print(result5) 

# 문제 6: 부서별(DEPTNO)로 그룹화하여 총 급여(SAL)의 합계를 계산하고 출력하세요.
# 힌트 : group_by(), summarize()
result6 = emp %>% group_by(DEPTNO) %>% summarize(Total_SAL = sum(SAL))
print(result6)

# 문제 7: *****커미션(COMM)이 결측치가 아닌 직원들의 이름(ENAME), 커미션(COMM)을 출력하세요.
# 힌트 : filter(!is.na()), select()
result7 = emp %>% filter(!is.na(COMM)) %>% select(ENAME,COMM)
print(result7)

# 문제 8: "SALES" 부서에서 근무하는 직원들의 이름(ENAME), 급여(SAL), 커미션(COMM)을 출력하세요.
# 힌트 : inner_join(), filter(), select() 
result8 = emp_with_dept %>% filter(DNAME == 'SALES') %>% select(ENAME, SAL, COMM)
print(result8)

# 문제 9: 각 부서(DNAME)별로 가장 높은 급여를 받는 직원의 이름(ENAME)과 급여(SAL)를 출력하세요.
# 힌트 : group_by(), slice_max(), select()
result9 = emp_with_dept %>% group_by(DNAME) %>% slice_max(SAL, n = 1) %>% select(ENAME,SAL)
print(result9)

# 문제 10: 직업(JOB)이 "MANAGER"인 직원들의 이름(ENAME), 부서명(DNAME), 급여(SAL)을 출력하세요.
# 힌트 :  inner_join(), filter(), select()

result10 = emp %>% inner_join(dept, by= 'DEPTNO') %>% select(ENAME,DNAME,SAL)
print(result10)