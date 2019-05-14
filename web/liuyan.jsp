<%--
  Created by IntelliJ IDEA.
  User: lsy
  Date: 2019/5/7
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>留言</title>
    <style>
        body{
            margin: 0 auto;
            text-align: center;
        }
    </style>
</head>
<body>
留言板
<%
    if (session.getAttribute("name")==null){
        out.print("<script>alert('您还未登录');" +
                "window.location.href='main.jsp'" +
                "</script>");

    }
%>
<form action="liuyanban.jsp">
    <%--用户名：<input type="text" name="username"><br>--%>
    留言标题：<input type="text" name="title"><br>
    留言内容：<input type="text" name="content"><br>
    <input type="submit" name="提交留言">
</form>
</body>
</html>
