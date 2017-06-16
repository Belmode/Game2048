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
</head>
<body>
<a href="index.jsp">返回游戏</a>
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
        pre = con.prepareStatement("SELECT * FROM score ORDER BY grade");//查询表中总分
        rs = pre.executeQuery();
        out.print("<table style=\"margin:0 auto;\">");
        int i = 1;
        out.print("<tr><td>排名</td><td>昵称</td><td>分数</td></tr>");
        while (rs.next()) {
            out.print("<tr>");
            out.print("<td>"+i++ +"<td>");
            out.print("<td>"+rs.getString(2)+"</td>");
            out.print("<td>"+rs.getString(3)+"</td>");
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
</body>
</html>

