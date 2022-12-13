<%--
  Created by IntelliJ IDEA.
  User: benyy
  Date: 2022-12-12
  Time: 오후 7:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="board.PostDAO" %>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");  %>
<jsp:useBean id="post" class = "board.Post" scope = "page"></jsp:useBean>
<jsp:setProperty name="post" property="category"/>
<jsp:setProperty name="post" property="creator"/>
<jsp:setProperty name="post" property="pwd"/>
<jsp:setProperty name="post" property="title"/>
<jsp:setProperty name="post" property="content"/>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        if(post.getCategory() == null
                || post.getCreator() == null
                || post.getPwd() == null
                || post.getTitle() == null
                || post.getContent() == null
                ) {
            PrintWriter pw = response.getWriter();
            pw.println("<script>");
            pw.println("alert('입력값이 맞지 않습니다.');");
            pw.println("history.back()");
            pw.println("</script>");
        }
        else{

            PostDAO postDAO = new PostDAO();
            int result = postDAO.insert(post);
            if(result != -1){
                PrintWriter pw = response.getWriter();
                pw.println("<script>");
                pw.println("alert('성공적으로 등록되었습니다');");
                pw.println("location.href = 'index.jsp'");
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
