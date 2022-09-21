package handler.member;

import common.command.CommandHandler;
import dao.MemberDao;
import dao.MemberDaoImpl;
import dto.MemberDto;

import javax.servlet.http.Cookie;
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
        String rememberId = request.getParameter("rememberId");
        String url = "/member/loginForm.jsp";
        String userid = request.getParameter("memberId");
        String pwd = request.getParameter("password");
        MemberDao memberDao = new MemberDaoImpl();
        MemberDto memberDto = memberDao.getMember(userid);
        HttpSession session = request.getSession();
        if (memberDao.getMember(userid) == null) {
            request.setAttribute("msg", "존재하지 않는 회원입니다.");
        }
        int result = memberDao.userCheck(userid, pwd);
        if( result == 1){
            session.setAttribute("member", memberDto);
            session.setAttribute("name", memberDto.getMemberId());
            session.setAttribute("password", memberDto.getPassword());
            session.setAttribute("nickname", memberDto.getNickname());
            session.setAttribute("phone", memberDto.getPhone());
            if(rememberId != null){
                Cookie cookie = new Cookie("userid", userid);
                response.addCookie(cookie);
            } else{
                Cookie cookie = new Cookie("userid", userid);
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
            return processForm(request, response);
        } else if(result == 0){
            request.setAttribute("msg", "비밀번호가 틀립니다. ");
        }

        return url;

    }

}
