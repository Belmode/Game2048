<%--
  Created by IntelliJ IDEA.
  User: Boss
  Date: 2017/6/15
  Time: 19:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>分数上传</title>
</head>
<body>

<%
    String score = request.getParameter("H");
%>
<table style="margin: 0 auto">
    <form action="operate.jsp" method="post">
        <tr>
            <td><input type="hidden" name="score" value="<%=score%>"></td>
        </tr>
        <tr>
            <td>用户名:</td>
            <td><input type="text" name="user"></td>
        </tr>
        <tr>
            <td>分数:</td>
            <td><input type="text" value="<%=score%>" disabled></td>
        </tr>
        <td>
        <td><input type="submit" name="submit1" value="确认上传"></td>
        </tr>
        <tr>
            <td><a href="index.jsp"> 返 回 游 戏</a></td>
        </tr>
    </form>
</table>

</body>
</html>
