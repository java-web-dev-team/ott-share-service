package handler.article;

import common.command.CommandHandler;
import dao.ArticleDao;
import dao.MemberDao;
import dao.MemberDaoImpl;
import dto.ArticleDto;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class ArticleDetailHandler implements CommandHandler {
    ArticleDao articleDao = ArticleDao.getInstance();
    MemberDao memberDao = new MemberDaoImpl();

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        if(request.getMethod().equalsIgnoreCase("GET")) {
            return processForm(request, response);
        } else {
            response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
            return null;
        }
    }

    private String processForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String url = "/article/article-detail.jsp";
        HttpSession session = request.getSession();

        ArticleDto article = articleDao.findByTitle(request.getParameter("title"));
        session.setAttribute("article", article);
        request.setAttribute("article", article);

        request.setAttribute("nickname", memberDao.findNickName(article.getCreatedBy()));
        return url;
    }
}
