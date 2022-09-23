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

public class GroupJoinHandler implements CommandHandler {
    GroupDao groupDao = GroupDao.getInstance();

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        if(request.getMethod().equalsIgnoreCase("POST")) {
            return processSubmit(request, response);
        } else {
            response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
            return null;
        }
    }

    private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        HttpSession session = request.getSession();
        GroupDto group = (GroupDto) session.getAttribute("group");
        groupDao.joinGroup((MemberDto) session.getAttribute("member"), group);

        List<String> nicknames = groupDao.selectNicknamesByGroupName(group.getGroupName());
        request.setAttribute("nicknames", nicknames);
        response.sendRedirect("/group/detail.do?groupName=" + group.getGroupName());
        return null;
    }
}
