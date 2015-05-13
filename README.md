## Cody
Tools for publishers

## 주의
이 프로젝트는 완전히 작성되지 않았습니다. 그러므로 완전히 잘되진 않습니다.


## 사용법

##### 1. install ruby
do it your self, please

##### 2. download cody and commend it from root
```sh
./cody setup
```

##### 3. start cody
```sh
./cody
```

##### 4. deploy your code
```sh
./cody deploy
```

## Todo
  - deploy 작동되도록
  - cody_conf.json 생성되도록 만들기
  - 서버랑 바인딩
  - less, coffeescript 지원
  - Gemfile, Guardfile등이 들어나지 않는 방법이 없을까?
  - 잼으로 배포하거나 말거나


## feature
  - code complie
  - live reload
  - Cody::ERB extend syntex
    - layout
    - block
    - include
    - partial (검증이 완전히 안됨)
    - model
  - Cody::Deploy (incomplete)

## Supported compile format
  - erb
  - scss
  - js

## Will support format
  - Less
  - Coffee Script

## gemfile
ERB부분만 제가 작성하였고 그외의 부분은 잼을 사용합니다.
  - compass
  - therubyracer
  - uglifier
  - guard
  - guard-sass
  - guard-uglifier
  - guard-livereload
  
## will use gemfile
  - less
  - guard-less
  - coffeescript
  - guard-coffeescript
  