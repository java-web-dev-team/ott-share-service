import dao.GroupDao;
import dto.GroupDto;
import dto.MemberDto;
import org.testng.annotations.Test;

import java.time.LocalDate;

public class GroupTest {

    public static void main(String[] args) {

        GroupDao groupDao = GroupDao.getInstance();
        GroupDto groupDto2 = new GroupDto(1,"askfjwekfhakljw",  "모집중", 6);

//        insertGroup test
//        groupDao.insertGroup(groupDto2);

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

        //    update Group -> groupName, ottId, content, period
//        public GroupDto(Integer ottId, String groupName, String content, Integer period) {
//            this.ottId = ottId;
//            this.groupName = groupName;
//            this.createdDate = LocalDate.now().toString();
//            this.content = content;
//            this.period = period;
//            this.memberCount = 0;
//        }
        GroupDto sessionGroup = groupDao.selectGroupByGroupName("Flowdesk");
        String updatedGroupName = "updatedGroup2";
        Integer updatedOttId = 5;
        String updatedContent = "updatedContent";
        Integer updatedPeriod = null;

        GroupDto updatedGroup = new GroupDto(
                updatedOttId != null ? updatedOttId : sessionGroup.getOttId(),
                updatedGroupName != null ? updatedGroupName : sessionGroup.getGroupName(),
                updatedContent != null ? updatedContent : sessionGroup.getContent(),
                updatedPeriod != null ? updatedPeriod : sessionGroup.getPeriod()
        );

        groupDao.updateGroup(updatedGroup, sessionGroup);


    }
}
