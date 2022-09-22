package handler.article;

import common.command.CommandHandler;
import dao.ArticleDao;
import dao.MemberDao;
import dao.MemberDaoImpl;
import dto.ArticleDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class ArticleListHandler implements CommandHandler {
    ArticleDao articleDao = ArticleDao.getInstance();
    MemberDao memberDao = new MemberDaoImpl();

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
        String url = "/article/article-list.jsp";

        List<String> nicknames = new ArrayList<>();
        List<ArticleDto> articles = articleDao.findAll();
        for (ArticleDto article : articles) {
            nicknames.add(memberDao.findNickName(article.getCreatedBy()));
        }

        request.setAttribute("articles", articles);
        request.setAttribute("nicknames", nicknames);
        return url;
    }
}
