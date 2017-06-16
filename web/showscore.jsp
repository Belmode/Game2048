<%--
  Created by IntelliJ IDEA.
  User: Boss
  Date: 2017/6/15
  Time: 9:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>分数上传</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<a href="index.jsp" class="label label-info">返回游戏</a>
<%
    String uri = "jdbc:mysql://localhost:3306/mywork";
    String user = "root";
    String password = "root";
    Connection con;
    PreparedStatement pre;
    ResultSet rs;

    try {

        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(uri, user, password);
        pre = con.prepareStatement("SELECT * FROM score ORDER BY grade DESC ");//查询表中总分
        rs = pre.executeQuery();
        out.print("<table class='table table-bordered table-hover table-condensed'>");
        int i = 1;
        out.print("<tr class='waring'><th  style='text-align: center;' >排 名</th><th  style='text-align: center;'>昵 称</th><th  style='text-align: center;'>分 数</th></tr>");
        while (rs.next()) {
            out.print("<tr class='success'>");
            out.print("<td  style='text-align: center;'>" + i++ + "</td>");
            out.print("<td  style='text-align: center;'>" + rs.getString(2) + "</td>");
            out.print("<td  style='text-align: center;'>" + rs.getString(3) + "</td>");
            out.print("</tr>");
        }
        out.print("</table>");
    } catch (ClassNotFoundException e) {
        out.print(e);
        out.print("无法加载驱动异常");
    } catch (SQLException e) {
        out.print(e);
        out.print("SQL语句执行异常");
    } catch (Exception e) {
        out.print(e);
    }
%>

<nav aria-label="...">
    <ul class="pager ">
        <li><a href="#">上一页</a></li>
        <li><a href="#">下一页</a></li>
    </ul>
</nav>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>

