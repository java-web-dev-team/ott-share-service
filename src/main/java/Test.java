import dao.GroupDAO;
import dto.GroupDto;

public class Test {

    public static void main(String[] args) {
        GroupDto groupDto = new GroupDto("aaa", 1, "content", 3);

        GroupDAO groupDAO = new GroupDAO();

        groupDAO.insertGroup(groupDto);


    }
}
