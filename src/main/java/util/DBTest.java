package util;

import java.sql.Connection;

public class DBTest {
    public static void main(String[] args) {
        Connection connection;
        try{
            connection = DBManager.getConnection();
            if(connection != null){
                System.out.println("연결 완료");
            }
        } catch(Exception e){
            e.printStackTrace();

        }
    }
}
