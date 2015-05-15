## cody-erb
  - 본 프로젝트는 ERB문법을 확장하여 erb의 사용성을 증가시키기 위한 프로젝트입니다.
  - 이전의 cody liquid-erb프로젝트의 연장입니다.
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

### Deploy시 주의할점
  - _ 로 시작되는 폴더는 템플릿용 폴더로 간주하고 삭제됩니다.

## Todo

 - 버그 찾기

## Feature
  - Cody::ERBStruct
    - layout
    - block
    - include
    - partial (검증이 완전히 안됨)
    - json
  - Cody::Deploy

## Supported compile format
  - erb

## require gemfile
  - listen