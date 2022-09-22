package dao;

import dto.MemberDto;
import util.DBManager;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MemberDaoImpl implements MemberDao{

    // 회원수 카운트 메서드
    public int count(){
        int count = 0;
        String sql = "SELECT COUNT(*) FROM member";
        try {

            Connection conn = DBManager.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);

            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                count = rs.getInt(1);
            }

            return count;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // 입력된 유저 아이디와 비밀번호가 DB에 있는지 체크
    @Override
    public int userCheck(String id, String pwd) {
        int result = -1;
        String sql = "SELECT password FROM member WHERE member_id = ?";
        Connection conn = DBManager.getConnection();
        ResultSet rs = null;
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                if (rs.getString("password") != null && rs.getString("password").equalsIgnoreCase(pwd)) {
                    result = 1;
                } else {
                    result = 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(rs);
        }
        return result;
    }

    // 아이디 중복 확인 메서드
    @Override
    public int confirmID(String id) {
        int result = -1;
        String sql = "SELECT member_id FROM member WHERE member_id = ?";
        ResultSet rs = null;
        try{
            Connection conn = DBManager.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if(rs.next()){
                result = 1;
            } else {
                result = -1;
            }
        } catch(Exception e){
            e.printStackTrace();
        } finally {
            DBManager.close(rs);
        }
        return result;
    }

    // 아이디의 정보를 가져오는 메서드
    @Override
    public MemberDto getMember(String id) {
        MemberDto m = null;
        String sql = "SELECT * FROM member WHERE member_id = ?";
        ResultSet rs;
        try{
            Connection conn = DBManager.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if(rs.next()){
                m = new MemberDto();
                m.setId(rs.getInt("id"));
                m.setMemberId(rs.getString("member_id"));
                m.setPassword(rs.getString("password"));
                m.setNickname(rs.getString("nickname"));
                m.setPhone(rs.getString("phone"));

                return m;
            }
        } catch(Exception e){
            e.printStackTrace();
        }

        return m;
    }

    public List<MemberDto> selectAllMember(){
        List<MemberDto> AllMemberlist = new ArrayList();
        String sql = "SELECT * FROM member";
        ResultSet rs;
        try{
            Connection conn = DBManager.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()){
                MemberDto memberDto = new MemberDto();
                memberDto.setMemberId("id");
                memberDto.setMemberId("member_id");
                memberDto.setPassword("password");
                memberDto.setNickname("nickname");
                memberDto.setPhone("phone");
                AllMemberlist.add(memberDto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return AllMemberlist;
    }

    @Override
    public String findNickName(String id){
        String sql = "SELECT nickname from member where member_id = ?";
        ResultSet rs;

        try {
            Connection conn = DBManager.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                String name = rs.getString("nickname");
                return name;
            }

        } catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }


    // 가입 메서드
    @Override
    public int insertMember(MemberDto member) throws Exception {
        int rowCnt = 0;
        // id, member_id, password, nickname, phone
        String sql = "INSERT IGNORE INTO member VALUES (?, ?, ?, ?, ?)";
        try (
                Connection conn = DBManager.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setInt(1, 0);
            pstmt.setString(2, member.getMemberId());
            pstmt.setString(3, member.getPassword());
            pstmt.setString(4, member.getNickname());
            pstmt.setString(5, member.getPhone());

            return pstmt.executeUpdate();
        }
    }

    // 전체 삭제 메서드
    @Override
    public void deleteAll() throws Exception {
        String sql = "DELETE FROM member";
        Connection conn = DBManager.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.executeUpdate();
    }

    // 멤버 삭제 메서드
    @Override
    public int deleteMember(String id) throws Exception {
        String sql = "DELETE FROM member WHERE member_id = ?";

        Connection conn = DBManager.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        return pstmt.executeUpdate();
    }

    // 멤버 수정 메서드
    @Override
    public int updateMember(MemberDto m) throws Exception {
        int rowCnt = 0;
        String sql = "UPDATE member SET password = ?, nickname = ?, phone = ? " + "WHERE member_id = ?";
        Connection conn = DBManager.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, m.getPassword());
        pstmt.setString(2, m.getNickname());
        pstmt.setString(3, m.getPhone());
        pstmt.setString(4, m.getMemberId());

        rowCnt = pstmt.executeUpdate();

        return rowCnt;
    }

}
