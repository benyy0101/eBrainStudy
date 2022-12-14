<%@ page import="board.PostDAO" %>
<%@ page import="board.Post" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: benyy
  Date: 2022-12-14
  Time: 오후 4:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel = "stylesheet" href = "css/bootstrap.css">
    <style type = "text/css">
      a, a type{
        color: black;
        text-decoration: none;
      }
      .table-hover tbody tr{
        cursor:pointer
      }
    </style>
  </head>
  <body>
  <%
    int pageNum = 1;

    if (request.getParameter("pageNum") != null){
      pageNum = Integer.parseInt(request.getParameter("pageNum"));
    }
//    String startDate = request.getParameter("startDate");
//    String endDate = request.getParameter("endDate");
    String category = request.getParameter("category");
    String keyword = request.getParameter("keyword");
    PostDAO postDAO = new PostDAO();
    ArrayList<Post> list = postDAO.getSearchList(pageNum,category,keyword);
//    System.out.println(request.getParameter("endDate"));
//    System.out.println("startDate"+request.getParameter("startDate")+"ds");
    System.out.println(request.getParameter("category"));
    int listSize = list.size();
  %>
  <header>
    <nav class="navbar navbar-light bg-light">
      <a class="navbar-brand mb-0 h1" href="index.jsp">자유 게시판 - 검색결과</a>
    </nav>
    <h1 class = "display-4"></h1>
  </header>

  <div class ="container">
  </div>

  <form method = "post" action = "searchPost.jsp">
    <div class = "container">
      <table>
        <tbody>
        <tr>
<%--          <td>등록일</td>--%>
<%--          <td><input type = "date" name = "startDate" class = "form-control" ></td>--%>
<%--          <td>~</td>--%>
<%--          <td><input type = "date" name = "endDate" class = "form-control" ></td>--%>
          <td>
            <select class = "form-control" name = "category">
              <option value = "all" selected>전체</option>
              <option value = "Java">Java</option>
              <option value = "Javascript">Javascript</option>
              <option value = "Python">Python</option>
              <option value = "Database">Database</option>
            </select>
          </td>
          <td>
            <input type = "text" name = "keyword" maxlength="20" size = "20" class = "form-control">
          </td>
          <td>
            <input type = "submit" class = "col btn btn-dark form-control" value = "검색">
          </td>
        </tr>
        </tbody>
      </table>
    </div>

  </form>
  <%--총 게시글--%>
  <div class = "container">
    <div class = "row">
      <h3>total posts: <%=listSize%></h3>
    </div>
  </div>

  <%--게시글 목록--%>
  <div class = "container">
    <table class = "table table-hover" style = "text-align: center; border: 1px ">
      <thead>
      <tr class = "text-light bg-dark">
        <th> 카테고리 </th>
        <th> 제목 </th>
        <th> 작성자 </th>
        <th> 조회수 </th>
        <th> 등록 일시 </th>
        <th> 수정 일시 </th>

      </tr>
      </thead>

      <tbody>
      <%
        for(int i = 0; i < list.size(); i++) {
      %><tr onclick = "location.href = 'viewPost.jsp?postId=<%=list.get(i).getPostId()%>'">
        <td><%= list.get(i).getCategory()%></td>
        <td width="50%"><%= list.get(i).getTitle()%></td>
        <td><%= list.get(i).getCreator()%></td>
        <td><%= list.get(i).getViews()%></td>
        <td><%= list.get(i).getCreatedDate()%></td>
        <td><%= list.get(i).getEditedDate()%></td>
      </tr>
      <%  }
      %>

      </tbody>
    </table>

    <%-- Pagination   --%>
    <div class = "d-flex justify-content-center">
      <%
        if(pageNum == 1){%>
      <button disabled type = "button" class = "btn btn-dark">Previous</button>
      <%
      }else{
      %>
      <button type = "button" class = "btn btn-dark" onclick = "location.href = 'index.jsp?pageNum=<%=pageNum-1%>'">Previous</button>
      <%
        }
      %>
      <%
        int lastPage = (int)Math.ceil((double)listSize/ 10);
        for ( int i = 1; i <= lastPage ; i++){

      %><button type = "button" class = "btn" onclick="location.href = 'searchPost.jsp?pageNum=<%=i%>'"><%=i%></button>
      <%
        }
      %>
      <%
        if(pageNum == lastPage){%>
      <button disabled type = "button" class = "btn btn-dark">Next</button>
      <%
      }else{
      %>
      <button type = "button" class = "btn btn-dark" onclick="location.href = 'index.jsp?pageNum=<%=pageNum+1%>'">Next</button>
      <%
        }
      %>

    </div>

  </div>

  <div class = "container">
    <button type = "button" class = "btn btn-dark" id = "post" onclick = "location.href = 'writePost.jsp'">글쓰기</button>
  </div>
  </body>
</html>
