package handler.group;

import common.command.CommandHandler;
import dao.GroupDao;
import dto.GroupDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDate;

public class GroupRecruitHandler implements CommandHandler {

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

//    public GroupDto(Integer ottId, String groupName, String content, Integer period) {
//        this.ottId = ottId;
//        this.groupName = groupName;
//        this.createdDate = LocalDate.now().toString();
//        this.content = content;
//        this.period = period;
//        this.memberCount = 1;
//    }

    private String processForm(HttpServletRequest request, HttpServletResponse response) {
        String url = "/group/groupRecruit.jsp";

        String ottId = request.getParameter("ottId");
        String groupName = request.getParameter("groupName");
        String content = request.getParameter("content");
        String period = request.getParameter("period");
        request.setAttribute("groups", groupDao.insertGroup(new GroupDto(
                Integer.parseInt(ottId),
                groupName,
                content,
                Integer.parseInt(period)
        )));
        return url;
    }
}
