<%--
  Created by IntelliJ IDEA.
  User: benyy
  Date: 2022-12-13
  Time: 오후 1:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "file.FileDAO"%>
<%@ page import = "java.io.File"%>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import = "com.oreilly.servlet.MultipartRequest"%>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String directory = application.getRealPath("/upload/");
    int maxSize = 1024 * 1024 * 100;
    String encoding = "UTF-8";

    MultipartRequest mp = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
    String fileName = mp.getOriginalFileName("file");
    String fileRealName = mp.getFilesystemName("file");
    new FileDAO().upload(fileName, fileRealName);


%>

</body>
</html>
