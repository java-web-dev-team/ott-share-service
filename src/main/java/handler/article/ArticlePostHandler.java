package handler.article;

import common.command.CommandHandler;
import dao.ArticleDao;
import dao.MemberDao;
import dao.MemberDaoImpl;
import dto.ArticleDto;
import dto.MemberDto;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ArticlePostHandler implements CommandHandler {


    ArticleDao articleDao = ArticleDao.getInstance();
    MemberDao memberDao = new MemberDaoImpl();

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
        MemberDto member = (MemberDto) session.getAttribute("member");

        String ottId = request.getParameter("ottId");
        String title = request.getParameter("title");
        String content = request.getParameter("content");


        ArticleDto article = new ArticleDto(
                title,
                content,
                Integer.parseInt(ottId),
                member.getMemberId()
        );
        articleDao.save(article);
        request.setAttribute("article", article);
        session.setAttribute("article", article);
        return "/article/detail?title=" + article.getTitle();
    }

    private String processForm(HttpServletRequest request, HttpServletResponse response) {
        return "/article/article-post.jsp";
    }
}
