<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Image Show</title>
        <br>
        <br>
        <div class="col-md-4">
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- The form -->

        <form action="" method="get">
        <div class="topnav">
  <a href="Register.jsp">Home</a>
  <a href="index.jsp">Image Form</a>
   <a  href="showdataimage">Show Image Data</a>
   <a href="First.jsp" class="split">Logout</a>
</div>
<br>
<br>
<br>
  <input type="text" placeholder="Search.." name="q">
  <button type="submit"><i class="fa fa-search"></i></button>
</form>
        </div>

        <br>
        <br>
        <br>
        <style>
        .topnav {
  background-color: #333;
  overflow: hidden;
}

/* Style the links inside the navigation bar */
.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 20px;
  text-decoration: none;
  font-size: 17px;
  margin:auto;
  
}

.topnav a.split {
  float: right;
  background-color:black;
  color: white;
}
/* Change the color of links on hover */
.topnav a:hover {
  background-color:red;
  color: black;
}

/* Add a color to the active/current link */
.topnav a.active {
  background-color: #04AA6D;
  color: white;
}
        
        * {
  box-sizing: border-box;
}

/* Style the search field */
form.example input[type=text] {
  padding: 10px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 80%;
  background: #f1f1f1;
}

/* Style the submit button */
form.example button {
  float: left;
  width: 20%;
  padding: 10px;
  background: #2196F3;
  color: white;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none; /* Prevent double borders */
  cursor: pointer;
}

form.example button:hover {
  background: #0b7dda;
}

/* Clear floats */
form.example::after {
  content: "";
  clear: both;
  display: table;
}
body{
background-image: url('https://images.template.net/wp-content/uploads/2014/11/business-backgrounds.jpg?width=480');
background-attachment:fixed;
background-size:cover;
background-position: center center;
}
        </style>
        
     	
    </head>
   <body class="container-fluid">
      <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/am", "root", "Durgadevi@b27");
                Statement st = con.createStatement();
                String sql = "SELECT * FROM image_table";
                ResultSet rs = st.executeQuery(sql);
                String query = request.getParameter("q");
                String data;
                if(query!=null){
                	data = "select * from image_table where id like '%"+query+"%' or category like '%"+query+"%'";
                } else{
                	data = "select * from image_table order by id desc";
                }
               rs = st.executeQuery(data);
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String category = rs.getString("category");
                    String firstname = rs.getString("firstname");
                    String lastname = rs.getString("lastname");
                    String filename = rs.getString("filename");
                   
        %>
        
        <table style="width:100%" border="2">
            <tr>
                <th>Id</th>
                <th>Category</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Image</th>
               
            </tr>
            <tr>
                <td><%=id%></td>
                 <td><%=category%></td>
                <td><%=firstname%></td>
                <td><%=lastname%></td>
                <td><image src="<%=filename%>" width="150" height="200"/></td>
                
            </tr>
        </table>
        <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
       
    </body>
</html>