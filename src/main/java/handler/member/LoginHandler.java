package handler.member;

import common.command.CommandHandler;
import dao.MemberDao;
import dao.MemberDaoImpl;
import dto.MemberDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginHandler implements CommandHandler {

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

        if (request.getMethod().equalsIgnoreCase("GET")) {
            return processForm(request, response);
        } else if (request.getMethod().equalsIgnoreCase("POST")) {
            return processSubmit(request, response);
        } else{
            response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
            return null;
        }
    }

    private String processForm(HttpServletRequest request, HttpServletResponse response){
        String url = "/member/loginForm.jsp";
        HttpSession session = request.getSession();
        if (session.getAttribute("member") != null) {
            return "/member/main.jsp";
        }

        return url;
    }

    private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String url = "/member/loginForm.jsp";
        String userid = request.getParameter("memberId");
        String pwd = request.getParameter("password");
        MemberDao memberDao = new MemberDaoImpl();
        int result = memberDao.userCheck(userid, pwd);
        if( result == 1){
            MemberDto memberDto = memberDao.getMember(userid);
            HttpSession session = request.getSession();
            session.setAttribute("member", memberDto);
            request.setAttribute("msg", "로그인 성공");
            return processForm(request, response);
        } else if(result== 0){
            request.setAttribute("msg", "비밀번호 틀림");
        } else{
            request.setAttribute("msg", "존재하지 않는 회원");
        }

        return url;

    }

}
