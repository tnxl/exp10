<%--
  Created by IntelliJ IDEA.
  User: lsy
  Date: 2019/5/7
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="op" class="JavaBean.OP" scope="page"/>
<html>
<head>
    <title>注册</title>
</head>
<body>
<%
    String name = request.getParameter("username");
    String pass = request.getParameter("password");
    String age1 = request.getParameter("age");
    int age = Integer.parseInt(age1);
    String email = request.getParameter("email");

    int n = op.register(name,pass,age,email);
    if (n!=0){
        out.print("注册成功");
        response.setHeader("refresh","2;URL=main.jsp");
    }else {
        out.print("注册失败");
        response.setHeader("refresh","2;URL=main.jsp");
    }
%>
</body>
</html>
