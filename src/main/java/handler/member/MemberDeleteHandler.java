package handler.member;

import common.command.CommandHandler;
import dao.MemberDao;
import dao.MemberDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class MemberDeleteHandler implements CommandHandler {

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        if(request.getMethod().equalsIgnoreCase("GET")) {
            return processForm(request, response);
        }
        else if(request.getMethod().equalsIgnoreCase("POST")) {
            return processForm(request, response);
        }
        else {
            response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
            return null;
        }
    }

    public String processForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
        MemberDao memberDao = new MemberDaoImpl();
        HttpSession session = request.getSession();
        memberDao.deleteMember((String)session.getAttribute("name"));
        session.invalidate();
        response.sendRedirect("/index.do");
        return null;

    }
}
