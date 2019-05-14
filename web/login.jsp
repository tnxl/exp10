<%--
  Created by IntelliJ IDEA.
  User: lsy
  Date: 2019/5/7
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="op" class="JavaBean.OP" scope="page"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String name = request.getParameter("username");
    session.setAttribute("name",name);
    String pass = request.getParameter("password");
    boolean flag =false;
    if (name!=null&&pass!=null){
        flag = op.login(name,pass);
        if (flag){
            out.print("登录成功<br>");
            session.setAttribute("username",name);
            response.setHeader("refresh","2;URL=liuyan.jsp");
        }else {
            out.print("登录失败<br>");
            response.setHeader("refresh","2;URL=main.jsp");
        }
    }
%>
</body>
</html>
