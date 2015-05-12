## Cody
Tools for publishers

## 사용법
  - 루비를 설치한다.
  - 루트에서 bundle install을쳐 필요한 잼을 얻는다.
  - sh cody라고 치고 코드를 작성하면 수정하는 즉시 자동 컴파일 된다.

## 목표
  - sh cody deploy라고 치면 최적화된 소스가 별개로 생겼으면 좋겠다.
  - 잼으로 배포가능해지면 좋겠다.
  - sh를 굳이 안썼으면 좋겠다.

## Support
  - erb
  - scss
  - js

## Will support
  - Less
  - Coffee Script
  - JS Compressor
  - ERB :: Parse JSON model
  - ERB :: Layout template


## gemfile
ERB만 제외하고 다른부분은 잼을 사용합니다.
  - compass
  - less
  - therubyracer
  - uglifier
  - guard
  - guard-sass
  - guard-uglifier
  - guard-livereload
  
## will use gemfile
  - guard-less
  - coffeescript
  - guard-coffeescript
  