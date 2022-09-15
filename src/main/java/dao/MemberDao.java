package dao;

import dto.MemberDto;

public interface MemberDao {

    int insertMember(MemberDto m) throws Exception;

    void deleteAll() throws Exception;

    int deleteMember(String id) throws Exception;

    int updateMember(MemberDto m) throws Exception;

    int count() throws Exception;

    int userCheck(String id, String pwd) throws Exception;

    int confirmID(String id) throws Exception;

    MemberDto getMember(String id) throws Exception;

}
