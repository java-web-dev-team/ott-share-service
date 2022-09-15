package dao;

import dto.GroupDto;
import dto.MemberDto;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import static util.DBManager.getConnection;

@NoArgsConstructor(access = AccessLevel.PUBLIC)
public class GroupDAO {
    private static GroupDAO instance = null;

    public static GroupDAO getInstance() {
        if (instance == null) {
            instance = new GroupDAO();
        }
        return instance;
    }

    //    그룹 생성
    public int insertGroup(GroupDto groupDto) {
        //        중복검사
        String confirmSql = "SELECT group_name FROM `group` WHERE group_name = ?";
        try {
            Connection conn = getConnection();
            PreparedStatement selectPs = conn.prepareStatement(confirmSql);
            ResultSet rs = null;

            selectPs.setString(1, groupDto.getGroupName());
            rs = selectPs.executeQuery();

            if (!rs.next()) {
                String insertSql = "insert into `group` values (?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement insertPs = conn.prepareStatement(insertSql);
                insertPs.setInt(1, 0);
                insertPs.setString(2, groupDto.getGroupName());
                insertPs.setInt(3, groupDto.getOttId());
                insertPs.setString(4, groupDto.getCreatedDate());
                insertPs.setString(5, groupDto.getContent());
                insertPs.setInt(6, groupDto.getPeriod());
                insertPs.setInt(7, groupDto.getMemberCount());
                return insertPs.executeUpdate();
            } else {
                throw new SQLException();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    //    그룹 참여
    public GroupDto joinGroup(MemberDto memberDto, GroupDto groupDto) {
        String insertSql = "insert into info values (?, ?, ?, ?, ?);";
        String updateSql = "update `group` set member_count = ? where group_name = ?;";
        try {
            Connection conn = getConnection();
//            info 등록
            PreparedStatement preparedStatement = conn.prepareStatement(insertSql);
            preparedStatement.setInt(1, 0);
            preparedStatement.setInt(2, groupDto.getOttId());
            preparedStatement.setString(3, memberDto.getMemberId());
            preparedStatement.setString(4, groupDto.getGroupName());
            preparedStatement.setString(5, LocalDateTime.now().toString());

            preparedStatement.executeUpdate();

            PreparedStatement preparedStatement1 = conn.prepareStatement(updateSql);
//            memberCount 증가
            preparedStatement1.setInt(1, groupDto.getMemberCount() + 1);
            preparedStatement1.setString(2, groupDto.getGroupName());

            preparedStatement1.executeUpdate();

//            Member 추가된 GroupDto 생성
            GroupDto updatedGroup = new GroupDto();
            String selectSql = "select * from `group` where id = ?";
            PreparedStatement selectPs = conn.prepareStatement(selectSql);
            selectPs.setInt(1, groupDto.getId());

            ResultSet resultSet = selectPs.executeQuery();
            while (resultSet.next()) {
                updatedGroup.setId(resultSet.getInt("id"));
                updatedGroup.setGroupName(resultSet.getString("group_name"));
                updatedGroup.setOttId(resultSet.getInt("ott_id"));
                updatedGroup.setCreatedDate(resultSet.getString("created_date"));
                updatedGroup.setContent(resultSet.getString("content"));
                updatedGroup.setPeriod(resultSet.getInt("period"));
                updatedGroup.setMemberCount(resultSet.getInt("member_count"));
            }

            return updatedGroup;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

//    ottId로 group 조회
    public List<GroupDto> selectGroupsByOttId(Integer ottId) {
        List<GroupDto> selectedGroups = new ArrayList<>();

        String selectSql = "select * from `group` where ott_id = ?";
        Connection conn = getConnection();
        try {
            PreparedStatement selectPs = conn.prepareStatement(selectSql);
            selectPs.setInt(1, ottId);
            ResultSet resultSet = selectPs.executeQuery();

            while (resultSet.next()) {
                GroupDto groupDto = new GroupDto();
                groupDto.setId(resultSet.getInt("id"));
                groupDto.setGroupName(resultSet.getString("group_name"));
                groupDto.setOttId(resultSet.getInt("ott_id"));
                groupDto.setCreatedDate(resultSet.getString("created_date"));
                groupDto.setContent(resultSet.getString("content"));
                groupDto.setPeriod(resultSet.getInt("period"));
                groupDto.setMemberCount(resultSet.getInt("member_count"));
                selectedGroups.add(groupDto);
                groupDto = null;
            }

            return selectedGroups;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

//    memberId 로 group 조회
    public List<GroupDto> selectGroupsByMemberId(String memberId) {
        List<GroupDto> selectedGroups = new ArrayList<>();

        String selectSql = "SELECT G.id, G.group_name, G.ott_id, G.created_date, G.content, G.period, G.member_count\n" +
                "FROM pizzaDB.group G\n" +
                "JOIN pizzaDB.info I\n" +
                "\tON I.group_name = G.group_name\n" +
                "JOIN pizzaDB.member M\n" +
                "\tON M.member_id = I.member_id\n" +
                "WHERE M.member_id = ?";
        Connection conn = getConnection();
        try {
            PreparedStatement selectPs = conn.prepareStatement(selectSql);
            selectPs.setString(1, memberId);

            ResultSet resultSet = selectPs.executeQuery();
            while (resultSet.next()) {
                GroupDto groupDto = new GroupDto();
                groupDto.setId(resultSet.getInt("id"));
                groupDto.setGroupName(resultSet.getString("group_name"));
                groupDto.setOttId(resultSet.getInt("ott_id"));
                groupDto.setCreatedDate(resultSet.getString("created_date"));
                groupDto.setContent(resultSet.getString("content"));
                groupDto.setPeriod(resultSet.getInt("period"));
                groupDto.setMemberCount(resultSet.getInt("member_count"));
                selectedGroups.add(groupDto);
                groupDto = null;
            }
            return selectedGroups;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
