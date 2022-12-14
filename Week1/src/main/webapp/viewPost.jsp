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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
    <button type = "button" class = "btn btn-dark" data-bs-toggle = "modal" data-bs-target="#authModal">수정하기</button>

    <%--    비밀번호 확인 모달 띄우기--%>
    <div class = "modal fade" id="authModal" tabindex="-1" role = "dialog" aria-labelledby="authModalLabel" aria-hidden = "true">
        <div class = "modal-dialog" role = "document">
            <div class = "modal-content">
                <form action = "authAction.jsp">
                    <div class = "modal-header">
                        <h5 class = "modal-title" id = "authModalTitle">비밀번호 확인</h5>
                    </div>
                    <div class = "modal-body">
                        <div class = "form-group">
                            <div>비밀번호를 입력해주세요</div>
                            <input type = "password" class = "form-control" name = "auth" >
                        </div>
                    </div>
                    <div class = "modal-footer">
                        <input type = "hidden" name = "postId" value = "<%=postId%>">
                        <input type = "submit" class = "btn btn-dark" value = "확인">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<script src="js/bootstrap.bundle.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
</html>
