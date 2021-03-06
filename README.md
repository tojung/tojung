# 내 삶을 바꾸는 법안 쇼핑몰 웹서비스 투정

내 삶을 바꾸는 법안 쇼핑몰 투정.
<br>
청년 세대들의 삶의 문제를 해결해 줄 수 있지만 국회에선 무관심으로 통과되지 않는 입법안을 발굴해 쇼핑몰형태로 보여주는 웹서비스.

https://tojung.me

## Technical Stack / Spec

Backend:
 - Ruby On Rails Framework
 - 주문,결제,이메일 전송,법안정보 도메인
 - 결제구현 ( Iamport 서비스 이용 )
 - facebook oauth, google oauth 및 회원가입 구현  
 - MVCS (Model-View-Controller-Service) pattern
 
Infra:
 - AWS 기반의 인프라 구축 
 - AWS Elastic Beanstalk, Load Balancer, RDS(Mysql)를 이용한 확장성있는 배포 
 - 트래픽이 증가할것으로 예상될때는, AWS Elastic Cache의 Redis 적용하여 부하 분산 적용 ( 2018.08 ~ 2018.12 )
 - 정적 리소스를 S3에 저장하고 Cloud Front 를 통해서 읽어오는 구조 
 
Frontend: 
 - Progressive Web App ( Offline Support, Web Push Notification, Caching )
 - Responsive Web
 - 별도의 프론트엔드 프레임워크를 사용하지는 않고, 서버에서 템플릿엔진으로 html을 렌더링 하는 방식을 사용함
 - 다음 주소 API, Iamport 서비스를 이용한 결제 api 연동
 
<br>

## Infra Architecture 

<img src="/arch.png">

## Role

- Dongjin Lim (CTO): Backend 개발 및 Infra 개발 및 Progressive Web App 구현, 
결제 등의 외부 api 연동, 법안 데이터 크롤링, elasticsearch를 통한 법안 데이터 관리 등
- Jinyoung Park (COO): 반응형 웹 구현 및 html, css 퍼블리싱 및 페이지 인터랙션 구현 및 서비스 전반의 운영
- Yein Kim (CEO): 프로젝트 리딩, 경영 및 Web Design