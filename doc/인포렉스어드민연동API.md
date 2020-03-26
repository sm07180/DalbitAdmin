
* 달빛라디오 어드민에서 인포렉스 어드민 로그인 연동을 위한 API


[로그인 API]

  해당 API 를 태우면 정상로그인인경우 .inforex.co.kr 도메인으로 몇개의 쿠키가 발생하고
  유저정보 리턴한다.
  쿠키는 공통메뉴를 엑세스하기위하여 필요한 쿠키들이다.
  성공인경우 리턴받은 유저정보를 기반으로 dalbit.inforex.co.kr 에서 자체적으로 사용할 쿠키를 만들어서 처리하세요.

  url : http://admin.inforex.co.kr/loginout.html
  method : POST
  post data : {
    userid: xxxx,         // 아이디
    password: xxxx,       // 패스워드
    mode: 'login',        // 로그인인경우 해당값으로 고정.
    where: 'dalbit'       // 요값도 고정.
  }
  
  Response JSON: {
    success: "y" or "n"
    reason: "xxxxxxxxxxxxxxxxxxxxx"      <-- 실패인경우 사유.
    userInfo: {                          <-- 성공인경우 로그인유저정보 (추가로 더 필요한 정보가 있으면 요청하세요!!!)
      emp_no : xxxxx,        // 사번
      name: xxxxx,           // 이름
      userid: xxxxxx,        // 아이디
      sex: 'm' or 'f'        // 성별
    }
  }
    

[로그아웃 API]

  로그인할때 발생시켰던 쿠키를 지우는 일을 함.

  url : http://admin.inforex.co.kr/loginout.html
  method : POST
  post data : {
    mode: 'logout',      // 고정
    where: 'dalbit'      // 고정
  }

  Response JSON: {
    success: "y"      <-- 로그아웃 실패는 없어서 무조건 'y' 로.
  }


[공통메뉴정보 가져오는 API]
  
  로그인 API 를 태운후 생성된 쿠키를 참조해서 해당유저 권한의 메뉴들을 리턴한다.
  각 항목에 해당하는 메뉴의 URL 이 리턴되며 달빛 어드민 우측에 프레임으로 로드하면 됩니다.
  응답 JSON 은 admin.inforex.co.kr 로그인하면 보이는 좌측 메뉴트리에 해당하는 메뉴트리와 같습니다.

  url : http://admin.inforex.co.kr/dalbit/getCommonMenu.php
  method : GET

  Response JSON: {
    "교육자료실": {
       OJT 및 실무과정: "http://admin.inforex.co.kr/xxxxxxxxxxxxxxxxxxxxxxxxxxxx"
       규정: "http://admin.inforex.co.kr/xxxxxxxxxxxxxxxxxxxxxxx"
             :
             :
    },
    인포렉스:
      인포렉스현황 : {
           :
      }
      :
      :
  }
  