package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CommentDAO {
    private Connection connection;
    private ResultSet rs;
    public CommentDAO(){
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
    public int insertComment(int postId, String comment){
        String query = "insert into comments value(?,?,?)";

        try{
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1,postId);
            ps.setString(2,comment);
            ps.setString(3,getDate());
            return ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return -1;
    }

    public ArrayList<Comment> getAllComments(int postId){
        String query = "select * from comments where postId = ?";
        ArrayList<Comment> list = new ArrayList<Comment>();
        try{
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1,postId);
            rs = ps.executeQuery();

            while(rs.next()){
                Comment temp = new Comment();
                temp.setPostId(rs.getInt(1));
                temp.setComment(rs.getString(2));
                temp.setDate(rs.getString(3).substring(0,11));
                list.add(temp);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
}
