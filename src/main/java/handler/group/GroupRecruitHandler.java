package handler.group;

import common.command.CommandHandler;
import dao.GroupDao;
import dto.GroupDto;
import dto.MemberDto;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;

public class GroupRecruitHandler implements CommandHandler {

    GroupDao groupDao = GroupDao.getInstance();

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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

    private String processSubmit(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

        String ottId = request.getParameter("ottId");
        String groupName = request.getParameter("groupName");
        String content = request.getParameter("content");
        String period = request.getParameter("period");
        GroupDto group = new GroupDto(
                Integer.parseInt(ottId),
                groupName,
                content,
                Integer.parseInt(period)
        );
        groupDao.insertGroup(group);
        Object member = session.getAttribute("member");
        groupDao.joinGroup((MemberDto) member, group);
        request.setAttribute("group", group);
        session.setAttribute("group", group);
        return "/group/group-detail.jsp";
    }

    private String processForm(HttpServletRequest request, HttpServletResponse response) {
        return "/group/group-recruit.jsp";
    }

}
