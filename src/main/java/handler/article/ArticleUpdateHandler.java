package handler.article;

import common.command.CommandHandler;
import dao.ArticleDao;
import dao.GroupDao;
import dto.ArticleDto;
import dto.GroupDto;
import dto.MemberDto;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ArticleUpdateHandler implements CommandHandler {
    ArticleDao articleDao = ArticleDao.getInstance();

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
        ArticleDto sessionArticle = (ArticleDto) session.getAttribute("article");

        ArticleDto updatedArticle = new ArticleDto(
                request.getParameter("title") != null ?
                        request.getParameter("title") :
                        sessionArticle.getTitle(),
                request.getParameter("content") != null ?
                        request.getParameter("content") :
                        sessionArticle.getContent(),
                request.getParameter("ottId") != null ?
                Integer.parseInt(request.getParameter("ottId")) :
                sessionArticle.getOttId(),
                        sessionArticle.getCreatedBy()
        );

        ArticleDto resultArticle = articleDao.updateArticle(sessionArticle, updatedArticle);
        request.setAttribute("article", resultArticle);
        session.setAttribute("article", resultArticle);
        return "/article/article-detail.jsp";
    }

    private String processForm(HttpServletRequest request, HttpServletResponse response) {
        return "/article/article-update.jsp";
    }
}
