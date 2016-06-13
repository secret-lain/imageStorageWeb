■ 프로젝트 준비

・Eclipse mars 4.5.2 (or near version)

・STS(Spring Tool Suite) 3.6.3

・Tomcat v7.0 or v8.0 (recommended 8.0)

・git

・JDK 1.7 ↑(프로젝트가 1.7을 기준으로 구동)



■ 프로젝트 설치

◎ Git

- Git 란?

git 은 버전관리시스템(VCS) 중 하나이다.
하나의 프로젝트를 스냅샷이라는 단위로 저장하기 때문에, 버전을 기록할 수 있고
다양한 사용자간의 코드를 하나로 합쳐주기도 하는 시스템이다.
git를 설치하기위해 https://git-scm.com/ 에서 순정 git를 받을 수도 있고,
TortoiseGit, Github, 이클립스의 EGit 등 git를 편하게 활용할 수 있게 도와주는
플러그인, GUI 어플리케이션도 있다. 아무거나 깔아도 된다.
Windows의 탐색기와 연동되는 TortoiseGit 가 가장 편하지만,
README 는 순정 git의 git bash 를 사용해 명령어로 clone 할 것이다.
(그러나 실제로 commit, push 할때는 EGit을 사용할 예정.)


- Git 를 통한 프로젝트 Clone

우리는 git에서 제공하는 몇 명령어중 정말 몇가지만 사용할 것이다.
먼저 git bash를 실행시키고 나서 자기를 증명하기위해 이름을 써두자.
이것은 Gitlab 로그인 아이디가 아닌, commit 시 자기가 올렸다는걸 증명하기 위함이다.

git config --global user.name "(이름)"
git config --global user.email "(이메일)"

양식은 자유.


먼저 자신이 다운받을 폴더로 접근한다. 접근방식은 리눅스와 같다.
그 후 아래의 명령어를 입력

git clone https://gitlab.com/imagineGroup/imagineSpring.git

그 후 자신의 GitLab 아이디, 비밀번호를 입력하면 된다. 참 쉽죠?




◎ 프로젝트 준비

- eclipse plugin 설치

우리는 SpringFramework에서 제공하는 Spring Legacy Project 중
Spiring MVC Project 로 만든 프로젝트를 사용한다.
이것은 SpringToolSuite(STS) 라는 플러그인이 제공해주는 세팅된 프로젝트인데,
어쨌든간 스프링을 쓰기 위해서 이를 다운받는다.
Spring Starter Project는 일반 SpringFramework가 아닌 SpringBoot를 사용한다.
자세한건 찾아봐

eclipse에 들어간 다음 아래와 같이 찾아 들어간다.
Help -> Eclipse Marketplace -> STS Find -> 최신버전 설치(아마도 3.7.3)

동의누르고 설치하면 뭐가 알아서 존나게 깔린다.

- 프로젝트 Import 하기

솔직히 이거 모르면 자살하자.
왼쪽 창의 Package Exporer(Perspective에 따라 다를 수 있다)에 오른쪽 버튼 클릭 ->
import -> Existing Projects into Workspace -> 프로젝트 선택

- Maven 설치하기

STS를 받아놨다면 maven 또한 자동으로 설치되어있을 것인데, maven은 한마디로
라이브러리 자동 설치 플러그인이다.
maven 은 pom.xml 이라는 명세서에 적힌대로 컴파일 및 플러그인을 다운받아준다.
너가 김밥천국가서 메뉴표에다가 체크해놓고 주문하면 그거 나오는거랑 똑같다.
먼저 pom.xml 에 오른쪽버튼으로 클릭한 뒤, Run as.. 탭에 마우스를 갖다대보자.

Maven을 실행시킬 수 있는 버튼들이 나오는데, 먼저 clean을 해준 뒤, test를 해보자.
test는 실제 설치는 아니고 드라이테스트만 하는 버튼이다.
문제가 없다면 maven install로 필요한 라이브러리를 설치하고, 문제가 생긴다면 나에게 문의하도록.
(애로사항이 꽃 피는 부분임.)




◎ 서버준비

- Tomcat context root 설정

보안상의 이유로 이클립스는 web 프로젝트를 최상위 도메인에서 실행을 못하게 해놨다.
이대로라면 나중에 배포판을 만들때 js 나 이미지 링크들의 위치가 전부 망가지게
되는데, 그렇기 때문에 최상위로 옮겨놔야 한다.

등록된 tomcat 서버를 더블클릭하면 설정창이 뜬다.

창의 가장 아래쪽에 Overview, Modules 라고 써있는 탭 중 Modules를 클릭.
한번이라도 프로젝트를 서버로 실행했다면 자동으로 Web Module로 등록이 되어있겠지만,
그렇지 않다면 오른쪽의 Add Web Module을 클릭

Modules = Imagine
Path: /




■ 프로젝트 설명

・폴더는 존나 많고 패키지는 어디있으며, 뭐가 뭔지 졷도 모르겠고 main 도 없다.
뭔 개소린지 보자.

Imagine
　ㄴsrc/main/java	    	//.java인 파일들은 다 이곳에 넣는다.
　　ㄴcom.spring.test
　　　ㄴHomeController.java	//얘가 스프링이 웹서버 사용자의 요청을 처리해서
　　　                        어떤 페이지를 보여줄지 결정한다.
　ㄴsrc/main/resources		//건들필요 없다.
　ㄴsrc			    	    //실제 프로젝트의 폴더
　　ㄴmain		    	    //원래는 main, test 둘로 나뉘어 있는데
　　                          우린 그딴거 모르고 main ㄱ
　　　ㄴwebapp			    //웹서버의 루트폴더에 해당한다.
　　　　ㄴresources		    //js파일이나 css를 담아둘 용도의 폴더
　　　　ㄴWEB-INF	    	//웹서버의 그것
　　　　　ㄴclasses	    	//jsp는 속도를 위해 한번 실행된 자바코드
　　　　　                    (서블릿이나 jsp내의 코드)를 클래스화해서
　　　　　                    서버가 꺼질때가지 저장해둔다.
　　　　　ㄴspring	    	//건들필요 없다.
　　　　　ㄴviews	    	//사용자가 진짜로 볼 페이지. jsp파일들이 위치함.
　　　　　ㄴweb.xml	    	//DispacherServlet에 대한 명세. 알 필요 없음.
　ㄴtarget		        	//실제 배포때 사용되는 곳. maven이 자동생성하기
　                            때문에 삭제해도 또생긴다.
　ㄴpom.xml		        	//maven build 명세서. maven을 다룰 줄 안다면 필요한
　                            라이브러리 dependency를 추가해도 상관없다.
