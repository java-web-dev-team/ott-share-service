import dao.GroupDao;
import dto.GroupDto;
import dto.MemberDto;
import org.testng.annotations.Test;

public class GroupTest {

    public static void main(String[] args) {

        GroupDao groupDao = GroupDao.getInstance();
        GroupDto groupDto2 = new GroupDto(1,"askfjwekfhakljw",  "모집중", 6);

//        insertGroup test
        groupDao.insertGroup(groupDto2);

//        joinGroup test
//        groupDto2.setId(1);
//
//        groupDto2.setCreatedDate("2022-09-03");
//        MemberDto memberDto1 = new MemberDto("abevillei", "TYzilDHrh", "Farra", "751-380-8801");
//
//
//
//        System.out.println(groupDAO.selectGroupsByOttId(7));
//
//        System.out.println(groupDAO.selectGroupsByMemberId("kmadsena"));

//        System.out.println(groupDao.selectAllGroups());

    }
}
