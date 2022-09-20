package handler.member;

import common.command.CommandHandler;
import dao.GroupDao;
import dao.MemberDao;
import dao.MemberDaoImpl;
import dto.GroupDto;
import dto.MemberDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Objects;

public class MyPageHandler implements CommandHandler {


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

    private String processForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String url = "/member/mypage.jsp";

        HttpSession session = request.getSession();
        GroupDao groupDao = GroupDao.getInstance();
        List<GroupDto> myGroup = groupDao.selectGroupsByMemberId((String)session.getAttribute("name"));
        request.setAttribute("myGroup", myGroup);


        // 내가 만든 그룹
        return url;
    }
}


