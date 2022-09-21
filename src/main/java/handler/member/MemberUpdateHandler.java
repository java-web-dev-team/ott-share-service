package handler.member;

import common.command.CommandHandler;
import dao.MemberDao;
import dao.MemberDaoImpl;
import dto.MemberDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		if(request.getMethod().equalsIgnoreCase("GET")) {
			return processForm(request, response);
		}
		else if(request.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(request, response);
		}
		else {
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private String processForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userid = request.getParameter("userid");
		MemberDao memberDao = new MemberDaoImpl();
		MemberDto memberDto = memberDao.getMember(userid);
		request.setAttribute("member", memberDto);
		return "memberUpdateForm.jsp";
	}

	private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "/member/mypage.jsp";
//		request.setCharacterEncoding("UTF-8"); // 한글 깨짐을 방지
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("member");
		MemberDao memberDao = new MemberDaoImpl();

		// 폼에서 입력한 회원 정보 얻어오기
		String userid = memberDto.getMemberId();		// 닉네임은 변경 x
		String pwd, nickname, phone;

		// 파라미터값이 null 이면 기존값 사용
		if(request.getParameter("password") == null || request.getParameter("password").equals("")){
			String id = memberDto.getMemberId();
			pwd = memberDao.getMember(id).getPassword();
		} else{
			pwd = request.getParameter("password");
		}
		if(request.getParameter("nickname") == null || request.getParameter("nickname").equals("")){
			String id = memberDto.getMemberId();
			nickname = memberDao.getMember(id).getNickname();
		}
		else{
			nickname = request.getParameter("nickname");
		}
		if(request.getParameter("phone") == null || request.getParameter("phone").equals("")){
			String id = memberDto.getMemberId();
			phone = memberDao.getMember(id).getPhone();
		} else{
			phone = request.getParameter("phone");
		}

		// 회원 정보를 저장할 객체 생성
		MemberDto memberDtoSubmit = new MemberDto();
		memberDtoSubmit.setMemberId(userid);
		memberDtoSubmit.setPassword(pwd);
		memberDtoSubmit.setNickname(nickname);
		memberDtoSubmit.setPhone(phone);

		memberDao.updateMember(memberDtoSubmit);
		session.setAttribute("member", memberDtoSubmit);
		response.sendRedirect("/member/mypage.do");
		return null;
	}


}