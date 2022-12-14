<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입 폼</title>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/join.css" rel="stylesheet">

</head>
<body>

<header style="height: 150px">
	<%@ include file="/common/header.jsp" %>
</header>

<section>

	<div class="screen">

		<div class="register-page">

			<div class="form">

				<div id=“msg”>
					<c:if test="${not empty msg}">
						<i class="fa fa-exclamation-circle"> ${URLDecoder.decode(msg)}</i>
					</c:if>
				<br>
				</div>

				<form class="register-form" method="post" name="frm" action="register.do">
					<p style="margin-top: -15px">회원가입</p>
					<input type="text" id="id" name="id" placeholder="아이디" required/>
					<button type="button" id="duplicateCheck" name="duplicateCheck" value="중복확인" style="margin-bottom: 15px">중복확인</button>
					<input type="text" id="nickname"name="nickname" placeholder="닉네임" required >
					<button type="button" id="duplicateCheckNickname" name="duplicateCheckNickname" value="중복확인" style="margin-bottom: 15px">중복확인</button>
					<input type="password" id="pwd" name="pwd" placeholder="비밀번호" onchange="check_pw()" required>
					<input type="password" id="pwd_check" name="pwd_check" placeholder="비밀번호 확인" onchange="check_pw_re()" required>
					<input type="number" name="phone" placeholder="휴대폰번호">
					<button type = "submit" onclick = "return accept_login()">회원가입</button>
					<p class="message">
						즐거운 공유공간 '피자'
					</p>
				</form>
			</div>
		</div>
	</div>
</section>

<script>

	// 색변환
	function check_pw(){

		if(document.getElementById('pwd').value > 0){
			document.getElementById('pwd').style.color = 'green';
		}
	}

	// 색변환
	function check_pw_re(){
		if(document.getElementById('pwd').value == document.getElementById('pwd_check').value){
			document.getElementById('pwd_check').style.color = 'green';
		} else{
			document.getElementById('pwd_check').style.color = 'red';
		}
	}

	$("#duplicateCheck").on("click", function (e) {
		const id = $("#id").val();
		const query = {id: id};
		$.ajax({
			type: "POST",
			url: "/member/duplicateCheck.do",
			async: false,
			data: query,
			success: function (data) {
				// 1(존재하는 id) , -1(존재하지않는 id)
				if (data == -1) {
					alert("사용 가능한 닉네임입니다.");
					passId = true;

				} else {
					alert("이미 존재하는 닉네임입니다.");
					passId = false;
				}
			},
		})

		return passId;
	});

	$("#duplicateCheckNickname").on("click", function (e) {
		const nickname = $("#nickname").val();
		const query = {nickname: nickname};
		$.ajax({
			type: "POST",
			url: "/member/duplicateCheckNickname.do",
			async: false,
			data: query,
			success: function (data) {
				// 1(존재하는 id) , -1(존재하지않는 id)
				if (data == -1) {
					alert("사용 가능한 닉네임입니다.");
					passNickname = true;

				} else {
					alert("이미 존재하는 닉네임입니다.");
					passNickname = false;
				}
			},
		})
		return passNickname;
	});

function accept_login() {
		passId == false;
		passNickname == false;




		// 아이디 입력체크
		if (document.getElementById('id').value.length == 0) {
			alert("아이디를 입력해주세요");
			return false;
		}

		if (passId == true) {
			return true;
		}


		if (passNickname == true) {
			return true;
		}

		if(passId == false){
			alert("아이디 중복확인을 해주세요.")
			return false;
		}

		if (passNickname == false) {
			alert("닉네임 중복확인을 해주세요.");
			return false;
		}

		// 비밀번호 입력체크
		if (document.getElementById('pwd').value.length == 0) {
			alert("비밀번호를 입력해주세요");
			return false;
		}
		// 비밀번호 확인 입력체크
		if (document.getElementById('pwd_check').value.length == 0) {
			alert("비밀번호 확인을 입력해주세요");
			return false;
		}

		if (document.getElementById('pwd').value != document.getElementById('pwd_check').value) {
			alert("비밀번호를 다시 확인해주세요.");
			document.getElementById('pwd_check').focus();
			return false;
		}
		// 닉네임 입력체크
		if (document.getElementById('nickname').value.length == 0) {
			alert("닉네임을 입력해주세요");
			return false;
		}


		alert("축하합니다. 회원가입이 완료되었습니다.")
		return true;
	}
</script>
</body>
</html>