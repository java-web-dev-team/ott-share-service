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
import java.sql.SQLException;
import java.util.List;

public class GroupDetailHandler implements CommandHandler {
    GroupDao groupDao = GroupDao.getInstance();

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
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

    private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        HttpSession session = request.getSession();
        Object member = session.getAttribute("member");
        GroupDto group = (GroupDto) session.getAttribute("group");
        groupDao.joinGroup((MemberDto) session.getAttribute("member"), group);

        List<String> nicknames = groupDao.selectNicknamesByGroupName(((GroupDto) session.getAttribute("group")).getGroupName());
        request.setAttribute("nicknames", nicknames);
        return "/group/group-detail.jsp";
    }

    private String processForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String url = "/group/group-detail.jsp";
        HttpSession session = request.getSession();

        String groupName = request.getParameter("groupName");
        GroupDto group = groupDao.selectGroupByGroupName(groupName);
        session.setAttribute("group", group);
        request.setAttribute("group", group);

        List<String> nicknames = groupDao.selectNicknamesByGroupName(groupName);
        request.setAttribute("nicknames", nicknames);
        return url;
    }


}
