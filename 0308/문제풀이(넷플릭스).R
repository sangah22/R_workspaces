## 라이브러리 로드와 csv파일 불러오기

# 문제 1: dplyr 패키지를 로드해주세요.
# print(list.files())
# library('dplyr')

# 문제 2: netflix.csv 파일을 불러오세요.
# netflix = read.csv('netflix.csv')
# View(netflix)


## 데이터프레임 출력하기
# 문제 1: 데이터프레임의 앞부분 출력 단, 2행만
result1 = head(netflix, 2)
# View(result1)

# 문제 2: 데이터프레임의 뒷부분 출력 단, 5행만
result2 = tail(netflix,5)
# View(result2)

# 문제 3: 데이터프레임의 구조 확인
# result3 = dim(netflix) dim 아님/시험에서 틀린답
result3 = str(netflix)
print(result3)

# 문제 4: 특정 컬럼(열) title 선택하기
result4 = netflix$title
#View(result4)

## Select
# 문제 5: 데이터셋에서 title, type, release_year 열만 선택하세요.
result5 = netflix %>% select(title,type,release_year)
# View(result5)

# 문제 6: 데이터셋에서 title, country, rating 열만 선택하세요.
result6 = netflix %>% select(title, country, rating)
# View(result6)

## Filter
# 문제 7: 2021년에 출시된 영화만 필터링하세요.
result7 = netflix %>% filter(release_year == 2021)
# View(result7)

# 문제 8: TV-MA 등급의 TV 프로그램만 필터링하세요.
result8 = netflix %>% filter(rating == 'TV-MA')
# View(result8)


## Select& Filter
# 문제 9: director가 "Mike Flanagan"인 영화의 title, director, country 열을 선택하세요.
result9 = netflix %>% filter(director == 'Mike Flanagan') %>% select(title, director,country)
# View(result9)

## Mutate
# 문제 10: duration 열에서 영화의 길이가 분 단위로 제공됩니다. 영화(type == "Movie")의 경우, duration 값을 숫자형 데이터로 변환하고 새로운 열 duration_minutes를 추가하세요.
# 문자열 데이터 처리 활용
# result10 = netflix %>% filter(type == 'Movie') %>% mutate(duration_minutes = as.numeric(netflix$duration))
# View(result10)

##Arrange
# 문제 11: 영화(type == "Movie")를 기준으로, release_year(출시 연도)를 내림차순으로 정렬하세요.
result11 = netflix %>% filter(type == 'Movie') %>% arrange(desc(release_year))
# View(result11)

# 문제 12: TV 프로그램(type == "TV Show") 중 시즌 수(duration)를 기준으로 오름차순으로 정렬하세요.
result12 = netflix %>% filter(type == 'TV Show') %>% arrange(duration)
# View(result12)


## Group_by& Summarise
# 문제 13: type 열을 기준으로 데이터를 그룹화하고, 각 그룹에 대해 콘텐츠의 총 개수와 평균 release_year를 계산하세요.
# 결과 데이터프레임은 type, total_count, average_release_year 열을 포함해야 합니다.
result13 = netflix %>% group_by(type) %>% summarise(type_CON = )


