<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display Image</title>
</head>
<body>
<h1 style="color:red" align="center">DISPLAY IMAGE DETAIL</h1>

<div align="center">

<form action="DisplayServlet" method="post">
<label for="category">Choose a Category:</label>
  <select name="category" id="category">
    <option value="nature">Nature</option>
    <option value="animals">Animals</option>
    <option value="plants">Plants</option>
    <option value="downloads">downloads</option>
  </select>
  <br><br>
   Enter Image Id :
   <input type="number" name="imageId">
   <input type="submit" value="Display Image">
</form>

</div>

<hr>

<%
    String imgFileName=(String)request.getAttribute("img");
    String imgId=(String)request.getAttribute("id");
    System.out.println(imgFileName);
%>

<div align="center">
     <table border="5px" style="width:600px">
          <tr>
              <th>Image Id </th>
              <th>Image</th>
          </tr>
         
         <%
             if(imgFileName!="" && imgId!="")
             {
         %>
          
          <tr>
              <td><%=imgId %></td>
              <td><img src="images/<%=imgFileName%>" style="width:300px;height:250px"></td>
              <td><a href='editurls?id="+rs.getInt(1)+"'>Edit</a></td>
              <td><a href='deleteurl?id="+rs.getInt(1)+"'>Delete</a></td>
          </tr>
        <%
             }
        %>  
     </table>
</div>

</body>
</html>