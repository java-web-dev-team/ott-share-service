package handler.member;

import common.command.CommandHandler;
import dao.MemberDao;
import dao.MemberDaoImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberCheckHandler implements CommandHandler {
    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        if (request.getMethod().equalsIgnoreCase("GET")) {
            String id = request.getParameter("id");

            MemberDao memberDao = new MemberDaoImpl();
            int result = memberDao.confirmID("id");
            request.setAttribute("id", id);
            request.setAttribute("result", result);
            return "/member/idCheck.jsp";
        } else{
            response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
            return null;
        }
    }
}
