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
    private int sequence = 10000;   //  TODO: 테스트용 / 향후 0으로 수정
    private static GroupDAO instance = null;

    public static GroupDAO getInstance() {
        if (instance == null) {
            instance = new GroupDAO();
        }
        return instance;
    }

//    // 데이터베이스를 조작하는 메소드를 정의
//    // Connection을 CP에서 가져오는 메소드를 하나 정의
//    public Connection getConnection() throws Exception /* 예외 처리 */ {
//        Connection conn = null;
//        Context initContext = new InitialContext();
//        Context envContext = (Context) initContext.lookup("java:/comp/env");
//        DataSource ds = (DataSource) envContext.lookup("jdbc/mysql");
//        conn = ds.getConnection();
//        return conn;
//    }

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
        String sql = "insert into info values (?, ?, ?, ?, ?);" +
                "update `group` set member_count = ?;";
        try {
            Connection conn = getConnection();
//            info 등록
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, 0);
            preparedStatement.setInt(2, groupDto.getOttId());
            preparedStatement.setString(3, memberDto.getMemberId());
            preparedStatement.setString(4, LocalDateTime.now().toString());

//            memberCount 증가
            preparedStatement.setInt(1, groupDto.getMemberCount() + 1);

            preparedStatement.executeUpdate();

//            Member 추가된 GroupDto 생성
            GroupDto updatedGroup = new GroupDto();
            String selectSql = "select * from `group` where id = ?";
            PreparedStatement selectPs = conn.prepareStatement(selectSql);
            selectPs.setInt(1, groupDto.getId());

            ResultSet resultSet = selectPs.executeQuery();
            updatedGroup.setId(resultSet.getInt("id"));
            updatedGroup.setGroupName(resultSet.getString("group_name"));
            updatedGroup.setOttId(resultSet.getInt("ott_id"));
            updatedGroup.setCreatedDate(resultSet.getString("created_date"));
            updatedGroup.setContent(resultSet.getString("content"));
            updatedGroup.setPeriod(resultSet.getInt("period"));
            updatedGroup.setMemberCount(resultSet.getInt("member_count"));

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
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return new ArrayList<>();
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
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return new ArrayList<>();
    }


//    그룹 조회 - 마이페이지에서 memberId로 조회
//    public List<GroupDto> selectGroupsByMemberId(MemberDto memberDto) {
//        List<GroupDto> result = new ArrayList<>();
//        String sql = "select * from `group` where member_id = ?";
//        ResultSet rs = null;
//        try (Connection conn = getConnection();
//             PreparedStatement pstmt = conn.prepareStatement(sql);) {
//            pstmt.setInt(1, memberDto.getId());
//            rs = pstmt.executeQuery();
//            while(rs.next()) {
//                GroupDto groupDto = new GroupDto();
//                groupDto.setId(rs.getInt("id"));
//                groupDto.setOttId(rs.getInt("ott_id"));
//                groupDto.setGroupName(rs.getString("group_name"));
//                groupDto.setCreatedDate(rs.getTimestamp("created_date").toLocalDateTime());
//                groupDto.setStartDate(rs.getString("start_date"));
//                groupDto.setEndDate(rs.getString("end_date"));
//                result.add(groupDto);
//                groupDto = null;
//            }
//        } catch(Exception e) {
//            e.printStackTrace();
//        }
//        return result;
//    }
//
////    update 가능 필드 : ottId, groupName, startDate, endDate
//    public GroupDto updateGroup(GroupDto groupDto, Integer ottId, String groupName, String startDate, String endDate) {
//        groupDto.updateGroupDto(ottId, groupName, startDate, endDate);
//        String sql = "update `group` set ott_id=?, group_name=?, start_date=?, end_date=? where id=?";
//        try (Connection conn = getConnection();
//        ) {
//            assert conn != null;
//            try (PreparedStatement pstmt = conn.prepareStatement(sql);) {
//                pstmt.setInt(1, ottId);
//                pstmt.setString(2, groupName);
//                pstmt.setString(3, startDate);
//                pstmt.setString(4, endDate);
//                pstmt.setInt(5, groupDto.getId());
//                pstmt.executeUpdate();
//            }
//        } catch(Exception e) {
//                e.printStackTrace();
//            }
//            return groupDto;
//    }
//
//    // 회원정보를 삭제하는 메소드 : 사용자가 회원탈퇴, 관리자가 삭제
//    public void deleteGroupByGroupName(String groupName) {
//        String sql = "delete from `group` where id=?";
//        try (Connection conn = getConnection();
//             PreparedStatement pstmt = conn.prepareStatement(sql);) {
//            pstmt.setString(1, groupName);
//            pstmt.executeUpdate();
//        } catch(Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//    // 관리자 기능
//    public List<GroupDto> selectAllGroups() {
//        String sql = "select * from `group`";
//        List<GroupDto> list = new ArrayList<GroupDto>();
//        try (Connection conn = getConnection();
//             Statement stmt = conn.createStatement();
//             ResultSet rs = stmt.executeQuery(sql);	) {
//            while (rs.next()) {
//                // 중복되는 부분을 메소드로 만들어 준다.
//                GroupDto groupDto = new GroupDto();
//                groupDto.setGroupName(rs.getString("group_id"));
//                groupDto.setOttId(rs.getInt("ott_id"));
//                groupDto.setGroupName(rs.getString("group_name"));
//                groupDto.setMemberId(rs.getInt("member_id"));
//                groupDto.setStartDate(rs.getString("start_date"));
//                groupDto.setEndDate(rs.getString("end_date"));
//                list.add(groupDto);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
}
