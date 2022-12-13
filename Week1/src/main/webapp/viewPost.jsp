<%--
  Created by IntelliJ IDEA.
  User: benyy
  Date: 2022-12-12
  Time: 오후 6:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "board.PostDAO " %>
<%@ page import = "board.Post " %>
<%@ page import="board.CommentDAO" %>
<%@ page import="board.Comment" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>Read a post!</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel = "stylesheet" href = "css/bootstrap.css">
</head>
<body>
<%

    int postId = Integer.parseInt(request.getParameter("postId"));
    System.out.println("postId "+postId);
    PostDAO postDAO = new PostDAO();
    Post post = postDAO.getOnePost(postId);
    int viewupdate = postDAO.incView(postId, post.getViews());

    CommentDAO commentDAO = new CommentDAO();
    ArrayList<Comment> list = commentDAO.getAllComments(postId);
%>
<div class = "container">
    <div class = "jumbotron">
        <h2 class = "display-4">게시판 - 보기</h2>
    </div>
</div>

<table class = "table">
    <tr>
        <td>게시자: <%=post.getCreator()%></td>
        <td>등록일자: <%=post.getCreatedDate()%></td>
        <td>수정일자: <%=post.getEditedDate()%></td>
    </tr>
    <tr>
        <td>카테고리: <%=post.getCategory()%></td>
        <td>제목: <%=post.getTitle()%></td>
        <td>조회수: <%=post.getViews()+1%></td>
    </tr>
    <tr>
        <td colspan = "3">
            <div class = "card">
                <div class = "card-body bg-light"><%=post.getContent()%></div>
            </div>
        </td>
    </tr>
    <tr>
        <td colspan="3">Comments</td>
    </tr>
    <%
        for (int i = 0; i < list.size(); i++){ %>
        <tr>
            <td colspan = "2"><%=list.get(i).getComment()%></td>
            <td colspan = "1"><%=list.get(i).getDate()%></td>
        </tr>
    <%}
        %>
    <tr>
        <form method = "post" action = "commentAction.jsp">
            <input type = "hidden" name = "postId" value = <%=postId%>>
            <td colspan="2"><textarea class = "form-control" name = "comment" row ="3" ></textarea></td>
            <td colspan = "1"><input type = "submit" class = "btn btn-dark" value = "등록"></td>
        </form>

    </tr>

</table>
<div class = "container">
    <button class = "btn btn-dark" onclick = "location.href = 'updatePost.jsp?postId=<%=post.getPostId()%>'">수정</button>
</div>
</body>
</html>
