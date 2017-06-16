<%--
  Created by IntelliJ IDEA.
  User: Boss
  Date: 2017/6/16
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="up" tagdir="/WEB-INF/tags" %>
<html>
<head>
</head>
<body>
    <%
        String name = request.getParameter("user");
        String score = request.getParameter("score");

        if (name == null)
            name = "";
        if (score == null)
            score = "";
    %>
    <%
        if (name == ""|| score == "")
    %>
    <up:UpLoad name="<%=name%>" score="<%=score%>"/>
    <%

    %>
</body>
</html>
