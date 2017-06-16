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
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%
    String score = request.getParameter("H");
%>
<div style="text-align: center">
    <form action="operate.jsp" method="post" name="form" onsubmit="return yanzheng()">
        <input type="hidden" name="score" value="<%=score%>">
        <fieldset>
            <legend style="text-align: center;" >上传分数</legend>
            <label>昵称:</label>
            <input type="text" placeholder="尊姓大名" name="user" style="width: 300px; height: 35px;">
            <label>分数:</label>
            <input type="text" placeholder="" value="<%=score%>" disabled style="width: 300px; height: 35px;">
            <span class="help-block">成绩不可修改</span>
            <button type="submit" class="btn" style="width: 80px; height: 35px;">上传</button>
        </fieldset>
    </form>
    <a href="index.jsp" class="help-block"> 返 回 游 戏</a>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script>
    function yanzheng() {
        var x = document.forms["form"]["user"].value;
        if (x == null || x == "") {
            alert("昵称不能为空！");
            return false;
        }
    }
</script>
</body>
</html>
