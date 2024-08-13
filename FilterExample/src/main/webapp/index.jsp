<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Random"%>
<!DOCTYPE html>
<html>
   <head>
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
  color:white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

/* Change the link color to #111 (black) on hover */
li a:hover {
  background-color:white;
}
.active {
  background-color: red;
}
body{
background-image: url('https://images.pexels.com/photos/8155/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
background-attachment:fixed;
background-size:cover;
background-position: center center;
}
</style>
</head>
    <body>
    <ul>

  <li style="float:left"><a class="active" href="viewAll.jsp">View All</a></li>	
  <li style="float:right"><a class="active" href="First.jsp">Logout</a></li>
</ul>
        <form action="FileUploadServlet" method="post" enctype="multipart/form-data" class="form card" id="frm">
        <h2 class="bg-danger text-white card-header" style="text-align:center";>Image Form</h2>
            <th><table class="table table-hover"></th>
                <tr>
                    <td align="center" colspan="2">Form Details</td>
                </tr>
                <tr>
                    <td>Id </td>
                    <td><input type="number" name="id" /></td>
                </tr>
                <tr>
                    <td>Category </td>
                    <td><input type="text" name="category" /></td>
                </tr>
                <tr>
                    <td>First Name </td>
                    <td>
                        <input type="text" name="firstname">
                    </td>
                </tr>
                <tr>
                    <td>Last Name </td>
                    <td>
                        <input type="text" name="lastname">
                    </td>
                </tr>
                <tr>
                    <td>Image Link: </td>
                    <td>
                        <input type="file" name="file">
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><button type="submit" class="btn btn-outline-success">Submit</button></td>
                </tr>
            </table>

        </form><br>
   
</body>
</html>