package handler.member;

import common.command.CommandHandler;
import dao.MemberDao;
import dao.MemberDaoImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class duplicateCheckNicknameHandler implements CommandHandler {
    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

        if (request.getMethod().equalsIgnoreCase("POST")) {
            return processSubmit(request, response);
        } else{
            response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
            return null;
        }
    }

    private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // url 반환 (jsp)
        MemberDao memberDao = new MemberDaoImpl();
        String nickname1 = request.getParameter("nickname");
        int nickname = memberDao.confirmNickname(nickname1);
        request.setAttribute("nickname", nickname);
        return "/member/duplicateCheckNickname.jsp";
    }

}
