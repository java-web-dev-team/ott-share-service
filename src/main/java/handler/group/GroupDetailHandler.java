package handler.group;

import common.command.CommandHandler;
import dao.GroupDao;
import dto.GroupDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;

public class GroupDetailHandler implements CommandHandler {
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

    private String processForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String url = "/group/group-detail.jsp";
        String groupName = request.getParameter("groupName");
        GroupDto group = groupDao.selectGroupByGroupName(groupName);
        request.setAttribute("group", group);

        List<String> nicknames = groupDao.selectNicknamesByGroupName(groupName);
        request.setAttribute("nicknames", nicknames);
        return url;
    }
}
