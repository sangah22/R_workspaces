###  *****가장 중요한 부분
### 데이터분석 80~90 필터링(전처리)
# 필터링 -> 쓸모없는 데이터 거르기
# 1. subset 
# 2. ****dplyr(디플라이어)
# 디플라이어 장점 -> 문제를 빠르게 풀 수 있음, 실무에서 많이 사용

## subset(부분집합)
# 특정 조건에 맞는 데이터를 추출하여 새로운 부분집합을 만드는 기능
# subset 설치할 필요없음, R에서 기본으로 제공


#예제1
emp = read.csv('emp.csv')
print(emp)
 # 급여가 3000이상 받는 사원만 조회
 high_sal =subset(emp, SAL >= 3000)
 print(high_sal) # SCOTT, KING

 # AND(&), OR 연산자를 이용하여 여러조건을 결합 
 # 급여가 3000 이상, 부서번호가 20번인 직원 조회
 print('')
 emp_deptno20 = subset(emp, SAL >= 3000 & DEPTNO == 20)
 print(emp_deptno20)

 #급여가 2000이상인 직원의 이름하고 입사날짜, 직책 조회
 emp_sal2000 = subset(emp, SAL >= 2000, select = c(ENAME, JOB, SAL))
 print(emp_sal2000) 


## dplyr(디플라이어)

# 설치 필요/ 문법, 설치 후 주석처리 
# install.packages('dplyr') 

# 설치한 디플라이어를 스크립트 창에 가져와야함
# 로드(임포트)
library(dplyr) # 디플라이어 로드
 
### *****디플라이어 핵심문법 ***** ###

# 1. filter: 조건에 맞는 행 조회
# 2. select: 특정 컬럼(열) 선택
# 3. mutate: 새로운 컬럼 추가
# 4. arrange: 행 정렬
# 5. group by: 데이터 그룹화
# 6. summaries: 통계 계산
# 7. join: 여러 데이터프레임 병합
# 8. slice: 특정 행 선택
 
# 디플라이어(dplyr) : data frame plier (공구)
# 데이터 프레임을 다루는 '공구'
# 대규모 데이터 처리 시 매우 빠른 속도를 제공할 수 있음
# 실무에서 전처리 작업할 때 자주 사용됨
# %>% (> 화살표, '특정 문법 실행하겠다' 표시)
  
# filter
# 행을 조건에 따라 필러링
# 문제
 # 급여가 3000이상인 직원 조회
 high_salary = emp %>% filter(SAL >= 3000)
 print(high_salary)
 
 # 급여가 3000이상이고 부서번호가 20번인 사원 조회
 sal_emp20 = emp %>% filter(SAL >= 3000 & DEPTNO == 20)
 print(sal_emp20)
 
 # 부서번호가 20번이고, 직책(JOB)이 'MANAGER'인 사원 조회
 
 manager20 = emp %>% filter(DEPTNO == 20 & JOB == 'MANAGER')
 print(manager20)

 # 급여가 2000 미만이고, 부서번호가 20번인 사원조회
 lowsal_20 = emp %>% filter (SAL < 2000 & DEPTNO == 20)
 print(lowsal_20) # SMITH, ADAMS
 
 # 이름과 부서번호만 조회 (급여가 2000 미만이고, 부서번호가 20번인 사원조회)
 name_dept20 = emp %>% filter (SAL < 2000 & DEPTNO == 20) %>% select(ENAME, DEPTNO)
 print(name_dept20)

 # 직책(JOB)이 'SALESMAN'인 사원의 이름, 직책, 입사날짜 조회
 saleman = emp %>% filter(JOB == 'SALESMAN') %>% select(ENAME, JOB, HIREDATE)
 print(saleman)
 
## mutate()
# 새로운 컬럼(열) 추가
 # 급여와 커미션의 합계를 새로운 열을 만들어서 추가
 # TOTAL_COM 새로운 열 이름
 # is. na : is(?), na 값이야?
 emp_comm = emp %>% mutate(TOTAL_COM = SAL + ifelse(is.na(COMM), 0, COMM)) 
 # ifelse(is.na(COMM),0,COMM) : COMM이 NA 면 0, 아니라면 COMM 내 값(values) 사용
#View(emp_comm)

## arrange()
 # 정량
 # 급여기준으로 오름차순
 sorted_by_sal = emp %>% arrange(SAL)
 print(sorted_by_sal)
 
 # 급여기준으로 내림차순
 # desc(Descending) : 내림차순
 sorted_by_desal = emp %>% arrange(desc(SAL))
 print(sorted_by_desal)