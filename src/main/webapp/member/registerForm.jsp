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
					<button type="button" id="duplicateCheck" name="duplicateCheck" value="중복확인" style="margin-bottom: 15px">중복확인</button>
					<input type="text" name="nickname" placeholder="닉네임" required >
					<input type="password" id="pwd" name="pwd" placeholder="비밀번호" onchange="check_pw()" required>
					<input type="password" id="pwd_check" name="pwd_check" placeholder="비밀번호 확인" onchange="check_pw()" required>
					<input type="number" name="phone" placeholder="휴대폰번호">
					<button type = "submit" onclick = "accept_login()">회원가입</button>
					<p class="message">
						즐거운 공유공간 '피자'
					</p>
				</form>
			</div>
		</div>
	</div>
</section>

<script>
	function accept_login(){
		if (document.getElementById('pwd').value == document.getElementById('pwd_check').value) {
			return true;
		} else{
			alert("비밀번호를 다시 확인해주세요.");
			document.getElementById('pwd_check').focus();
			return false;
		}
	}
</script>

<script>
	function check_pw(){

		if(document.getElementById('pwd').value == document.getElementById('pwd_check').value){
			document.getElementById('pwd').style.color = 'green';
			document.getElementById('pwd_check').style.color = 'green';
		} else{
			document.getElementById('pwd').style.color = 'green';
			document.getElementById('pwd_check').style.color = 'red';
			alert("비밀번호")
		}

	}
</script>

<script>
	$("#duplicateCheck").on("click", function (e) {
		const id = ${"#id"}.val();
		const query = {id : id};
		$.ajax({
			type: "POST",
			url : "/member/duplicateCheck.do",
			data: query,
			success : function(data){
				// 1(존재하는 id) , -1(존재하지않는 id)
				if(data == 1){
					alert("이미 존재하는 아이디입니다.");
					return false;
				} else{
					alert("사용 가능한 아이디입니다.");
					return true;
				}
			},
			error : function (XMLHttpRequest, textStatus, errorThrown){
				alert("통신 실패")
			}
		})
	});
</script>


</body>
</html>