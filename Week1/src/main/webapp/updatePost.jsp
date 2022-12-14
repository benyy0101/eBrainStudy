<%--
  Created by IntelliJ IDEA.
  User: benyy
  Date: 2022-12-13
  Time: 오후 7:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "board.PostDAO " %>
<%@ page import = "board.Post" %>
<html>
<head>
    <title>Write a post!</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel = "stylesheet" href = "css/bootstrap.css">
</head>

<body>
<%
    int postId = Integer.parseInt(request.getParameter("postId"));
    PostDAO postDAO = new PostDAO();
    Post post = postDAO.getOnePost(postId);

%>
<div class = "container">
    <div class = "jumbotron">
        <h2 class = "display-4">게시판 - 수정</h2>
    </div>
</div>

<div class = "container">
    <form method = "post" action = "updateAction.jsp">
        <table class = "table">
            <thead></thead>
            <tbody>
            <tr>
                <th>카테고리</th>
                <div class = "form-group">
                    <td>
                        <select class = "form-control" name = "category" selected = <%=post.getCategory()%>>
                            <option value = "Java">Java</option>
                            <option value = "Javascript">Javascript</option>
                            <option value = "Python">Python</option>
                            <option value = "Database">Database</option>
                        </select>
                    </td>
                </div>
            </tr>

            <tr>
                <th>작성자</th>
                <div class = "form-group">
                    <td>
                        <input type = "text" class = "form-control" maxlength = "20" name = "creator" value = <%= post.getCreator()%>>
                    </td>
                </div>
            </tr>

            <tr>
                <th>비밀번호</th>
                <div class = "form-group">
                    <td><input type = "password" class = "form-control" name = "pwd" maxlength = "50" placeholder = "비밀번호"></td>
                </div>
                <%--                    <td><input type = "text" class = "form-control" name = "pwdCrosscheck" maxlength = "50" placeholder="비밀번호 확인"></td>--%>
            </tr>

            <tr>
                <th>제목</th>
                <div class = "form-group">
                    <td><input type = "text" class = "form-control" name = "title" maxlength = "50" value = <%=post.getTitle()%>></td>
                </div>
            </tr>

            <tr>
                <th>내용</th>
                <div class = "form-group">
                    <td><textarea type = "text" class = "form-control" name = "content" maxlength = "500" rows = "10"><%=post.getContent().replace("<br>","\r\n")%></textarea></td>
                </div>
            </tr>

            <%--                <tr>--%>
            <%--                    <th>파일첨부</th>--%>
            <%--                    <td><input type = "file" class = "form-control-file"></td>--%>
            <%--                </tr>--%>
            </tbody>
        </table>
        <input type = "hidden" class = "form-control" name = "postId" value = "<%=request.getParameter("postId")%>">
        <div class = "container">
            <div class = "row">
                <div class = "col form-group">
                    <input type = "submit" class = "btn btn-dark" value = "수정"\>
                </div>
                <div class = "col">
                    <button class = "btn">취소</button>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>

