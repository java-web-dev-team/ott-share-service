<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천메인</title>
<script type="text/javascript" src="js/member.js"></script>

	<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
<style>
.card {
	margin: 40px;
}
</style>
</head>
<body>

<header style="height: 150px">
	<%@ include file="/common/header.jsp"%>
</header>

<a href="/article/list.do">추천글 목록</a>

	<div class="screen">
		<div class="row"
			style="margin-right: 3%; margin-top: 10%; margin-left: 7%;">
			<div class="card-box">
				<div class="card"
					style="width: 18rem; text-align: center; display: inline-block;">
					<img src="../img/board/수리남.jpg"
						style="width: 200px; border-radius: 10px; margin-left: 5px">
					<div class="card-body">
						<h5 class="card-title">넷플릭스 - 수리남</h5>
						<p style="font-size: 12px">남미 국가 수리남을 장악한 무소불위의 마약 대부로 인해 누명을
							쓴 한 민간인이 국정원의 비밀 임무를 수락하며 벌어지는 이야기를 그린 넷플릭스 시리즈</p>
						<button type="button" value="netflix"
							style="border-radius: 10px; background: white;">추천글 보기</button>
					</div>
				</div>
				<div class="card"
					style="width: 18rem; text-align: center; display: inline-block;">
					<img src="../img/board/유미.jpeg"
						style="width: 200px; height: 296px; border-radius: 10px;">
					<div class="card-body">
						<h5 class="card-title">티빙 - 유미의 세포들</h5>
						<p style="font-size: 12px">세포들과 함께 먹고 사랑하고 성장하는 평범한 유미(김고은 분)의
							이야기를 그린 세포 자극 공감 로맨스 티빙 단독 공개</p>
						<button type="button" value="tving"
							style="border-radius: 10px; background: white;">추천글 보기</button>
					</div>
				</div>
				<div class="card"
					style="width: 18rem; text-align: center; display: inline-block;">
					<img src="../img/board/토이.jpg"
						style="width: 200px; height: 296px; border-radius: 10px;">
					<div class="card-body">
						<h5 class="card-title">디즈니플러스 - 토이스토리4</h5>
						<p style="font-size: 12px">장난감의 운명을 거부하고 떠난 새 친구 ‘포키’를 찾기 위해 길
							위에 나선 ‘우디’는 우연히 오랜 친구 ‘보핍’을 만나고 그녀를 통해 새로운 세상에 눈을 뜨게 된다.</p>
						<button type="button" value="disney"
							style="border-radius: 10px; background: white;">추천글 보기</button>
					</div>
				</div>



			</div>
		</div>
		<div class="row"
			style="margin-right: 3%; margin-top: 5%; margin-left: 7%;">
			<div class="card-box">
				<div class="card"
					style="width: 18rem; text-align: center; display: inline-block;">
					<img src="../img/board/인사이드.jpg"
						style="width: 200px; height: 296px; border-radius: 10px;">
					<div class="card-body">
						<h5 class="card-title">왓챠 - 인사이드리릭스</h5>
						<p style="font-size: 12px">김이나 작사가와 함께 가사로 바라본 뮤지션 내면의 이야기. 다섯
							명의 뮤지션들이 직접 쓴 가사에 담겨진 비하인드에 대해 이야기를 나눈다.</p>
						<button type="button" value="watcha"
							style="border-radius: 10px; background: white;">추천글 보기</button>
					</div>
				</div>
				<div class="card"
					style="width: 18rem; text-align: center; display: inline-block;">
					<img src="../img/board/연애의참견.jpg"
						style="width: 200px; height: 296px; border-radius: 10px;">
					<div class="card-body">
						<h5 class="card-title">웨이브 - 연애의참견</h5>
						<p style="font-size: 12px">현실감 제로! 드라마보다 더 드라마 같은 '지긋지긋'한 연애
							스토리! 누구보다 독하게, 단호하게 당신의 연애를 진단해 줄 본격 로맨스 파괴 토크쇼 프로그램</p>
						<button type="button" value="wavve"
							style="border-radius: 10px; background: white;">추천글 보기</button>
					</div>
				</div>
				<div class="card"
					style="width: 18rem; text-align: center; display: inline-block;">
					<img src="../img/board/마인크래프트.png"
						style="width: 200px; border-radius: 10px;">
					<div class="card-body">
						<h5 class="card-title">유튜브프리미엄 - 마인크래프트</h5>
						<p style="font-size: 12px">쉘터를 만든 개발사의 말을 믿을 것이냐 아니면 운석 충돌을
							예견한 연구원의 말을 믿을 것이냐.. 야영 중 나타난 좀비 !!</p>
						<a href="www.youtube.com"><button type="button"
								value="youtube" style="border-radius: 10px; background: white;">바로가기</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>