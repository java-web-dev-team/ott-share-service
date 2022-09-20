function idCheck() {
    if(document.frm.userid.value == "") {
        alert("아이디를 입력하여 주십시요.");
        document.frm.userid.focus();	// 포커스를 아이디 입력 태그로 이동
        return;
    }
    // 정규표현식을 사용해서 아이디에 대한 유효성 검사를 할 수 있음.
    // 아이디 중복체크를 수행하는 새로운 팝업창을 띄웠다.
    // 현재 경로가 '/'(현재 url은 /join.do)이므로, url="idCheck.do" 을 사용 가능
    var url = "idCheck.do?userid=" + document.frm.member_id.value;
    window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
    // 다른 방법 : Ajax를 사용해서 서버와 통신해서 아이디 중복체크를 할 수 있음
    // 별도로 윈도우 팝업창을 띄우지 않음
}

function idok(userid) {
    // opener: joinForm.jsp, document: idCheck.jsp
    // 아이디 중복체크한 값으로 userid를 반영
    opener.frm.userid.value = document.frm.member_id.value;
    // 중복확인이 성공되었다는 것을 표시
    opener.frm.reid.value = document.frm.member_id.value;
    self.close();	// 팝업창을 닫는다.
}

function joinCheck() {
    if (document.frm.name.value.length == 0) {
        alert("이름을 써주세요.");
        frm.name.focus();
        return false;
    }
    if (document.frm.member_id.value.length == 0) {
        alert("아이디를 써주세요");
        frm.member_id.focus();
        return false;
    }
    if (document.frm.member_id.value.length < 4) {
        alert("아이디는 4글자이상이어야 합니다.");
        frm.member_id.focus();
        return false;
    }
    if (document.frm.pwd.value == "") {
        alert("암호는 반드시 입력해야 합니다.");
        frm.pwd.focus();
        return false;
    }
    if (document.frm.pwd.value != document.frm.pwd_check.value) {
        alert("암호가 일치하지 않습니다.");
        frm.pwd.focus();
        return false;
    }
    if (document.frm.reid.value.length == 0) {
        alert("중복 체크를 하지 않았습니다.");
        frm.member_id.focus();
        return false;
    }
    return true;
    /* 고려해야 할 사항
    브라우저에서 서버로 전송하는 데이터로 지금은 pwd과 pwd_check를 전송하고 있음
    그런데 원래 전송되어야 하는 것은 pwd 하나만 필요함.
    자바스크립트에서 걸러줄 필요가 있음.
    보통 pwd와 pwd_check가 같으면 pwd_check <input> 태그를 삭제한다.
    자바스크립트에서 form의 remove() 메소드를 사용한다.
    브라우저에서 서버로 전송하는 데이터는 회원정보가 되어야 함.(비밀번호 2개는 중복되어 하나는 삭제)
    */
}

/* 여기서는 정규표현식을 사용하지 않았음
	지난 평가에서 정답으로 준것을 참고해서 유효성 검사를 할 줄 알아야 할 것 같습니다.
*/
// function loginCheck() {
//     if (document.frm.member_id.value.length == 0) {
//         alert("아이디를 써주세요");
//         frm.member_id.focus();
//         return false;
//     }
//     if (document.frm.pwd.value == "") {
//         alert("암호는 반드시 입력해야 합니다.");
//         frm.pwd.focus();
//         return false;
//     }
//     return true;
// }