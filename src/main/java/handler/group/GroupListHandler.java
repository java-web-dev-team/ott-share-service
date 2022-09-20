package handler.group;

import common.command.CommandHandler;
import dao.GroupDao;
import dto.GroupDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class GroupListHandler implements CommandHandler {

    GroupDao groupDao = GroupDao.getInstance();

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        if(request.getMethod().equalsIgnoreCase("GET")) {
            return processForm(request, response);
        }
        else {
            response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
            return null;
        }
    }

    private String processForm(HttpServletRequest request, HttpServletResponse response) {
        String url = "/group/group-list.jsp";
//        String searchKeyword = request.getParameter("searchKeyword");
//        groups.selectGroupsByGroupName(searchKeyword);
        List<GroupDto> groups = groupDao.selectAllGroups();
        request.setAttribute("groups", groups);
        return url;
    }
}
