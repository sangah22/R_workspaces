### 기초문법 문제
## 자료형 확인

# 주어진 코드
x = 42
y = "R 프로그래밍"
z = TRUE

# 각 변수의 자료형을 출력하는 코드를 작성하세요.
# 힌트: typeof() 함수를 사용하세요.

print(typeof(x))
print(typeof(y))
print(typeof(z))

## 벡터의 요소 선택

# 다음 벡터에서 20보다 큰 숫자만 선택하여 출력하세요.
# 주어진 벡터
numbers = c(10, 15, 20, 25, 30, 35)
# 20보다 큰 숫자만 선택하고 출력하는 코드를 작성하세요.

num = numbers[numbers >= 20]
print(num)

## 데이터프레임 기초문제
#아래 'people' 데이터프레임이 주어집니다. 내용에 맞는 답안을 풀어주세요.
# 주어진 데이터프레임
people = data.frame(
  name = c("Alice", "Bob", "Charlie", "Diana"),
  age = c(25, 35, 30, 28),
  gender = c("여", "남", "남", "여")
)

# View(people)

# 데이터의 상위 5개 행 출력하기
print(head(people,5))

#데이터의 행과 열의 개수를 출력하기
print(dim(people))

#전체컬럼 출력하기
print(colnames(people))

# 3번째 컬럼의 3번째 값은 무엇인가?
result = people$gender[3]
print(result)

# 데이터 마지막 3개행 출력하기
print(tail(people,3))

# 새로운 컬럼'weigh' 추가, 데이터는 52, 77, 81, 46 차례대로 삽입
people$weigh = c(52, 77, 81, 46)
print(people)

# 나이가 30이상인 사람들만 출력하는 코드를 작성하세요

UP_30 = people[people$age >= 30,]
print(UP_30)

# name, age 두개의 컬럼으로 구성된 새로운 데이터 프레임을 정의하기

result2 = people[,c('name', 'age')]
print(result2)
