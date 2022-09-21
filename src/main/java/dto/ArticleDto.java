package dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@NoArgsConstructor
@Getter @Setter
public class ArticleDto {

    private final Integer id = 0;
    private String title;
    private String content;
    private Integer ottId;
    private String createdBy;   //  nickname
    private String createdDate;

    public ArticleDto(String title, String content, Integer ottId, String createdBy) {
        this.title = title;
        this.content = content;
        this.ottId = ottId;
        this.createdBy = createdBy;
        this.createdDate = LocalDate.now().toString();
    }

}
