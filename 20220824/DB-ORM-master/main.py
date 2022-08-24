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

# 3. Queryset 메소드 `create` 를 활용해서  `Director` 테이블에 아래 데이터를 추가하는 코드를 작성
Director.objects.create(name = '봉준호', debut = '1993-01-01', country = 'KOR')
Director.objects.create(name = '김한민', debut = '1999-01-01', country = 'KOR')
Director.objects.create(name = '최동훈', debut = '2004-01-01', country = 'KOR')
Director.objects.create(name = '이정재', debut = '2022-01-01', country = 'KOR')
Director.objects.create(name = '이경규', debut = '1992-01-01', country = 'KOR')
Director.objects.create(name = '한재림', debut = '2005-01-01', country = 'KOR')
Director.objects.create(name = 'Joseph Kosinski', debut = '1999-01-01', country = 'KOR')
Director.objects.create(name = '김철수', debut = '2022-01-01', country = 'KOR')

# 4. `인스턴스 조작` 을 활용하여`Genre` 테이블에 아래 데이터를 추가하는 코드를 작성
genre = Genre(title = '액션')
genre.save()
genre = Genre(title = '드라마')
genre.save()
genre = Genre(title = '사극')
genre.save()
genre = Genre(title = '범죄')
genre.save()
genre = Genre(title = '스릴러')
genre.save()
genre = Genre(title = 'SF')
genre.save()
genre = Genre(title = '무협')
genre.save()
genre = Genre(title = '첩보')
genre.save()
genre = Genre(title = '재난')
genre.save()

# 5. Queryset 메소드 `all` 을 활용해서 `Director` 테이블의 모든 데이터를 출력하는 코드를 작성
director = Director.objects.all()
for i in director:
    print(i.name, i.debut, i.country)

# 6. Queryset 메소드 `get` 을 활용해서 `Director` 테이블에서 `id` 가 1인 데이터를 출력하는 코드를 작성
director = Director.objects.get(id = 1)
print(director.name, director.debut, director.country)

# 7.  Queryset 메소드 `get` 을 활용해서 `Director` 테이블에서 `country` 가 USA인 데이터를 출력하는 코드를 작성
Director.objects.get(country = 'USA')

# 9. Queryset 메소드 `get` 과 `save` 를 활용해서 `Director` 테이블에서  `name` 이 
# Joseph Kosinski인 데이터를 조회해서 `country` 를 USA 로 수정하고, 출력하는 코드를 작성
director = Director.objects.get(name = 'Joseph Kosinski')
director.country = 'USA'
director.save()

director = Director.objects.get(country = 'USA')
print(director.name, director.debut, director.country)

# 10. Queryset 메소드 `get` 을 활용해서 `Director` 테이블에서 `country` 가 KOR인 데이터를 출력하는 코드를 작성
Director.objects.get(country = 'KOR')

# 12. Queryset 메소드 `filter` 를 활용해서 `Director` 테이블에서 `country` 가 KOR인 데이터를 출력하는 코드를 작성
director = Director.objects.filter(country = 'KOR')
for i in director:
    print(i.name, i.debut, i.country)

# 14. Queryset 메소드 `get` 과 `delete`를 활용해서  
# `Director` 테이블에서 `name` 이 김철수인 데이터를 삭제하는 코드를 작성
director = Director.objects.get(name = '김철수')
director.delete()

director = Director.objects.all()
for i in director:
    print(i.name, i.debut, i.country)