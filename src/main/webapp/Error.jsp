<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<style>
    body{
        background-image: url('${pageContext.request.contextPath}/image/error_page.png');
        background-size: 100%;
        background-repeat: no-repeat;
    }
    #msg {
        margin-top: 50px;
        text-align: center;
        font-family: "Pretendard", sans-serif;
      }
</style>
<body>
<div id="msg"><h1>${message}</h1></div>
</body>
</html>