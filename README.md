## cody-erb
  - 본 프로젝트는 ERB문법을 확장하여 erb의 사용성을 증가시키기 위한 프로젝트입니다.
  - static page 제너레이터와 함께 연동하기위한 베이스코드를 작성합니다.

## 사용법

##### 2. initialize cody
```sh
./cody init
```

##### 3. start cody
```sh
./cody
```

##### 5. deploy your code
```sh
./cody deploy [folder path]
```

## Feature
  - Cody::ERBStruct
    - [x] :include
    - [x] :layout
    - [x] :helper    
    - [x] :block
    - [x] :partial
    - [x] :json
    
  - Cody::Deploy

### 주의할점
  - Deploy시 "_"로 시작되는 폴더는 템플릿용 폴더로 간주하고 삭제됩니다.

## Todo
 - [x] ERBStruct 를 listen gem에 최적화하기
 - [x] 공통 컨트롤러인 헬퍼추가
 - [ ] 실제프로젝트에서 사용성 검증(6월까지)
 - [ ] gem 분리 (베이스코드와 배포부분이 분리되어 관리)
 - [ ] cody-erb gem 배포 (7월이후)
 
## Supported compile format
  - erb

## require gemfile
  - listen
  - active_support
  - json