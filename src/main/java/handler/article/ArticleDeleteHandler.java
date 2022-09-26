package handler.article;

import common.command.CommandHandler;
import dao.ArticleDao;
import dto.ArticleDto;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ArticleDeleteHandler implements CommandHandler {

    ArticleDao articleDao = ArticleDao.getInstance();

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

    private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        ArticleDto article = (ArticleDto) session.getAttribute("article");

        articleDao.deleteArticle(article.getTitle());
        response.sendRedirect("/article/list.do");
        return null;
    }
}
