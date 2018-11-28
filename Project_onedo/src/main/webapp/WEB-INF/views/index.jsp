<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>OneDo - 카페상권분석</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- header include 시작 -->
  <jsp:include page="${pageContext.request.contextPath}/resources/includes/headTagConfig.jsp"/>
  <!-- header include 종료 -->
  
</head>
<body class="animsition">

  <!-- header include 시작 -->
  <jsp:include page="${pageContext.request.contextPath}/resources/includes/header.jsp"/>
  <!-- header include 종료 -->
  
  <!-- asideMenu include 시작 -->
  <jsp:include page="${pageContext.request.contextPath}/resources/includes/asideMenu.jsp"/>
  <!-- asideMenu include 종료 -->

  <!-- 로그인 모달 include 시작 -->
  <jsp:include page="${pageContext.request.contextPath}/resources/includes/modal/loginModal.jsp"/>
  <!-- 로그인 모달 include 종료 -->

  <!-- 회원가입 모달 include 시작 -->
  <jsp:include page="${pageContext.request.contextPath}/resources/includes/modal/registModal.jsp"/>
  <!-- 회원가입 모달 include 종료 -->
  
  <!-- 메인페이지 슬라이드쇼 -->
  <section class="section-slide">
    <div class="wrap-slick1">
      <div class="slick1">
        <div class="item-slick1 item1-slick1" style="background-image: url(${pageContext.request.contextPath}/resources/images/master-slides-03.jpg);">
          <div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150" style="font-size: 50px; color: white;">
            <span id="introText1" style="font-size: 50px; font-weight: bold; color: white"></span>
          </div>
        </div>

        <div class="item-slick1 item2-slick1" style="background-image: url(${pageContext.request.contextPath}/resources/images/master-slides-02.jpg);">
          <div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150">
            <span id="introText2" style="font-size: 50px; font-weight: bold; color: white"></span>
          </div>
        </div>

        <div class="item-slick1 item3-slick1" style="background-image: url(${pageContext.request.contextPath}/resources/images/master-slides-01.jpg);">
          <div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150">
            <!-- 메인 페이지에서 서비스 소개 끝나고 나타나는 버튼 // 클릭 시, 분석 페이지로 이동 -->
            <span id="introText3" style="font-size: 50px; font-weight: bold; color: white"></span>
            <a href="analysis.html" class="btn1 flex-c-m size1 txt3 trans-0-4"> 분석 시작하기 </a>
          </div>
        </div>
      </div>
    </div>
    <!-- 메인 페이지 이미지 슬라이드 토글 -->
    <div class="wrap-slick1-dots"></div>
  </section>


<!-- 회원가입 모달 include 시작 -->
<jsp:include page="${pageContext.request.contextPath}/resources/includes/footer.jsp"/>
<!-- 회원가입 모달 include 종료 -->

<!-- ================================= 자바스크립트(JavaScript) ================================== -->
<!-- 메인페이지 홈페이지 소개 타이핑 메시지 JavaScript -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/typingMessage.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/popper.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script type="text/javascript"
  src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/moment.min.js"></script>
<script type="text/javascript"
  src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script type="text/javascript"
  src="${pageContext.request.contextPath}/resources/vendor/slick/slick.min.js"></script>
<script type="text/javascript"
  src="${pageContext.request.contextPath}/resources/js/slick-custom.js"></script>
<!--===============================================================================================-->
<script type="text/javascript"
  src="${pageContext.request.contextPath}/resources/vendor/parallax100/parallax100.js"></script>
<script type="text/javascript">
  $('.parallax100').parallax100();
</script>
<!--===============================================================================================-->
<script type="text/javascript"
  src="${pageContext.request.contextPath}/resources/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script type="text/javascript"
  src="${pageContext.request.contextPath}/resources/vendor/lightbox2/js/lightbox.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<!--===============================================================================================-->
<!-- 모달 javascript -->
<script src="${pageContext.request.contextPath}/resources/js/modal.js"></script>

<!-- 회원가입관련 javascript -->
<script type="text/javascript">

// 폼 제출 전, email 합쳐주기
function beforeSubmit() {
  var memberEmail = $('#email').val() +'@'+ $('#emailHost').val();
  $('#memberEmail').val(memberEmail);
};


// 아이디 중복확인을 위한 비동기
$(function() {
	// id체크여부
	var idck = 0;
	
	// idDup버튼 클릭 시, 비동기로 아이디 중복확인
	$('#dupCheck').on('click', function() {
		var userid = $('#userid').val();
		
		$.ajax({
			type : 'GET',
			url : "member/idDupCheck/"+userid,
			dataType : "json",
			success : function(data) {
				//비동기 성공 시
				if(data.cnt > 0){
					console.log("-----비동기결과 cnt값: "+cnt);
					alert("중복!");
					$('#userid').val("");
					$('#userid').focus();
				}else{
					console.log("-----비동기결과 cnt값: "+cnt);
					alert("사용가능!");
					$('#userid').val(userid);
					$('#userid').attr('readonly', 'readonly');
					$('#dupCheck').attr('disabled', 'disabled');
					$('#userpw').focus();
					idck = 1;
				}
			},
			error : function(error) {
				alert("비동기 오류!");
			}
		});
	});
});

// email과 emailHost 연결
$(function(){
	$('#emailCertify').on('click', function() {
		
		// email값 비동기로 전송
		var useremail = $('#email').val()+'@'+$('#emailHost').val();
		console.log("이메일값: "+$('#email').val());
		
		//이메일 입력 안했을경우 return
		if($('#email').val().trim() === ''){
			console.log("이메일입력안함");
			alert('이메일을 입력해 주세요');
			return;
		}
		
		$('#useremail').val(useremail);
		// 인증버튼클릭으로 생성된 임의의 코드저장할 변수
		var code;
		
		$.ajax({
			type : 'GET',
			url : "member/emailCertify/"+useremail,
			dataType : "json",
			success : function(data) {
				alert("비동기 성공.."+data.code+"인증번호를 보냈습니다. 확인 후 입력해주세요");
				// 코드확인도 비동기 필요...
				code = data.code;
				console.log(code);
				// 코드입력란 활성화, focus
				$('#certifyCodeInput').removeAttr('disabled');
				$('#certifyCodeInput').focus();
				$('#emailCertify').text('확인');
			},
			error : function(error) {
				alert("비동기오류");
			}
			
		});
		
	});
});
</script>  
  <!-- 로그인 비동기 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery.Form.js"></script> 
<script src="/resources/js/login.js"></script> 

</body>
</html>