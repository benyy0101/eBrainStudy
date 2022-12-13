package file;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class FileDAO {
    private Connection connection;

    public FileDAO(){
        try{
            String dbUrl = "jdbc:mariadb//localhost:3306/file";
            String dbId = "root";
            String dbPwd = "root";
            Class.forName("org.mariadb.jdbc.Driver");
            connection = DriverManager.getConnection(dbUrl, dbId, dbPwd);

        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public int upload(String fileName, String fileRealName){
        String query = "insert into file values (?,?)";

        try{
            PreparedStatement ps = connection.prepareStatement(query);

            ps.setString(1,fileName);
            ps.setString(2,fileRealName);

            return ps.executeUpdate();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return -1;
    }
}
