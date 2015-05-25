## cody-erb
  - ERB 사용성을 증가시키기위해 문법확장을한 프로젝트입니다.
  - static page generator와 함께 연동하기위한 베이스코드를 작성합니다.
  
## ATTENTION! - 디자인 골 달성
  - 본 프로젝트의 목표는 달성되었습니다.
  - 본 프로젝트의 디자인 목표와 비슷한 "<a href="https://middlemanapp.com">middleman</a>" 잼을 발견하여 더 이상 업데이트는 없을 예정입니다.
  - "<a href="https://middlemanapp.com">middleman</a>" 잼을 사용할 것을 추천합니다.

## 사용법

##### 2. initialize (gem install)
```sh
./cody init
```

##### 3. start
```sh
./cody
```

##### 5. deploy code
```sh
./cody deploy [folder path]
```

## Feature
  - Cody::ERBStruct
    - :include
    - :layout
    - :helper    
    - :block
    - :partial
    - :json
    
  - Cody::Deploy

### 주의할점
  - Deploy시 "_"로 시작되는 폴더는 템플릿용 폴더로 간주하고 삭제됩니다.
 
## Supported compile format
  - erb

## require gemfile
  - listen
  - json
