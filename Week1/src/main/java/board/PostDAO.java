package board;

import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PostDAO {
    private Connection connection;
    private ResultSet rs;
    public PostDAO(){
        try{
            String dbUrl = "jdbc:mariadb://localhost:3306/board";
            String dbId = "root";
            String dbPwd = "root";
            Class.forName("org.mariadb.jdbc.Driver");
            connection = DriverManager.getConnection(dbUrl,dbId, dbPwd);
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    public String getDate(){
        String sql = "Select now()";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()){
                return rs.getString(1);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return "";
    }
    public int getId(){
        String sql = "Select postId from post order by postId desc ";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()){
                return rs.getInt(1) + 1;
            }
            else{
                return 0;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return -1;
    }

    public int insert(Post post){
        System.out.println("your " + getId());
        String query = "insert into post values (?,?,?,?,?,?,?,?,?)";
        try{
            PreparedStatement ps = connection.prepareStatement(query);
            System.out.println(ps);
            ps.setInt(1, getId());
            ps.setString(2, post.getCategory());
            ps.setString(3, post.getCreator());
            ps.setString(4, post.getPwd());
            ps.setString(5, post.getTitle());
            ps.setString(6, post.getContent());
            ps.setString(7, getDate());
            ps.setString(8, null);
            ps.setInt(9, 0);
            System.out.println(ps);
            return ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        return -1;
    }
}
