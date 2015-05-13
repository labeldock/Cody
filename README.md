## Cody
Tools for publishers

## 주의
이 프로젝트는 완전히 작성되지 않았습니다. 그러므로 완전히 잘되진 않습니다.


## 사용법
  - 루비를 설치한다.
  - 루트에서 bundle install을쳐 필요한 잼을 얻는다.
  - sh cody라고 치고 코드를 작성하면 수정하는 즉시 자동 컴파일 된다.

## 목표
  - 잼으로 배포가능해지면 좋겠다.
  - 다음과 같이 쉘 커맨드가 단순화 되면 좋겠다.
``` sh
$ cody new
$ cody start
$ cody deploy
```

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
  