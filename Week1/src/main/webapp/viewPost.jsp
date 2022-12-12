<%--
  Created by IntelliJ IDEA.
  User: benyy
  Date: 2022-12-12
  Time: 오후 6:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Read a post!</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel = "stylesheet" href = "css/bootstrap.css">
</head>
<body>
<div class = "container">
    <div class = "jumbotron">
        <h1 class = "display-4">게시판 - 보기</h1>
    </div>
</div>

<div class = "container">
    <div class = "row">
        <div class = "col">
            김태수
        </div>
        <div class = "col">
            등록일시
        </div>
        <div class = "col">
            등록일시
        </div>
    </div>

    <div class = "row">
        <div class = "col"> 카테고리 </div>
        <div class = "col"> 제목 </div>
        <div class = "col">조회수: </div>
    </div>
</div>

<div class = "container">
    <div class = "container">
        본문
    </div>
    <div class = "container">
        첨부파일
    </div>
</div>

<div class = "container">
    댓글
    <div class = "row">
        <div class = "col-7">
            <textarea class = "form-control" row ="3" ></textarea>
        </div>
        <div class = "col-1">
            <button class = "btn btn-dark">등록</button>
        </div>
    </div>
</div>
</body>
</html>
