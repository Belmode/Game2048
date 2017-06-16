<%@ tag pageEncoding="UTF-8" %>
<%@ tag import="java.sql.*" %>
<%@ attribute name="name" required="true" %><%--用户名--%>
<%@ attribute name="score" required="true" %><%--上传分数--%>
<%@ variable variable-class="java.lang.Boolean" name-given="result" scope="AT_END" %>

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
        pre = con.prepareStatement("SELECT * FROM score WHERE name =?");//查询表中总分
        pre.setString(1, name);//查询用户名
        rs = pre.executeQuery();
        if (rs.next()) {

            session.setAttribute("nowUser", name);
            session.setAttribute("nowScore", rs.getString(3));
            int id = rs.getInt(1);
            pre = con.prepareStatement("UPDATE score SET grade = ? WHERE id = ?");
            pre.setInt(1, Integer.parseInt(score));
            pre.setInt(2, id);//更新积分信息

        } else {

            pre = con.prepareStatement("INSERT INTO score(name,grade) VALUES (?,?)");
            //注意在数据库中，如果遇到自增长的字段（如id）应该指明插入语句的对应字段
            pre.setString(1, name);
            pre.setInt(2, Integer.parseInt(score));

            session.setAttribute("nowUser", name);
            session.setAttribute("nowScore", score);

            int flag = pre.executeUpdate();

            if (flag != 0) {
                response.sendRedirect("showscore.jsp");
            } else {
               response.sendRedirect("index.jsp");
            }

        }
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