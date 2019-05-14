<%@ page import="java.util.ArrayList" %>
<%@ page import="JavaBean.LyBean" %><%--
  Created by IntelliJ IDEA.
  User: lsy
  Date: 2019/5/7
  Time: 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="liuyan" class="JavaBean.LyBean" scope="page"/>
<jsp:useBean id="op" class="JavaBean.OP" scope="page"/>
<html>
<head>
    <title>留言板</title>
    <style>
        table{
            margin: 0 auto;
            text-align: center;
        }
    </style>
</head>
<body>
<%
    String name = (String)session.getAttribute("username");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    //添加留言
    int n = op.liuyan(name,content,title);
    if (n!=0){
        ArrayList<LyBean> al = op.showly();
        out.print("<table border=\"2px\">");
        out.print("<tr><th colspan=\"5\">留言板</th></tr>");
        out.print("<tr>");
        out.print("<td>留言编号</td>");
        out.print("<td>留言姓名</td>");
        out.print("<td>留言标题</td>");
        out.print("<td>留言内容</td>");
        out.print("<td>留言日期</td>");
        out.print("</tr>");
        LyBean ly;
        for (int i=0;i<al.size();i++){
            out.print("<tr>");
            ly = al.get(i);
            out.print("<td>"+ly.getId()+"</td>");
            out.print("<td>"+ly.getName()+"</td>");
            out.print("<td>"+ly.getTitle()+"</td>");
            out.print("<td>"+ly.getInfo()+"</td>");
            out.print("<td>"+ly.getDate()+"</td>");
            out.print("</tr>");
        }
        out.print("</table>");
    }else{
        out.print("留言失败");
    }

%>

<a href="liuyan.jsp">添加留言</a>
</body>
</html>
