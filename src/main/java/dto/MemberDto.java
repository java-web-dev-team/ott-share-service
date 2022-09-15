package dto;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor(access = AccessLevel.PUBLIC)
@Getter @Setter
public class MemberDto {

    private Integer id;
    private String memberId;
    private String password;
    private String nickname;
    private String phone;

    public MemberDto(String member_id, String password, String nickname, String phone) {
        this.memberId = member_id;
        this.password = password;
        this.nickname = nickname;
        this.phone = phone;
    }


}
