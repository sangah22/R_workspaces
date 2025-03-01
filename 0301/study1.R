# 2/15 수업 복습

# R 언어만의 특징
# 대문자와 소문자를 구별! (오타조심)
# 사람끼리 정보를 주고받을 때 1. 숫자와 2. 문자로 충분
# 그런데 컴퓨터는 논리형(bool)이 필요
# 3. 논리형은 true, false
# 4. 범주형 => (ex. 혈액형, 성별, 고객 만족도)
# 범주형 특정 => '그룹핑', '계산적 의미'는 없음
# 5. *****결측값 => 관측/측정에 실패한 값

x = 10
print(x)


## *****데이터 프레임 : 행과 열과 구성된 2차원 구조
df = data.frame(
  ID = c(1, 2, 3),
  NAME = c('김길동', '박길동', '홍길동')
  )

#View(df)

# ***데이터 프레임 조회
print(head(df, 2)) # 1~2행 까지 출력
print(dim(df)) # 행과 열의 개수
print(tail(df, 2)) # 마지막 2행 출력, tail은 '꼬리'라는 뜻
print(str(df)) # 각 컬럼의 데이터 타입을 확인할 수 있음 (num 숫자형 chr 문자형)

# 특정 열 선택
name = df$NAME
print(name)

#다중 열 선택
emp = df[,c('ID', 'NAME')] #ID, NAME, 컬럼(열)만 조회
print(emp)

# 새로운 열 추가
df$JOB = c('MANAGER', 'NANAGER', 'SALES')
# View(df)

# 새로운 열 'SAL(급여)' 추가하기
df$SAL = c(1200, 2000, 1800)
#View(df)

# 특정 열 값 수정하기
df$SAL = df$SAL * 2 # 기존급여 * 2배
print(df)

# 데이터프레임 -> CSV(엑셀)파일로 저장
write.csv(df,file = 'sample_dataframe.csv')
# 기본 경로는 '문서'에 저장됨


