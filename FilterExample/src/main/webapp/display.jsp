<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css"></link>
<style>
  #frm{
     width:500px;
     margin:auto;
     margin-top:75px;
   
  }
  marquee{
     margin-top:10px;
  }
  ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

/* Change the link color to #111 (black) on hover */
li a:hover {
  background-color: white;
}
.active {
  background-color: red;
}
body{
background-image:;
background-attachment:fixed;
background-size:cover;
background-position: center center;
}
<marquee><h2 class="text-primary">Login Here!!!</h2></marquee>
</style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Image Show</title>
        <ul>
  <li style="float:right"><a class="active" href="First.jsp">Logout</a></li>
  <li style="float:middle"><a class="active" >Album Management</a></li>
  <li style="float:middle"><a class="active" href="viewAll.jsp">ViewAll</a></li>
</ul>
        <marquee><h2 class="text-primary">Image Inserted Successfully</h2></marquee>
    </head>
    <body>
        <%

            int imageid = Integer.parseInt(request.getParameter("id"));

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/am", "root", "Durgadevi@b27");
                Statement st = con.createStatement();
                String sql = "SELECT filename FROM image_table where id=" + imageid + "";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    String filename = rs.getString("filename");
        %>

        <table style="width:100%" border=1 "margin-left:auto; margin-right:auto;">
            <tr>
                <th>Id</th>
                <th>Image</th>

            </tr>
            <tr>
                <td><%=imageid%></td>
                <td><image src="<%=filename%>" width="200" height="200"/></td>
            </tr>
        </table>
        <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %><br>
</body>
</html>