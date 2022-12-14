package board;

import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
        String query = "insert into post values (?,?,?,?,?,?,?,?,?)";
        try{
            PreparedStatement ps = connection.prepareStatement(query);

            ps.setInt(1, getId());
            ps.setString(2, post.getCategory());
            ps.setString(3, post.getCreator());
            ps.setString(4, post.getPwd());
            ps.setString(5, post.getTitle());
            ps.setString(6, post.getContent().replace("\r\n","<br>"));
            ps.setString(7, getDate());
            ps.setString(8, null);
            ps.setInt(9, 0);

            return ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        return -1;
    }
    public ArrayList<Post> getList(int pageNum){
        String sql = "Select * from post where postId < ? order by postid desc limit 10";
        ArrayList<Post> list = new ArrayList<Post>();
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            int pageSize = getId() - (pageNum - 1) * 10;
            ps.setInt(1,pageSize);
            rs = ps.executeQuery();
            while(rs.next()){
                Post post = new Post();
                post.setPostId(rs.getInt(1));
                post.setCategory(rs.getString(2));
                post.setCreator(rs.getString(3));
                post.setPwd(rs.getString(4));
                post.setTitle(rs.getString(5));
                post.setContent(rs.getString(6));
                post.setCreatedDate(rs.getString(7).substring(0,11));
                String rawEditedDate = rs.getString(8);
                if(rawEditedDate != null){
                    post.setEditedDate(rawEditedDate.substring(0,11));
                }
                else{
                    post.setEditedDate("-");
                }
                post.setViews(rs.getInt(9));
                list.add(post);
            }

        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public ArrayList<Post> getSearchList(int pageNum,String category, String keyword){
        ArrayList<Post> list = new ArrayList<Post>();
        String sql = "";
        if(category.equals("all")){
            System.out.println("HI");
            sql = "Select * from post where postId < ? and (content like ? or title like ? or creator like ?) order by postid desc limit 10";
            try{
                PreparedStatement ps = connection.prepareStatement(sql);
                int pageSize = getId() - (pageNum - 1) * 10;
                ps.setInt(1,pageSize);
                ps.setString(2, "%" + keyword + "%");
                ps.setString(3, "%" + keyword + "%");
                ps.setString(4, "%" + keyword + "%");
                rs = ps.executeQuery();
                while(rs.next()){
                    Post post = new Post();
                    post.setPostId(rs.getInt(1));
                    post.setCategory(rs.getString(2));
                    post.setCreator(rs.getString(3));
                    post.setPwd(rs.getString(4));
                    post.setTitle(rs.getString(5));
                    post.setContent(rs.getString(6));
                    post.setCreatedDate(rs.getString(7).substring(0,11));
                    String rawEditedDate = rs.getString(8);
                    if(rawEditedDate != null){
                        post.setEditedDate(rawEditedDate.substring(0,11));
                    }
                    else{
                        post.setEditedDate("-");
                    }
                    post.setViews(rs.getInt(9));
                    list.add(post);
                }

            }catch(Exception e){
                e.printStackTrace();
            }
        }
        else if (keyword == "") {
            sql = "Select * from post where postId < ? and category = ? order by postid desc limit 10";
            try{
                PreparedStatement ps = connection.prepareStatement(sql);
                int pageSize = getId() - (pageNum - 1) * 10;
                ps.setInt(1,pageSize);
                ps.setString(2, category);

                rs = ps.executeQuery();
                while(rs.next()){
                    Post post = new Post();
                    post.setPostId(rs.getInt(1));
                    post.setCategory(rs.getString(2));
                    post.setCreator(rs.getString(3));
                    post.setPwd(rs.getString(4));
                    post.setTitle(rs.getString(5));
                    post.setContent(rs.getString(6));
                    post.setCreatedDate(rs.getString(7).substring(0,11));
                    String rawEditedDate = rs.getString(8);
                    if(rawEditedDate != null){
                        post.setEditedDate(rawEditedDate.substring(0,11));
                    }
                    else{
                        post.setEditedDate("-");
                    }
                    post.setViews(rs.getInt(9));
                    list.add(post);
                }

            }catch(Exception e){
                e.printStackTrace();
            }
        } else{
            sql = "Select * from post where postId < ? and (content like ? or title like ? or creator like ?) and category = ? order by postid desc limit 10";
            try{
                PreparedStatement ps = connection.prepareStatement(sql);
                int pageSize = getId() - (pageNum - 1) * 10;
                ps.setInt(1,pageSize);
                ps.setString(2, "%" + keyword + "%");
                ps.setString(3, "%" + keyword + "%");
                ps.setString(4, "%" + keyword + "%");
                ps.setString(5, category);
                rs = ps.executeQuery();
                while(rs.next()){
                    Post post = new Post();
                    post.setPostId(rs.getInt(1));
                    post.setCategory(rs.getString(2));
                    post.setCreator(rs.getString(3));
                    post.setPwd(rs.getString(4));
                    post.setTitle(rs.getString(5));
                    post.setContent(rs.getString(6));
                    post.setCreatedDate(rs.getString(7).substring(0,11));
                    String rawEditedDate = rs.getString(8);
                    if(rawEditedDate != null){
                        post.setEditedDate(rawEditedDate.substring(0,11));
                    }
                    else{
                        post.setEditedDate("-");
                    }
                    post.setViews(rs.getInt(9));
                    list.add(post);
                }

            }catch(Exception e){
                e.printStackTrace();
            }
        }
        return list;
    }
    public int getTotalPostNum(){
        String query = "Select * from post";
        try{
            PreparedStatement ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            int result = 0;
            while(rs.next()){
                result++;
            }
            return result;
        }catch (Exception e){
            e.printStackTrace();
        }
        return -1;
    }
    public Post getOnePost(int postId){
        String query = "Select * from post where postId = ?";
        try{
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1,postId);
            rs = ps.executeQuery();

            if(rs.next()){
                Post post = new Post();
                post.setPostId(rs.getInt(1));
                post.setCategory(rs.getString(2));
                post.setCreator(rs.getString(3));
                post.setPwd(rs.getString(4));
                post.setTitle(rs.getString(5));
                post.setContent(rs.getString(6));
                post.setCreatedDate(rs.getString(7).substring(0,11));
                if(rs.getString(8) == null){
                    post.setEditedDate("-");
                }
                else{
                    post.setEditedDate(rs.getString(8));
                }
                post.setViews(rs.getInt(9));
                return post;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public int updatePost(Post post){
        System.out.println("WHy?");
        String query = "update post set category = ?, creator = ?, pwd = ?, title = ?, content = ?, editedDate = ? where postId = ?";
        try{
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, post.getCategory());
            ps.setString(2, post.getCreator());
            ps.setString(3, post.getPwd());
            ps.setString(4, post.getTitle());
            ps.setString(5, post.getContent().replace("\r\n","<br>"));
            ps.setString(6, getDate());
            ps.setInt(7,post.getPostId());
            System.out.println(ps);
            return ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        return -1;
    }

    public int incView(int postId, int numViews){
        String query = "update post set views = ? where postId = ?";

        try{
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, numViews + 1);
            ps.setInt(2, postId);
            return ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return -1;
    }

    public boolean authentication(int postId, String auth){
        String query = "select pwd from post where postId = ?";
        try{
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1,postId);
            rs = ps.executeQuery();
            if(rs.next()){
                String temp = rs.getString("pwd");
                return auth.equals(temp);
            }
            return false;
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
}
