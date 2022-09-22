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
        String saveSql = "insert into article (ott_id, title, content, member_id, created_date) values (?, ?, ?, ?, ?)";
        String selectSql = "select * from article where title = ?";
        Connection conn = getConnection();
        try {
            assert conn != null;
            PreparedStatement savePs = conn.prepareStatement(saveSql);
            savePs.setInt(1, articleDto.getOttId());
            savePs.setString(2, articleDto.getTitle());
            savePs.setString(3, articleDto.getContent());
            savePs.setString(4, articleDto.getCreatedBy());
            savePs.setString(5, articleDto.getCreatedDate());
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

    public ArticleDto updateArticle(ArticleDto sessionArticle, ArticleDto updatedArticle) {
        ArticleDto resultArticle = new ArticleDto();

        String updateSql = "update article set ott_id = ?, title = ?, content = ? where title = ?";
        String selectSql = "select * from article where title = ?";
        Connection conn = getConnection();
        try {
            assert conn != null;
            PreparedStatement updatePs = conn.prepareStatement(updateSql);
            updatePs.setInt(1, updatedArticle.getOttId());
            updatePs.setString(2, updatedArticle.getTitle());
            updatePs.setString(3, updatedArticle.getContent());
            updatePs.setString(4, sessionArticle.getTitle());
            updatePs.executeUpdate();

            PreparedStatement selectPs = conn.prepareStatement(selectSql);
            selectPs.setString(1, updatedArticle.getTitle());
            ResultSet resultSet = selectPs.executeQuery();
            while (resultSet.next()) {
                resultArticle.setTitle(resultSet.getString("title"));
                resultArticle.setContent(resultSet.getString("content"));
                resultArticle.setOttId(resultSet.getInt("ott_id"));
                resultArticle.setCreatedBy(resultSet.getString("member_id"));
                resultArticle.setCreatedDate(resultSet.getString("created_date"));
            }
            return resultArticle;
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

    public void deleteArticle(String title) {

        String deleteSql = "delete from article where title = ?";
        Connection conn = getConnection();
        try {
            assert conn != null;
            PreparedStatement deletePs = conn.prepareStatement(deleteSql);
            deletePs.setString(1, title);
            deletePs.executeUpdate();
            } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArticleDto findByTitle(String title) {
        String findSql = "select * from article where title = ?";
        Connection conn = getConnection();
        try {
            assert conn != null;
            PreparedStatement findPs = conn.prepareStatement(findSql);
            findPs.setString(1, title);

            ResultSet resultSet = findPs.executeQuery();
            resultSet.next();
            return new ArticleDto(
                    resultSet.getString("title"),
                    resultSet.getString("content"),
                    resultSet.getInt("ott_id"),
                    resultSet.getString("member_id")
            );
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
