<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>분석</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- header include 시작 -->
  <jsp:include page="${pageContext.request.contextPath}/resources/includes/headTagConfig.jsp"/>
  <!-- header include 종료 -->
    
</head>
<body class="animsition bg1-pattern">
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
	<section id="analysis_section">
		<div class="container" style="margin-top: 50px;">
			<div class="row">
				<div class="col-sm-4">
					<div class="card" style="width: 100%;">
						<div class="card-body">
							<div class="form-group">
								<h4 class="card-title fw-b">Step 1. 구 선택</h4>
								<select class="form-control">
									<option default>강남구</option>
									<option>강동구</option>
									<option>강북구</option>
									<option>강서구</option>
									<option>관악구</option>
									<option>광진구</option>
									<option>구로구</option>
									<option>금천구</option>
									<option>노원구</option>
									<option>도봉구</option>
									<option>동대문구</option>
									<option>동작구</option>
									<option>마포구</option>
									<option>서대문구</option>
									<option>서초구</option>
									<option>성동구</option>
									<option>성북구</option>
									<option>송파구</option>
									<option>양천구</option>
									<option>영등포구</option>
									<option>용산구</option>
									<option>은평구</option>
									<option>종로구</option>
									<option>중구</option>
									<option>중량구</option>
								</select>
							</div>
							<br>
							<div style="width: 100%; height: 2px; background-color: #27b2a5">&nbsp;</div>
							<br>
							<div class="form-group ">
								<h4 class="card-title fw-b">Step 2. 동  선택</h4>
								<select class="form-control">
									<option default>동</option>
								</select>
							</div>
							<br>
							<div style="width: 100%; height: 2px; background-color: #27b2a5">&nbsp;</div>
							<br>
							<div class="form-group">
								<h4 class="card-title fw-b">Step 3. 사업금 선택</h4>
								<div id="slider"></div>
							</div>
							<br>
							<div style="width: 100%; height: 2px; background-color: #27b2a5">&nbsp;</div>
							<br>
							<div class="form-group">
								<h4 class="card-title fw-b">Step 4. 보유 자산 선택</h4>
								<div id="slider"></div>
							</div>
							<br><br>
							<div class="form-group">
								<button type="button" style="float: left;">분석하기</button><button type="button" style="float: right;">초기화</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-8">
					<div style="width: 100%; height: 546px; background-color: white;" class="card-body">다음지도 API</div>
				</div>
			</div>
		</div>
	</section>

	<section>
		<div class="container" style="margin-top: 40px;">
			<h4><b>강남구 역삼동</b></h4>
			<div class="row" style="margin-top: 25px;">
				<div class="col">
					<div class="card" style="width: 100%;">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> </div>
					</div>
				</div>
				<div class="col">
					<div class="card" style="width: 100%;">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>  </div>
					</div>
				</div>
				<div class="col">
					<div class="card" style="width: 100%;">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> </div>
					</div>
				</div>
			</div>
			<div class="row" style="margin-top: 25px;">
				<div class="col">
					<canvas id="myBarChart" width="100%;" height="100%;"></canvas>
				</div>
				<div class="col">
					<canvas id="myLineChart" width="100%;" height="100%;"></canvas>
				</div>
			</div>
			<div class="row" style="margin-top: 25px;">
				<div class="col"></div>
				<div class="col"><button type="button" style="width: 100%;" class="" onclick="location.href='/inputInfo/'"">맞춤 대출 상품 확인</button></div>
				<div class="col"></div>
			</div>
		</div>
	</section>

	<script>
		var ctxBar = document.getElementById("myBarChart").getContext('2d');
		var myBarChart = new Chart(ctxBar, {
			type: 'bar'
			, data: {
				labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"]
				, datasets: [{
					label: '# of Votes'
					, data: [12, 19, 3, 5, 2, 3]
					, backgroundColor: [
				'rgba(255, 99, 132, 0.2)'
				, 'rgba(54, 162, 235, 0.2)'
				, 'rgba(255, 206, 86, 0.2)'
				, 'rgba(75, 192, 192, 0.2)'
				, 'rgba(153, 102, 255, 0.2)'
				, 'rgba(255, 159, 64, 0.2)'
			]
					, borderColor: [
				'rgba(255,99,132,1)'
				, 'rgba(54, 162, 235, 1)'
				, 'rgba(255, 206, 86, 1)'
				, 'rgba(75, 192, 192, 1)'
				, 'rgba(153, 102, 255, 1)'
				, 'rgba(255, 159, 64, 1)'
			]
					, borderWidth: 1
		}]
			}
			, options: {
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero: true
						}
			}]
				}
			}
		});
		var ctxLine = document.getElementById("myLineChart").getContext('2d');
		var myLineChart = new Chart(ctxLine, {
			type: 'line'
			, data: {
				labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"]
				, datasets: [{
					label: '# of Votes'
					, data: [12, 19, 3, 5, 2, 3]
					, backgroundColor: [
				'rgba(255, 99, 132, 0.2)'
				, 'rgba(54, 162, 235, 0.2)'
				, 'rgba(255, 206, 86, 0.2)'
				, 'rgba(75, 192, 192, 0.2)'
				, 'rgba(153, 102, 255, 0.2)'
				, 'rgba(255, 159, 64, 0.2)'
			]
					, borderColor: [
				'rgba(255,99,132,1)'
				, 'rgba(54, 162, 235, 1)'
				, 'rgba(255, 206, 86, 1)'
				, 'rgba(75, 192, 192, 1)'
				, 'rgba(153, 102, 255, 1)'
				, 'rgba(255, 159, 64, 1)'
			]
					, borderWidth: 1
		}]
			}
			, options: {
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero: true
						}
			}]
				}
			}
		});
	</script>
	
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/moment.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/slick/slick.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/parallax100/parallax100.js"></script>
	<script type="text/javascript">
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/lightbox2/js/lightbox.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

</body>
</html>