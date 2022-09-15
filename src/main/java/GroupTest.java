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
        groupDto2.setId(1);

        groupDto2.setCreatedDate("2022-09-03");
        MemberDto memberDto1 = new MemberDto("abevillei", "TYzilDHrh", "Farra", "751-380-8801");
        System.out.println(groupDAO.joinGroup(memberDto1, groupDto2).getId());
        System.out.println(groupDAO.joinGroup(memberDto1, groupDto2).getGroupName());
        System.out.println(groupDAO.joinGroup(memberDto1, groupDto2).getContent());
        System.out.println(groupDAO.joinGroup(memberDto1, groupDto2).getMemberCount());
        System.out.println(groupDAO.joinGroup(memberDto1, groupDto2).getPeriod());
        System.out.println(groupDAO.joinGroup(memberDto1, groupDto2).getCreatedDate());
        System.out.println(groupDAO.joinGroup(memberDto1, groupDto2).getOttId());


        System.out.println(groupDAO.selectGroupsByOttId(7));

        System.out.println(groupDAO.selectGroupsByMemberId("kmadsena"));

    }
}