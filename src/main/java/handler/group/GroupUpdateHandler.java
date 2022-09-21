package handler.group;

import common.command.CommandHandler;
import dao.GroupDao;
import dto.GroupDto;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class GroupUpdateHandler implements CommandHandler {
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
        String url = "/group/group-update.jsp";
        HttpSession session = request.getSession();

        GroupDto sessionGroup = (GroupDto) session.getAttribute("group");

        GroupDto updatedGroup = new GroupDto(
                request.getParameter("ottId") != null ?
                        Integer.parseInt(request.getParameter("ottId")) :
                        sessionGroup.getOttId(),
                request.getParameter("groupName") != null ?
                        request.getParameter("groupName") :
                        sessionGroup.getGroupName(),
                request.getParameter("content") != null ?
                        request.getParameter("content") :
                        sessionGroup.getContent(),
                request.getParameter("period") != null ?
                        Integer.parseInt(request.getParameter("period")) :
                        sessionGroup.getPeriod()
        );

        GroupDto resultGroup = groupDao.updateGroup(sessionGroup, updatedGroup);
        request.setAttribute("group", resultGroup);
        session.setAttribute("group", resultGroup);
        return url;
    }

    private String processForm(HttpServletRequest request, HttpServletResponse response) {
        return "/group/group-update.jsp";
    }
}
