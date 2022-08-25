import sys
import os
import django
sys.dont_write_bytecode = True
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'settings')
django.setup()

from db.models import *

# 아래에 코드를 기록하세요.
# 코드 실행은 터미널에서 shell을 실행시켜서 해주세요. 
# $ python manage.py shell_plus 


# 3. 코드를 실행해서 데이터 추가
directors = [
    ("봉준호","1993-01-01","KOR"),
    ("김한민","1999-01-01","KOR"),
    ("최동훈","2004-01-01","KOR"),
    ("이정재","2022-01-01","KOR"),
    ("이경규","1992-01-01","KOR"),
    ("한재림","2005-01-01","KOR"),
    ("Joseph Kosinski","1999-01-01","KOR"),
    ("김철수","2022-01-01","KOR"),
]

for d in directors:
    director = Director()
    director.name = d[0]
    director.debut = d[1]
    director.country = d[2]
    director.save()

genres = ["액션","드라마","사극","범죄","스릴러","SF","무협","첩보","재난"]

for g in genres:
    genre = Genre()
    genre.title = g
    genre.save()


# 4. Queryset 메소드 `get` 을 활용해서 `Director` 테이블에서 
# `name` 이 봉준호인 데이터를 아래와 같이 출력하는 코드를 작성
director = Director.objects.get(name = '봉준호')
print(f'id : {director.id}')
print(f'name : {director.name}')
print(f'debut : {director.debut}')
print(f'country : {director.country}')

# 5. Queryset 메소드 `get` 을 활용해서 `Genre` 테이블에서 `title` 이 
# 드라마인 데이터를 아래와 같이 출력하는 코드를 작성
genre = Genre.objects.get(title = '드라마')
print(f'id : {genre.id}')
print(f'title : {genre.title}')

# 6. 위 문제에서 찾은 `director` 와 `genre` 와 아래 `힌트 코드`를 활용해서 
# `Movie` 테이블에 아래 데이터를 추가하는 코드를 작성

director_1 = Director.objects.get(name = '봉준호')
genre_1 = Genre.objects.get(title = '드라마')

movie = Movie()
movie.director = director_1
movie.genre = genre_1
movie.title = '기생충'
movie.opening_date = '2019-05-30'
movie.running_time = 132
movie.screening = False
movie.save()

Movie.objects.create(director = director_1, genre = genre_1, title = '기생충', opening_date = '2019-05-30', running_time = 132, screening = 132)


# 7. `Movie` 테이블에 아래 데이터를 추가하는 코드를 작성
movies = [
    ("봉준호", "드라마", "괴물", "2006-07-27", 119, False),
    ("봉준호", "SF", "설국열차", "2013-10-30", 125, False),
    ("김한민", "사극", "한산", "2022-07-27", 129, True),
    ("최동훈", "SF", "외계+인", "2022-07-20", 142, False),
    ("이정재", "첩보", "헌트", "2022-08-10", 125, True),
    ("이경규", "액션", "복수혈전", "1992-10-10", 88, False),
    ("한재림", "재난", "비상선언", "2022-08-03", 140, True),
    ("Joseph Kosinski", "액션", "탑건 : 매버릭", "2022-06-22", 130, True),
]

for film in movies:
    movie = Movie()
    movie.director = Director.objects.get(name = film[0])
    movie.genre = Genre.objects.get(title = film[1])
    movie.title = film[2]
    movie.opening_date = film[3]
    movie.running_time = film[4]
    movie.screening = film[5]
    movie.save()

# 8. `Movie` 테이블의 모든 데이터를 출력하는 코드를 작성
for movie in Movie.objects.all():
    print(movie.director, movie.genre, movie.title, movie.opening_date, movie.running_time, movie.screening)

# 9. `Director object (n)`  를 활용해서 각 영화의 감독 `name` 을 조회해서 대신 출력하는 코드를 작성
for movie in Movie.objects.all():
    print(movie.director.name, movie.genre, movie.title, movie.opening_date, movie.running_time, movie.screening)

# 10. 위 문제에서 조회한 `Genre object (n)`  를 활용해서 각 영화의 장르 `title` 을 조회해서 대신 출력하는 코드를 작성
for movie in Movie.objects.all():
    print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)

# 11. 영화 데이터들을 `최신 개봉한 영화순`으로 조회해서 출력하는 코드를 작성
movies = Movie.objects.order_by('-opening_date')

for movie in movies:
    print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)

# 12. 영화 데이터 중 `가장 먼저 개봉한` 영화를 조회해서 출력하는 코드를 작성
movies = Movie.objects.order_by('opening_date')[0]
print(movies.director.name, movies.genre.title, movies.title, movies.opening_date, movies.running_time, movies.screening)

# 13. 영화 데이터 중 현재 `상영 중`인 영화들을 `개봉일 순`으로 조회해서 출력하는 코드를 작성
now_showing = Movie.objects.filter(screening = True).order_by('opening_date')

for movie in now_showing:
    print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)

# 14. 영화 감독이 `봉준호` 인 영화들을 `개봉일 순`으로 조회해서 출력하는 코드를 작성
director_ = Director.objects.get(name = '봉준호')
bong = Movie.objects.filter(director = director_).order_by('opening_date')

for movie in bong:
    print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)

# 15. `봉준호` 감독 영화 중 두 번째로 개봉한 영화를 조회해서 출력하는 코드를 작성
director_ = Director.objects.get(name = '봉준호')
bong = Movie.objects.filter(director = director_).order_by('opening_date')[1]

print(bong.director.name, bong.genre.title, bong.title, bong.opening_date, bong.running_time, bong.screening)

# 16. 영화의 상영 시간 `running_time` 이 119 보다 큰 영화들을 
# 상영 시간순으로 조회해서 출력하는 코드를 작성
movie = Movie.objects.filter(running_time__gt = 119).order_by('running_time')

for mov in movie:
    print(mov.director.name, mov.genre.title, mov.title, mov.opening_date, mov.running_time, mov.screening)

# 17. 영화의 상영 시간 `running_time` 이 119 이상인  
# 영화들을 상영 시간순으로 조회해서 출력하는 코드를 작성
movie = Movie.objects.filter(running_time__gte = 119).order_by('running_time')

for mov in movie:
    print(mov.director.name, mov.genre.title, mov.title, mov.opening_date, mov.running_time, mov.screening)

# 18. `2022-01-01` 이후로 개봉한 영화를 개봉일 순으로 조회해서 출력하는 코드를 작성
movie = Movie.objects.filter(opening_date__gt = '2022-01-01').order_by('opening_date')

for mov in movie:
    print(mov.director.name, mov.genre.title, mov.title, mov.opening_date, mov.running_time, mov.screening)

# 19. 봉준호 감독 영화 중 장르가 드라마인 영화들을 개봉일 순으로 조회해서 출력하는 코드를 작성
bong = Director.objects.get(name = '봉준호')
drama = Genre.objects.get(title = '드라마')

movie = Movie.objects.filter(director = bong, genre = drama).order_by('opening_date')

for mov in movie:
    print(mov.director.name, mov.genre.title, mov.title, mov.opening_date, mov.running_time, mov.screening)

# 20. 봉준호 감독의 영화가 아닌 영화들을 개봉일 순으로 조회해서 출력하는 코드를 작성

bong = Director.objects.get(name = '봉준호')

movie = Movie.objects.exclude(director = bong).order_by('opening_date')

for mov in movie:
    print(mov.director.name, mov.genre.title, mov.title, mov.opening_date, mov.running_time, mov.screening)