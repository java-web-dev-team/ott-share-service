package handler.group;

import common.command.CommandHandler;
import dao.GroupDao;
import dto.GroupDto;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class GroupDeleteHandler implements CommandHandler {
    GroupDao groupDao = GroupDao.getInstance();

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getMethod().equalsIgnoreCase("POST")) {
            return processSubmit(request, response);
        } else {
            response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
            return null;
        }
    }

    private String processSubmit(HttpServletRequest request, HttpServletResponse response) {
        String url = "/group/group-list.jsp";
        HttpSession session = request.getSession();
        GroupDto sessionGroup = (GroupDto) session.getAttribute("group");
        String groupName = sessionGroup.getGroupName();

        groupDao.deleteGroup(groupName);
        return url;
    }
}
