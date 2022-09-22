package dao;

import dto.MemberDto;
import org.junit.Test;

import static org.junit.Assert.*;

public class MemberDaoImplTest {

    MemberDao memberDao = new MemberDaoImpl();

    @Test
    public void count() throws Exception {
        assertTrue(memberDao.count()==14);
    }

    @Test       // db 에 유저가 있으면 1, pwd가 틀리면 0, 없으면 -1
    public void userCheck() throws Exception {
        assertTrue(memberDao.userCheck("abevillei", "TYzilDHrh") == 1);     // ID, PWD o
        assertTrue(memberDao.userCheck("abevillei", "TYzilDHr") == 0);      // ID o, PWD x
        assertTrue(memberDao.userCheck("abeville", "TYzilDHr") == -1);      // ID, PWD x
    }

    @Test
    public void confirmID() throws Exception {
        assertTrue(memberDao.confirmID("dglentond") == 1);              // O
        assertTrue(memberDao.confirmID("dglenton") == -1);              // X
    }

    @Test
    public void getMember() throws Exception {
        System.out.println("memberDao.getMember(\"dglentond\") = " + memberDao.getMember("asdf"));
    }

    @Test
    public void insertMember() throws Exception {
        MemberDto m = new MemberDto("asdf", "1234", "user", "010-0000-0000");
        memberDao.insertMember(m);
        assertTrue(memberDao.count() == 1);
    }

    @Test
    public void updateMember() throws Exception {
        assertTrue(memberDao.count() == 15);
        MemberDto m = new MemberDto("asdf", "qwer", "userUpdate", "010-1111-2222");
        assertTrue(memberDao.updateMember(m) == 1);
    }


    @Test
    public void deleteMember() throws Exception {
        memberDao.deleteMember("asdf");
        assertTrue(memberDao.count() == 14);
    }

    @Test
    public void findNickName(){
        System.out.println("memberDao.findNickName(\"asdf\") = " + memberDao.findNickName("asdf"));
    }


    @Test
    public void deleteAll() throws Exception {
        memberDao.deleteAll();
        assertTrue(memberDao.count() == 0);
    }

}