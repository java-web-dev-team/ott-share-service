package dto;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.text.ParseException;
import java.time.LocalDate;
import java.time.LocalDateTime;

@NoArgsConstructor(access = AccessLevel.PUBLIC)
@Getter @Setter
public class GroupDto {

    private Integer id;     //  PK
    private String groupName;
    private Integer ottId;
    private String createdDate;
    private String content;
    private Integer period;
    private Integer memberCount;

    public GroupDto(Integer ottId, String groupName, String content, Integer period) {
        this.ottId = ottId;
        this.groupName = groupName;
        this.createdDate = LocalDate.now().toString();
        this.content = content;
        this.period = period;
        this.memberCount = 0;
    }

    //    public GroupDto updateGroupDto(Integer ottId, String groupName, Integer memberCount) {
//        this.setOttId(ottId);
//        this.setGroupName(groupName);
//
//        return this;
//    }
}
