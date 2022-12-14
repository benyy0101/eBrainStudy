<%@ page import="board.Post" %>
<%@ page import="board.PostDAO" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: benyy
  Date: 2022-12-14
  Time: 오후 1:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String auth = request.getParameter("auth");
    int postId = Integer.parseInt(request.getParameter("postId"));
    PostDAO postDAO = new PostDAO();
    boolean result = postDAO.authentication(postId,auth);

    if(auth == null){
        PrintWriter pw = response.getWriter();
        pw.println("<script>");
        pw.println("alert('비밀번호를 입력해주세요');");
        pw.println("location.href = 'viewPost.jsp?postId="+postId+"'");
        pw.println("</script>");
    }
    if(result){
        PrintWriter pw = response.getWriter();
        pw.println("<script>");
        pw.println("location.href = 'updatePost.jsp?postId="+postId+"'");
        pw.println("</script>");
    }
    else{
        PrintWriter pw = response.getWriter();
        pw.println("<script>");
        pw.println("alert('비밀번호가 맞지 않습니다');");
        pw.println("location.href = 'viewPost.jsp?postId="+postId+"'");
        pw.println("</script>");
    }
%>

<p></p>
</body>
</html>
