package handler.member;

import common.command.CommandHandler;
import dao.MemberDao;
import dao.MemberDaoImpl;
import dto.MemberDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLIntegrityConstraintViolationException;

public class MemberRegisterHandler implements CommandHandler {


    @Override
    public String process(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
            if(request.getMethod().equalsIgnoreCase("GET")) {
                return "registerForm.jsp";
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

        String url = "loginForm.jsp";
        try{
            request.setCharacterEncoding("UTF-8");
        } catch(UnsupportedEncodingException e){
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

        HttpSession session = request.getSession();
        if ((memberDao.confirmID(id)==-1) && (memberDao.confirmNickname(nickname) == -1)) {
            memberDao.insertMember(memberDto);
            session.setAttribute("userid", memberDto.getMemberId());
            session.setAttribute("msg", "회원가입에 성공하셨습니다. ");
        } else {
            url = "registerForm.jsp";
            session.setAttribute("msg", "회원가입에 실패하셨습니다. 중복체크를 다시 진행해주세요");
        }

        return url;

    }



}
