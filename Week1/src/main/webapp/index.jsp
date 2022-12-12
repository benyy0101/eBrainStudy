<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel = "stylesheet" href = "css/bootstrap.css">
</head>
<body>

<div class ="container">
    <header>
        <h1 class = "display-4">자유 게시판 - 목록</h1>
    </header>
</div>

<div class = "container">
<%--검색창: 등록일, 카테고리, 검색어 순으로--%>
    <div class = "row">
        <div class = "col">
            <span>등록일</span>
            <input type = "date" id = "startDate ">
            <span> ~ </span>
            <input type = "date" id = "endDate ">

            <select>
                <option value = "Java">Java</option>
                <option value = "Javascript">Javascript</option>
                <option value = "Python">Python</option>
                <option value = "Database">Database</option>
            </select>

            <input type = "text" id = "keyword" maxlength="20" size = "20">
            <input type = "button" class = "btn btn-dark" id = "submit" value = "검색">
        </div>
    </div>
</div>

<div class = "container">
    <div class = "row">
        <h3>total posts: 512</h3>
    </div>
</div>

<div class = "container">
    <table class = "table table-striped" style = "text-align: center; border: 1px ">
        <thead>
            <tr>
                <th> 카테고리 </th>
                <th> 제목 </th>
                <th> 작성자 </th>
                <th> 조회수 </th>
                <th> 등록 일시 </th>
                <th> 수정 일시 </th>

            </tr>
        </thead>

        <tbody>
            <tr>
                <td>1</td>
                <td>1</td>
                <td>1</td>
                <td>1</td>
                <td>1</td>
                <td>1</td>
            </tr>
            <tr>
                <td>1</td>
                <td>1</td>
                <td>1</td>
                <td>1</td>
                <td>1</td>
                <td>1</td>
            </tr>
        </tbody>
    </table>
</div>

<div class = "container">
    <button type = "button" class = "btn btn-dark" id = "post" onclick = "location.href = 'writePost.jsp'">글쓰기</button>
</div>


</body>
</html>