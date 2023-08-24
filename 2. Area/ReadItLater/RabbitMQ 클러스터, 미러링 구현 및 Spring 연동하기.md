# [RabbitMQ 클러스터, 미러링 구현 및 Spring 연동하기](https://backtony.github.io/spring/2021-09-21-spring-rabbitmq-1/#:~:text=RabbitMQ%20%EB%8A%94%20%EC%96%BC%EB%9E%AD%20%28Erlang%29%EC%9C%BC%EB%A1%9C%20AMQP%20%28%ED%94%84%EB%A1%9C%ED%86%A0%EC%BD%9C%29%EB%A5%BC%20%EA%B5%AC%ED%98%84%ED%95%9C%20%EB%A9%94%EC%8B%9C%EC%A7%80,%ED%81%90%EB%A5%BC%20Listen%20%ED%95%98%EA%B3%A0%20%EC%9E%88%EB%8A%94%20Consumer%20%28%EC%86%8C%EB%B9%84%EC%9E%90%29%EA%B0%80%20%EB%A9%94%EC%8B%9C%EC%A7%80%EB%A5%BC%20%EA%B0%80%EC%A0%B8%EA%B0%91%EB%8B%88%EB%8B%A4.)

21 Sep 2021 in [Spring](https://backtony.github.io/spring/) on [RabbitMQ](https://backtony.github.io/tag-spring-rabbitmq/)

-   [1\. RabbitMQ란?](https://backtony.github.io/spring/2021-09-21-spring-rabbitmq-1/#1-rabbitmq%EB%9E%80)
    -   [Exchange](https://backtony.github.io/spring/2021-09-21-spring-rabbitmq-1/#exchange)
-   [2\. RabbitMQ 설치](https://backtony.github.io/spring/2021-09-21-spring-rabbitmq-1/#2-rabbitmq-%EC%84%A4%EC%B9%98)
    -   [EC2 포트](https://backtony.github.io/spring/2021-09-21-spring-rabbitmq-1/#ec2-%ED%8F%AC%ED%8A%B8)
    -   [최신 버전 설치](https://backtony.github.io/spring/2021-09-21-spring-rabbitmq-1/#%EC%B5%9C%EC%8B%A0-%EB%B2%84%EC%A0%84-%EC%84%A4%EC%B9%98)
    -   [delay 플러그인 설치](https://backtony.github.io/spring/2021-09-21-spring-rabbitmq-1/#delay-%ED%94%8C%EB%9F%AC%EA%B7%B8%EC%9D%B8-%EC%84%A4%EC%B9%98)
-   [3\. RabbitMQ 구성하기](https://backtony.github.io/spring/2021-09-21-spring-rabbitmq-1/#3-rabbitmq-%EA%B5%AC%EC%84%B1%ED%95%98%EA%B8%B0)
    -   [Delay Exchange 구성](https://backtony.github.io/spring/2021-09-21-spring-rabbitmq-1/#delay-exchange-%EA%B5%AC%EC%84%B1)
    -   [Queue 구성](https://backtony.github.io/spring/2021-09-21-spring-rabbitmq-1/#queue-%EA%B5%AC%EC%84%B1)
    -   [Binding](https://backtony.github.io/spring/2021-09-21-spring-rabbitmq-1/#binding)
-   [4\. 클러스터, 미러링 구성하기](https://backtony.github.io/spring/2021-09-21-spring-rabbitmq-1/#4-%ED%81%B4%EB%9F%AC%EC%8A%A4%ED%84%B0-%EB%AF%B8%EB%9F%AC%EB%A7%81-%EA%B5%AC%EC%84%B1%ED%95%98%EA%B8%B0)
    -   [클러스터란?](https://backtony.github.io/spring/2021-09-21-spring-rabbitmq-1/#%ED%81%B4%EB%9F%AC%EC%8A%A4%ED%84%B0%EB%9E%80)
    -   [미러링이란?](https://backtony.github.io/spring/2021-09-21-spring-rabbitmq-1/#%EB%AF%B8%EB%9F%AC%EB%A7%81%EC%9D%B4%EB%9E%80)
    -   [구성하기](https://backtony.github.io/spring/2021-09-21-spring-rabbitmq-1/#%EA%B5%AC%EC%84%B1%ED%95%98%EA%B8%B0)
        -   [모든 EC2 공통 세팅](https://backtony.github.io/spring/2021-09-21-spring-rabbitmq-1/#%EB%AA%A8%EB%93%A0-ec2-%EA%B3%B5%ED%86%B5-%EC%84%B8%ED%8C%85)
        -   [Erlang 쿠키 맞추기](https://backtony.github.io/spring/2021-09-21-spring-rabbitmq-1/#erlang-%EC%BF%A0%ED%82%A4-%EB%A7%9E%EC%B6%94%EA%B8%B0)
        -   [클러스터 구성하기](https://backtony.github.io/spring/2021-09-21-spring-rabbitmq-1/#%ED%81%B4%EB%9F%AC%EC%8A%A4%ED%84%B0-%EA%B5%AC%EC%84%B1%ED%95%98%EA%B8%B0)
        -   [미러링 구성하기](https://backtony.github.io/spring/2021-09-21-spring-rabbitmq-1/#%EB%AF%B8%EB%9F%AC%EB%A7%81-%EA%B5%AC%EC%84%B1%ED%95%98%EA%B8%B0)
        -   [클러스터에서 제거하기](https://backtony.github.io/spring/2021-09-21-spring-rabbitmq-1/#%ED%81%B4%EB%9F%AC%EC%8A%A4%ED%84%B0%EC%97%90%EC%84%9C-%EC%A0%9C%EA%B1%B0%ED%95%98%EA%B8%B0)
-   [5\. Spring 연동하기](https://backtony.github.io/spring/2021-09-21-spring-rabbitmq-1/#5-spring-%EC%97%B0%EB%8F%99%ED%95%98%EA%B8%B0)
    -   [설정하기](https://backtony.github.io/spring/2021-09-21-spring-rabbitmq-1/#%EC%84%A4%EC%A0%95%ED%95%98%EA%B8%B0)
    -   [Config](https://backtony.github.io/spring/2021-09-21-spring-rabbitmq-1/#config)
        -   [RabbitMQ GUI로 설정한 경우](https://backtony.github.io/spring/2021-09-21-spring-rabbitmq-1/#rabbitmq-gui%EB%A1%9C-%EC%84%A4%EC%A0%95%ED%95%9C-%EA%B2%BD%EC%9A%B0)
        -   [모든 설정 spring에서 하기](https://backtony.github.io/spring/2021-09-21-spring-rabbitmq-1/#%EB%AA%A8%EB%93%A0-%EC%84%A4%EC%A0%95-spring%EC%97%90%EC%84%9C-%ED%95%98%EA%B8%B0)
    -   [메시지 보내기](https://backtony.github.io/spring/2021-09-21-spring-rabbitmq-1/#%EB%A9%94%EC%8B%9C%EC%A7%80-%EB%B3%B4%EB%82%B4%EA%B8%B0)
    -   [메시지 수신하기](https://backtony.github.io/spring/2021-09-21-spring-rabbitmq-1/#%EB%A9%94%EC%8B%9C%EC%A7%80-%EC%88%98%EC%8B%A0%ED%95%98%EA%B8%B0)

해당 포스팅의 코드는 [Github](https://github.com/backtony/spring-study/tree/master/rabbitmqStudy) 를 참고해주세요.

## 1\. RabbitMQ란?

---

![그림6](2.%20Area/ReadItLater/assets/그림6.PNG)  
RabbitMQ 는 얼랭(Erlang)으로 AMQP(프로토콜)를 구현한 메시지 브로커 시스템입니다.

**로직**

1.  producer(메시지 생성자)가 메시지를 생성합니다.
2.  메시지를 브로커(RabbitMQ)에 보냅니다.
3.  브로커(RabbitMQ)는 Exchange에서 메시지를 받아 Exchange의 타입에 따라 라우팅하여 메시지를 큐로 보냅니다.
4.  해당 큐를 Listen 하고 있는 Consumer(소비자)가 메시지를 가져갑니다.

**사용처 및 장점**  
메세지를 많은 사용자에게 전달하거나, 요청에 대한 처리 시간이 길 때, 해당 요청을 다른 API에게 위임하고 빠른 응답을 할 때 많이 사용합니다. 또한, 애플리케이션 간 결합도를 낮출 수 있는 장점이 있습니다.

## Exchange

메시지는 RabbitMQ에 도착하면 바로 큐로 가는게 아니라 Exchange에 먼저 도달합니다. Exchange의 Type에 따라 Queue에 전달하는 방식이 결정되어 알맞은 Queue로 메시지를 라우팅합니다.  
Exchange에는 다음과 같은 타입이 존재합니다.

-   Direct Exchange
    -   Message의 Routing Key와 정확히 일치하는 Binding된 Queue로 Routing
-   Fanout Exchange
    -   Binding된 모든 Queue에 Message를 Routing
-   Topic Exchange
    -   특정 Routing Pattern이 일치하는 Queue로 Routing
-   Headers Exchange
    -   key-value로 정의된 Header 속성을 통한 Routing

## 2\. RabbitMQ 설치

---

## EC2 포트

-   4369 : epmd, 여러 rabbitmq 서버끼리 서로를 찾을 수 있는 네임 서버 역할을 하는 데몬에서 사용
-   5671, 5672 : AMQP 를 사용한 메시지 전달 - 5672가 기본
-   25672 : inter-node 와 CLI Tool 연결
-   15672 : HTTP API, Management UI

위의 포트를 열어줍니다.

## 최신 버전 설치

기본적으로 api-get 을 이용해서 rabbitmq를 설치하게 되면 최신버전을 설치할 수 없습니다.  
\[[공식 홈페이지](https://www.rabbitmq.com/install-debian.html#apt-quick-start-packagecloud)\]에서 제공하는 방법으로 설치하도록 하겠습니다.

```
### 루트계정으로 전환하고 진행 ###
sudo apt-get install curl gnupg apt-transport-https -y

## Team RabbitMQ's main signing key
curl -1sLf "https://keys.openpgp.org/vks/v1/by-fingerprint/0A9AF2115F4687BD29803A206B73A36E6026DFCA" | sudo gpg --dearmor > /usr/share/keyrings/com.rabbitmq.team.gpg

## Launchpad PPA that provides modern Erlang releases
curl -1sLf "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xf77f1eda57ebb1cc" | sudo gpg --dearmor > /usr/share/keyrings/net.launchpad.ppa.rabbitmq.erlang.gpg

## PackageCloud RabbitMQ repository
curl -1sLf "https://packagecloud.io/rabbitmq/rabbitmq-server/gpgkey" | sudo gpg --dearmor > /usr/share/keyrings/io.packagecloud.rabbitmq.gpg

## Add apt repositories maintained by Team RabbitMQ
sudo tee /etc/apt/sources.list.d/rabbitmq.list <<EOF
deb [signed-by=/usr/share/keyrings/net.launchpad.ppa.rabbitmq.erlang.gpg] http://ppa.launchpad.net/rabbitmq/rabbitmq-erlang/ubuntu bionic main
deb-src [signed-by=/usr/share/keyrings/net.launchpad.ppa.rabbitmq.erlang.gpg] http://ppa.launchpad.net/rabbitmq/rabbitmq-erlang/ubuntu bionic main
deb [signed-by=/usr/share/keyrings/io.packagecloud.rabbitmq.gpg] https://packagecloud.io/rabbitmq/rabbitmq-server/ubuntu/ bionic main
deb-src [signed-by=/usr/share/keyrings/io.packagecloud.rabbitmq.gpg] https://packagecloud.io/rabbitmq/rabbitmq-server/ubuntu/ bionic main
EOF

## Update package indices
sudo apt-get update -y

## Install Erlang packages
sudo apt-get install -y erlang-base \
                        erlang-asn1 erlang-crypto erlang-eldap erlang-ftp erlang-inets \
                        erlang-mnesia erlang-os-mon erlang-parsetools erlang-public-key \
                        erlang-runtime-tools erlang-snmp erlang-ssl \
                        erlang-syntax-tools erlang-tftp erlang-tools erlang-xmerl

## Install rabbitmq-server and its dependencies
sudo apt-get install rabbitmq-server -y --fix-missing

### ubuntu 계정으로 전환 ###
# Management UI 플러그인 활성화
sudo rabbitmq-plugins enable rabbitmq_management

# 사용자 추가 -> 아이디 패스워드
sudo rabbitmqctl add_user test test

# 사용자에 대한 권한 추가
sudo rabbitmqctl set_user_tags test administrator

# vhost 권한 추가
sudo rabbitmqctl set_permissions -p / test ".*" ".*" ".*"

# 사용자 리스트 확인
sudo rabbitmqctl list_users
```

## delay 플러그인 설치

RabbitMQ Delayed Message Plugin을 사용하면 일정 시간이 지나면 메시지를 전달하는 쉽게 지연 큐를 구현할 수 있습니다. 하지만 사용할 수 있는 버전정보가 있으니 잘 확인하시고 사용하셔야 합니다. 위의 설치를 그대로 따라하셨다면 문제가 없습니다. 관련 문서는 \[[여기](https://github.com/rabbitmq/rabbitmq-delayed-message-exchange)\]를 참고하시면 됩니다.

```
# delay 플러그인 설치
# 설치한 버전의 plugin 디렉토리로 이동 -> 각자 설치된 버전명이 다를 것입니다.
cd /usr/lib/rabbitmq/lib/rabbitmq_server-버전명/plugins

# 설치
sudo wget https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/3.9.0/rabbitmq_delayed_message_exchange-3.9.0.ez

# 플러그인 활성화
sudo rabbitmq-plugins enable rabbitmq_delayed_message_exchange

# rabbitmq 시작
sudo service rabbitmq-server start
```

## 3\. RabbitMQ 구성하기

---

## Delay Exchange 구성

![그림1](2.%20Area/ReadItLater/assets/그림1.PNG)

ec2IP:15672 를 통해 접속하시고 앞서 만들었던 계정(test, test)으로 로그인해줍니다. exchanges 왼쪽 하단에 Add a new exchange를 클릭해줍니다.

![그림2](2.%20Area/ReadItLater/assets/그림2.PNG)

-   Name : exchange의 이름을 명시합니다.
-   Type : 기본적으로 direct, fanout, topic, headers가 있습니다.
    -   지연 큐를 구현하기 위해서 추가한 rabbitmq\_delayed\_message\_exchange 플러그인으로 추가된 x-delayed-message 타입을 선택합니다.
-   Durability : 브로커 재시작 될 때 남아있는지 여부
    -   durable : 재시작되어도 메시지가 유지
    -   transient : 재시작되면 메시지가 사라짐
-   Auto-delete : 마지막 Queue 연결이 해제되면 삭제
-   Arguments : 추가 옵션 명시
    -   앞서 타입에 x-delayed-message로 명시해줬기 때문에 x-delayed-type 인자로 exchange의 타입을 명시해줘야 합니다. 위에서는 x-delayed-type 의 인자에 direct 를 넣어주었습니다.

## Queue 구성

![그림3](2.%20Area/ReadItLater/assets/그림3.PNG)  
위에서 만든 exchange에 연결할 큐를 생성해줍니다. Exchange를 구성한것과 마찬가지로 상단에 Queues 탭을 선택하고 왼쪽 하단에 Add Queue를 선택합니다. 큐의 이름을 지정하고 바로 만들어줍니다.

## Binding

![그림4](2.%20Area/ReadItLater/assets/그림4.PNG)  
다시 Exchanges 탭으로 돌아와서 만들어준 Exchange를 클릭합니다. order-direct를 클릭하겠습니다.

![그림5](2.%20Area/ReadItLater/assets/그림5.PNG)  
bindings를 클릭하고 앞서 만든 큐를 적어주고 라우팅 키도 정해서 넣어줍니다.  
이렇게 Rabbitmq에서의 설정은 끝났습니다.

## 4\. 클러스터, 미러링 구성하기

---

## 클러스터란?

![그림7](2.%20Area/ReadItLater/assets/그림7.PNG)  
**RabbitMQ Clustering은 다수의 RabbitMQ를 하나의 RabbitMQ처럼 묶어서 사용하는 방식입니다.**

**특징**

-   **RabbitMQ Cluster을 구성하는 RabbitMQ는 Queue를 제외한 모든 정보를 공유합니다.** 따라서 동일한 Cluster안에 있는 모든 RabbitMQ는 동일한 Exchange를 갖고 있습니다.
-   **RabbitMQ Cluster에서 기본적으로 Queue는 한개만 존재합니다.** 위 그림을 보면 Queue A와 Queue B는 하나만 존재하는 것을 확인할 수 있습니다.
-   동일 Cluster안의 있는 모든 RabbitMQ는 **Erlang Cookie라고 불리는 비밀키를 공유** 하여 상대방 RabbitMQ가 동일한 Cluster에 있는 RabbitMQ인지 확인합니다. 또한 Cluster를 제어하는 CLI Tool 또한 Cluster의 Erlang Cookie를 갖고 있어야 해당 Cluster를 제어 할 수 있습니다.
-   RabbitMQ는 Disk, Ram 2가지 모드가 있습니다.
    -   Disk 모드
        -   Default Mode
        -   내부 데이터 정보들을 디스크에 저장합니다.
        -   디스크에 데이터를 저장하기 때문에 데이터 유실을 방지할 수 있습니다.
        -   Cluster 구성시 반드시 하나 이상의 RabbitMQ는 반드시 Disk Mode로 동작시켜야 합니다.
    -   Ram 모드
        -   Message, Message Index, Queue Index, 다른 RebbitMQ의 상태 정보를 제외한 나머지 모든 정보를 Memory (RAM)에만 저장하고 구동합니다. Message와 관련된 정보는 여전히 Disk에 저장되기 때문에 RAM Mode를 이용해도 Message 처리량은 증가하지 않습니다.
        -   Exchange, Queue, Binding 등의 정보가 굉장히 많고 설정이 자주 변경되는 환경에서는 RAM Mode를 이용하여 빠르게 설정을 변경 할 수 있습니다.
        -   데이터를 Ram에 보관하기 때문에 문제가 생겼을 시 데이터 유실이 존재합니다.
        -   peer node가 시작될 때 반드시 데이터가 동기화되어야 합니다.

## 미러링이란?

![그림8](2.%20Area/ReadItLater/assets/그림8.PNG)  
**RabbitMQ Mirroring은 RabbitMQ Cluster 안에서 Meesage를 다수의 RabbitMQ에 복사하여 저장하는 기법입니다.**

Clustering은 Queue를 제외한 모든 정보를 공유하기 때문에 메시지가 담겨있는 Queue에 대한 보호 장치라고 보시면 됩니다.  
Master Queue는 원본 Queue를 의미하며 Slave Queue는 Master Queue를 복제한 Queue를 의미합니다. 각 Master Queue마다 다른 개수의 Slave Queue를 설정 할 수 있습니다.

**Master Queue와 Slave Queue 사이의 Mirroring은 기본적으로 Sync 방식입니다.** 즉 Producer가 Mirroring된 Queue에게 Message를 전송하면 RabbitMQ는 받은 Message를 Master Queue에만 넣고 Producer에게 ACK를 보내는 것이 아니라, 모든 Slave Queue와 Mirroring이 완료된 후에야 Producer에게 ACK를 보냅니다. 따라서 Slave Queue의 개수가 많아질 수록 오히려 Message 처리량이 떨어진다. RabbitMQ에서는 Slave Queue의 개수를 정족수를 만큼만 구성하는 것이 좋습니다. 예를들어 Cluster가 5개의 RabbitMQ로 구성되어 있다면 정족수인 3을 맞추어 1 Master Queue, 2 Slave Queue를 구성하면 됩니다.

**Mirroring을 통한 Slave Queue는 HA를 위한 기법이지 Message 처리량 향상을 위한 기법이 아닙니다.** Slave Queue가 있어도 Producer의 모든 Message는 오직 Master Queue로만 전달되고, Consumer에게 전달되는 Message는 오직 Master Queue로부터 전송되는 Message입니다. Slave Queue는 오직 Master Queue와 Mirroring하는 동작만을 수행합니다. 따라서 Slave Queue의 개수를 늘려도 Message 처리량은 분산되지 않습니다.

Mirroring 정책이 변경되거나, Cluster에 새로운 RabbitMQ가 추가되면서 새로운 Slave Queue도 추가 될 수 있습니다. **새로운 Slave Queue는 처음에는 아무런 Message가 없는 빈 상태를 유지합니다.** 즉 Slave Queue는 Master Queue가 갖고 있던 기존의 Message를 복사하여 가져오지 않습니다. 오직 Slave Queue가 생성된 이후 Master Queue가 받은 새로운 Message들만 복사하여 가져옵니다. 따라서 처음에 새로운 Slave Queue가 갖고 있는 Message는 Master Queue가 갖고있는 Message와 다르게 됩니다. 이러한 상태를 RabbitMQ에서는 Unsynchronised 상태라고 표현합니다. 시간이 지남에 따라서 Master가 기존의 Message들을 Consumer가 소비하기 때문에 Unsynchronised Slave Queue는 결국에는 Synchronised Slave Queue가 됩니다. 이에 대해서 대안으로 ha-sync-mode를 설정하면 되는데 이 설정을 키게되면 Sync하는 동안 해당 Queue가 무응답 상태가 되기 때문에 가용성에 좋지않은 영향을 주기 때문에 자연스럽게 소비되어 Sync되게 하는게 좋습니다.

## 구성하기

### 모든 EC2 공통 세팅

-   EC2 3대
    -   rabbit1 : 10.0.7.169
    -   rabbit2 : 10.0.7.206
    -   rabbit3 : 10.0.7.42

RabbitMQ가 설치된 상태로 가정하고 시작하겠습니다.  
아직 이유를 찾지 못했지만 3대의 서버에 지연 큐 플러그인을 세팅하니 오류가 발생해서 1번 서버에서만 지연 큐 플러그인을 설치했습니다.

```
# 시간 변경
sudo rm /etc/localtime
sudo ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# 각각 서버에 대해 1,2,3 으로 호스트 이름 변경하기
sudo hostnamectl set-hostname rabbit1
# sudo hostnamectl set-hostname rabbit2
# sudo hostnamectl set-hostname rabbit3

# 서버에서 도메인 등록
sudo vi /etc/hosts
10.0.7.169 rabbit1
10.0.7.206 rabbit2
10.0.7.42 rabbit3

# 재부팅
sudo reboot
```

### Erlang 쿠키 맞추기

```
# rabbit1 서버
sudo vi /var/lib/rabbitmq/.erlang.cookie
```

rabbit1 서버를 기준으로 쿠키를 맞추겠습니다. 출력된 값으로 rabbit2, rabbit3 서버의 .erlange.cookie 값을 수정합니다.

### 클러스터 구성하기

```
# 시작 - 3개 서버 다 시작
sudo service rabbitmq-server start

# 각자 상태 확인 - 아래와 같이 각자의 상태만 확인 될 것입니다.
# Cluster status of node rabbit@rabbit1 -> 각각의 호스트명을 확인할 수 있습니다. 클러스터링 묶을때 사용합니다
sudo rabbitmqctl cluster_status

## 1번은 나두고 2,3번 작업 시작 ##
# 2번 서버 중단
# 전체를 stop하면 rabbitmqctl 명령 자체가 먹지 않으므로 자체를 종료시키는게 아니라 stop_app을 사용해야합니다.
sudo rabbitmqctl stop_app

# 1번 서버로 클러스터 붙이기
sudo rabbitmqctl join_cluster rabbit@rabbit1

# 2번 시작
sudo rabbitmqctl start_app

# 3번 서버
sudo rabbitmqctl stop_app

# 1번 서버로 클러스터 붙이기 -> 2번 서버를 1번에 붙인이상 3번에서는 rabbit1이나 rabbit2 아무대나 붙여도 무관
sudo rabbitmqctl join_cluster rabbit@rabbit1

# 3번 시작
sudo rabbitmqctl start_app

# 클러스터 구성 상태 확인
sudo rabbitmqctl cluster_status

## 출력화면 ##
Disk Nodes

rabbit@rabbit1
rabbit@rabbit2
rabbit@rabbit3

Running Nodes

rabbit@rabbit1
rabbit@rabbit2
rabbit@rabbit3

#### 참고 ####
### node type 변경 ###
# node stop
sudo rabbitmqctl stop_app

# node type 변경
sudo rabbitmqctl change_cluster_node_type disk
sudo rabbitmqctl change_cluster_node_type ram
```

### 미러링 구성하기

**종류**

-   all
    -   클러스터내의 모든 노드를 미러링
-   exactly
    -   특정 수 만큼의 노드만 미러링
    -   ha-params으로 count로 미러링 수 지정
    -   count가 총 노드스보다 많으면 all과 동일하게 동작
    -   미러링된 노드가 죽었으면 count를 채우기 위해 다른 노드를 새 미러로 형성
-   nodes
    -   특정 이름의 노드들끼리 미러링
    -   ha-params으로 노드이름(node names) 지정

**예시**

```
rabbitmqctl set_policy ha-all "^ha\." '{"ha-mode":"all"}'
```

-   정책의 이름 : ha-all
-   매칭할 Queue 이름 : ^ha.은 정규식으로 표현된 미러링할 queue 이름으로 ha.로 시작하는 모든 queue
-   정책 : 모든 노드를 미러링

```
rabbitmqctl set_policy ha-two "^two\." '{"ha-mode":"exactly","ha-params":2,"ha-sync-mode":"automatic"}'
```

-   정책의 이름 : ha-two
-   매칭할 Queue 이름 : ^two.은 정규식으로 표현된 미러링할 queue 이름으로 two.로 시작하는 모든 queue
-   정책 : 2개의 노드를 미러링, 새로운 노드가 추가되면 Sync

```
rabbitmqctl set_policy ha-nodes "^nodes\." '{"ha-mode":"nodes","ha-params":["rabbit@nodeA", "rabbit@nodeB"]}'
```

-   정책의 이름 : ha-nodes
-   매칭할 Queue 이름 : nodes.은 정규식으로 표현된 미러링할 queue 이름으로 nodes.로 시작하는 모든 queue
-   정책 : rabbit@nodeA,rabbit@nodeB 노드간 미러링

```
rabbitmqctl set_policy -p myQueue ha-all "^.*\.ha.*" '{"ha-mode":"all"}'
```

myQueue Virtual Host 속한 이름에 .ha 가 포함된 Queue를 모두 미러링 하는 정책

-   특정 Virtual Host에 적용 : -p myQueue -> myQueue virtual host 지정
-   정책의 이름 : ha-all
-   매칭할 Queue 이름 : myQueue Virtual host에 속한 .ha가 포함된 모든 큐
-   정책 : 모든 노드를 미러링

### 클러스터에서 제거하기

```
# 중지
sudo rabbitmqctl stop_app
# 리셋
rabbitmqctl reset

# 해당 노드가 먹통이라 다른 서버에서 원격 제거
# 3번 서버가 먹통이라면

# 1번이나 2번 서버에서 원격 제거
sudo rabbitmqctl forget_cluster_node rabbit@rabbit3
# 추후 동작할 때 3번 서버에서 reset하여 클러스터에서 완전 제거되도록 합니다.
```

## 5\. Spring 연동하기

---

## 설정하기

```
# application.yml
spring:
  rabbitmq:
    host: rabbitMQ host ip 10.0.7.169
    port: 5672
    username: 아이디
    password: 패스워드

# build.gradle
implementation 'org.springframework.boot:spring-boot-starter-amqp'
```

application.yml 파일에 rabbitmq 설정을 명시해줍니다. 추가적인 설정을 해주지 않았다면 5672 포트로 열립니다.  
build.gradle에 의존성을 추가해줍니다.

## Config

spring boot에서 의존성을 주입한다면 connection factory 와 RabbitTemplate은 자동으로 생성됩니다.  
기본적으로 사용할 값들을 따로 클래스로 분리하겠습니다.  
**RabbitUtil.java**

```
public class RabbitUtil {
    static final String TOPIC_EXCHANGE_NAME = "order-direct";
    static final String QUEUE_NAME = "order-queue";
    static final String ROUTING_KEY = "order-queue";
    static final long DELAY_TIME = 3000;
}
```

### RabbitMQ GUI로 설정한 경우

```
@Bean
public MessageConverter messageConverter(){
    return new Jackson2JsonMessageConverter();
}
```

위에서 queue, exchange, binding을 GUI에서 설정했다면 메시지 컨버터로 사용할 컨버터만 빈으로 등록해주면 끝입니다.

### 모든 설정 spring에서 하기

위에서 RabbitMQ GUI를 이용해서 queue, exchange, binding을 세팅하지 않고 spring에서 코드만으로 설정하는 방법이 있습니다.

```
@Configuration
public class RabbitConfig {
    @Bean
    public MessageConverter messageConverter(){
        return new Jackson2JsonMessageConverter();
    }
    
    @Bean
    Queue queue() {
        // 인자 -> 큐이름, durable
        return new Queue(RabbitUtil.QUEUE_NAME, false);
    }

    @Bean
    CustomExchange exchange() {
        Map<String,Object> headers = new HashMap<>();
        headers.put("x-delayed-type","direct");
        // 플러그인 때문에 CustomExchange 클래스를 사용했지만,
        // 플러그인을 사용하지 않는다면 기본적으로 주어지는 directExchange 와 같은 클래스를 사용
        // 인자 -> exchange명, 타입, durable, autoDelete, args
        return new CustomExchange(RabbitUtil.TOPIC_EXCHANGE_NAME,"x-delayed-message",true,false,headers);
    }

    @Bean
    Binding binding(Queue queue, CustomExchange exchange) {
        // 인자 -> 큐, exchange, 라우팅 키
        return BindingBuilder.bind(queue).to(exchange).with(RabbitUtil.ROUTING_KEY).noargs();
    }
}
```

코드 그대로 queue, exchange를 생성하고 바인딩하는 작업까지 설정할 수 있습니다. 스프링을 띄우면 띄우면서 알아서 정의한대로 생성됩니다.

## 메시지 보내기

```
@Service
@RequiredArgsConstructor
public class RabbitmqService {

    private final RabbitTemplate rabbitTemplate;

    public void sendMessage() throws IOException {

        Member member = Member.builder()
                .name("member")
                .age(20)
                .build();

        rabbitTemplate.convertAndSend(RabbitUtil.TOPIC_EXCHANGE_NAME, RabbitUtil.ROUTING_KEY, member,
                new MessagePostProcessor() {
                    @Override
                    public Message postProcessMessage(Message message) throws AmqpException {
                        MessageProperties props = message.getMessageProperties();
                        props.setHeader("x-delay",RabbitUtil.DELAY_TIME);
                        return message;
                    }
                }
        );
    }
}
```

간단하게 Member 객체를 만들어서 메시지를 보냈습니다. convertAndSend를 이용하면 객체를 메시지 컨버터를 이용하여 메시지 객체로 변환시켜 전송해줍니다.  
인자는 위에 주석으로 설명에서 변수명만 보면 쉽게 이해가 될 것입니다. MessagePostProcessor는 헤더를 추가할 때 사용하는 것입니다. **x-delay의 키로 밀리세컨드 시간을 명시하면 해당 시간이 지난 후에 큐로 전달되게 됩니다.** 위에서 설치한 플러그인으로 인해 가능한 것입니다.

## 메시지 수신하기

```
@Component
@RequiredArgsConstructor
public class RabbitReceiver {
    @RabbitListener(queues = RabbitUtil.QUEUE_NAME)
    public void receive(Member member){
        System.out.println("member = " + member.getName());
        System.out.println("member = " + member.getAge());
    }
}
```

수신은 간단하게 메서드에 @RabbitListener 애노테이션과 함께 큐의 이름을 명시해주면 큐에 메시지가 쌓이면 바로 가져오게 됩니다.

\[[https://www.rabbitmq.com/clustering.html](https://www.rabbitmq.com/clustering.html)\]  
\[[https://ssup2.github.io/theory\_analysis/RabbitMQ\_Clustering\_Mirroring/](https://ssup2.github.io/theory_analysis/RabbitMQ_Clustering_Mirroring/)\]  
\[[https://github.com/rabbitmq/rabbitmq-delayed-message-exchange](https://github.com/rabbitmq/rabbitmq-delayed-message-exchange)\]  
\[[https://blog.leocat.kr/notes/2018/07/31/rabbitmq-delayed-queue](https://blog.leocat.kr/notes/2018/07/31/rabbitmq-delayed-queue)\]