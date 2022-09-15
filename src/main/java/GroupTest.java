import dao.GroupDAO;
import dto.GroupDto;
import dto.MemberDto;

public class GroupTest {

    public static void main(String[] args) {
        GroupDto groupDto1 = new GroupDto(1, "aaa", "content", 3);

        GroupDAO groupDAO = new GroupDAO();

//        insertGroup test
//        groupDAO.insertGroup(groupDto1);

//        joinGroup test
        GroupDto groupDto2 = new GroupDto(1,"South",  "모집중", 6);
        groupDto2.setCreatedDate("2022-09-03");
        MemberDto memberDto1 = new MemberDto("abevillei", "TYzilDHrh", "Farra", "751-380-8801");
        groupDAO.joinGroup(memberDto1, groupDto2);



    }
}
