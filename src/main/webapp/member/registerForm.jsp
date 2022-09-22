<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<script type="text/javascript" src="../js/member.js"></script>
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
					<form class="register-form" action="register.do" method="post" name="frm">
						<p style="margin-top: -15px">회원가입</p>
						<input type="text" id="id" name="id" placeholder="아이디" required/>
						<button type="submit" id="reId" name="reId" value="중복확인" style="margin-bottom: 15px" onclick="" >중복확인</button>
						<input type="text" name="nickname" placeholder="닉네임" required >
						<input type="password" id="pwd" name="pwd" placeholder="비밀번호" onchange="check_pw()" required>
						<input type="password" id="pwd_check" name="pwd_check" placeholder="비밀번호 확인" onchange="check_pw()" required>
						<input type="number" name="phone" placeholder="휴대폰번호">
						<button type="submit" onclick="return check_pw()">회원가입</button>

						<p class="message">
							즐거운 공유공간 '피자'
						</p>
					</form>
				</div>
			</div>
		</div>
	</section>

	<script>
		function check_pw(){

			if(document.getElementById('pwd').value == document.getElementById('pwd_check').value){
				document.getElementById('pwd').style.color = 'green';
				document.getElementById('pwd_check').style.color = 'green';
				return true;
			} else{
				document.getElementById('pwd').style.color = 'green';
				document.getElementById('pwd_check').style.color = 'red';
				alert("비밀번호")
				return false;
			}

		}
	</script>


</body>
</html>