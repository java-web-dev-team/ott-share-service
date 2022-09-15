package dto;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;
import java.util.Objects;

@NoArgsConstructor(access = AccessLevel.PUBLIC)
@Getter @Setter
public class MemberDto {

    private Integer id;
    private String member_id;
    private String password;
    private String nickname;
    private String phone;

    public MemberDto(String member_id, String password, String nickname, String phone) {
        this.member_id = member_id;
        this.password = password;
        this.nickname = nickname;
        this.phone = phone;
    }


}
