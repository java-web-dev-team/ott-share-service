package handler.member;

import common.command.CommandHandler;
import dao.MemberDao;
import dao.MemberDaoImpl;
import dto.MemberDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class MemberRegisterHandler implements CommandHandler {


    @Override
    public String process(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        if(request.getMethod().equalsIgnoreCase("GET")) {
            return "/member/registerForm.jsp";
        }
        else if(request.getMethod().equalsIgnoreCase("POST")) {
            return processSubmit(request, response);
        }
        else {
            response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
            return null;
        }
    }

    private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try{
            request.setCharacterEncoding("UTF-8");
        } catch(Exception e){
            e.printStackTrace();
        }


        String id = request.getParameter("id");
        String password = request.getParameter("pwd");
        String nickname = request.getParameter("nickname");
        String phone = request.getParameter("phone");

        MemberDto memberDto = new MemberDto();
        MemberDao memberDao = new MemberDaoImpl();
        memberDto.setMemberId(id);
        memberDto.setPassword(password);
        memberDto.setNickname(nickname);
        memberDto.setPhone(phone);

        memberDao.insertMember(memberDto);
        HttpSession session = request.getSession();
        session.setAttribute("member", memberDto);
        return "/member/loginForm.jsp";

    }



}
