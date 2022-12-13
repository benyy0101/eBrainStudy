<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.Comment" %>
<%@ page import="board.CommentDAO" %><%--
  Created by IntelliJ IDEA.
  User: benyy
  Date: 2022-12-13
  Time: 오후 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="comments" class = "board.Comment" scope = "page"></jsp:useBean>
<jsp:setProperty name="comments" property="postId"/>
<jsp:setProperty name="comments" property="comment"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    if(comments.getComment() == null) {
        PrintWriter pw = response.getWriter();
        pw.println("<script>");
        pw.println("alert('댓글이 비어있습니다');");
        pw.println("history.back()");
        pw.println("</script>");
    }
    else{
        CommentDAO commentDAO = new CommentDAO();
        int result = commentDAO.insertComment(comments.getPostId(), comments.getComment());
        if(result != -1){
            PrintWriter pw = response.getWriter();
            pw.println("<script>");
            String target = "'viewPost.jsp?postId=" + comments.getPostId()+"'";
            pw.println("location.href = " + target);
            pw.println("</script>");
        }
        else{
            PrintWriter pw = response.getWriter();
            pw.println("<script>");
            pw.println("alert('데이터베이스에 등록되지 않았습니다');");
            pw.println("history.back()");
            pw.println("</script>");
        }
    }
%>
</body>
</html>
