package dto;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor(access = AccessLevel.PUBLIC)
@Getter @Setter
public class MemberDto {

    private String memberId;
    private String password;

    public MemberDto(String memberId, String password) {
        this.memberId = memberId;
        this.password = password;
    }
}
