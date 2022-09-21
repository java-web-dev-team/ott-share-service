package dao;

import dto.ArticleDto;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static util.DBManager.getConnection;

@NoArgsConstructor(access = AccessLevel.PUBLIC)
public class ArticleDao {
    private static ArticleDao instance = null;

    public static ArticleDao getInstance() {
        if (instance == null) {
            instance = new ArticleDao();
        }
        return instance;
    }

    public ArticleDto save(ArticleDto articleDto) {
        String saveSql = "insert into 'article' values (?, ?, ?, ?, ?, ?)";
        String selectSql = "select * from article where title = ?";
        Connection conn = getConnection();
        try {
            assert conn != null;
            PreparedStatement savePs = conn.prepareStatement(saveSql);
            savePs.setInt(1, articleDto.getId());
            savePs.setInt(2, articleDto.getOttId());
            savePs.setString(3, articleDto.getTitle());
            savePs.setString(4, articleDto.getContent());
            savePs.setString(5, articleDto.getCreatedBy());
            savePs.setString(6, articleDto.getCreatedDate());
            savePs.executeUpdate();

            PreparedStatement selectPs = conn.prepareStatement(selectSql);
            selectPs.setString(1, articleDto.getTitle());
            ResultSet resultSet = selectPs.executeQuery();

            ArticleDto savedArticle = new ArticleDto();
            while (resultSet.next()) {
                savedArticle.setTitle(resultSet.getString("title"));
                savedArticle.setContent(resultSet.getString("content"));
                savedArticle.setCreatedBy(resultSet.getString("member_id"));
                savedArticle.setCreatedDate(resultSet.getString("created_date"));
                savedArticle.setOttId(resultSet.getInt("ott_id"));
            }
            return savedArticle;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public List<ArticleDto> findAll() {
        List<ArticleDto> findAll = new ArrayList<>();

        String findSql = "select * from article";
        Connection conn = getConnection();
        try {
            assert conn != null;
            PreparedStatement findPs = conn.prepareStatement(findSql);
            ResultSet resultSet = findPs.executeQuery();
            while (resultSet.next()) {
                ArticleDto article = new ArticleDto();
                article.setTitle(resultSet.getString("title"));
                article.setContent(resultSet.getString("content"));
                article.setCreatedBy(resultSet.getString("member_id"));
                article.setOttId(resultSet.getInt("ott_id"));
                article.setCreatedDate(resultSet.getString("created_date"));
                findAll.add(article);
            }

            return findAll;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<ArticleDto> findByMemberId(String memberId) {
        List<ArticleDto> findByMemberId = new ArrayList<>();

        String findSql = "select * from article where member_id = ?";
        Connection conn = getConnection();
        try {
            assert conn != null;
            PreparedStatement findPs = conn.prepareStatement(findSql);
            findPs.setString(1, memberId);
            ResultSet resultSet = findPs.executeQuery();
            while (resultSet.next()) {
                ArticleDto article = new ArticleDto();
                article.setTitle(resultSet.getString("title"));
                article.setContent(resultSet.getString("content"));
                article.setCreatedBy(resultSet.getString("member_id"));
                article.setOttId(resultSet.getInt("ott_id"));
                article.setCreatedDate(resultSet.getString("created_date"));
                findByMemberId.add(article);
            }

            return findByMemberId;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
