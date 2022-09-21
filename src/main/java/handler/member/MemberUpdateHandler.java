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
		request.setAttribute("memberDto", memberDto);
		return "memberUpdateForm.jsp";
	}

	private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "/member/mypage.do";
		request.setCharacterEncoding("UTF-8"); // 한글 깨짐을 방지
		HttpSession session = request.getSession();
		// 폼에서 입력한 회원 정보 얻어오기
		String userid = (String) session.getAttribute("name");		// 닉네임은 변경 x
		String pwd = request.getParameter("password") != null ? request.getParameter("password") : (String) session.getAttribute("password");
		String nickname = request.getParameter("nickname") != null ? request.getParameter("nickname") : (String) session.getAttribute("nickname");
		String phone = request.getParameter("phone") != null ? request.getParameter("phone") : (String) session.getAttribute("phone");

		// 회원 정보를 저장할 객체 생성
		MemberDto memberDto = new MemberDto();
		memberDto.setMemberId(userid);
		memberDto.setPassword(pwd);
		memberDto.setNickname(nickname);
		memberDto.setPhone(phone);
		MemberDao memberDao = new MemberDaoImpl();
		memberDao.updateMember(memberDto);
		response.sendRedirect("../mypage.do");

		// 멤버 인포도 변경되야함.

		return url;
	}
}