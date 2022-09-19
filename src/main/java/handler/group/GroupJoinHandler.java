package handler.group;

import common.command.CommandHandler;
import dao.GroupDao;
import dto.GroupDto;
import dto.MemberDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GroupJoinHandler implements CommandHandler {

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
        String url = "/group/groupJoin.jsp";
        HttpSession session = request.getSession();
        GroupDto sessionGroup = (GroupDto) session.getAttribute("group");
        MemberDto sessionMember = (MemberDto) session.getAttribute("member");

        GroupDto group = groupDao.joinGroup(sessionMember, sessionGroup);

        request.setAttribute("group", group);
        return url;
    }
}
