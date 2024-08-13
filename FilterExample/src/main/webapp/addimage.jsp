<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
     margin-top:100px;
   
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
background-image: url('https://media.istockphoto.com/photos/modern-office-desk-background-top-view-with-copy-space-picture-id1133856693?b=1&k=20&m=1133856693&s=170667a&w=0&h=_7xjXLQMZNuqwTnXnJZaBmYX3z3QNZ8opUcf0sLAG5M=');
background-attachment:fixed;
background-size:cover;
background-position: center center;
}
</style>
</head>
<body class="container-fluid">
<ul>
  <li><a href="showalbum">Show Album</a></li>
   <li><a href="displayimage.jsp">Display Images</a></li>
  <li style="float:right"><a class="active" href="First.jsp">Logout</a></li>
</ul>
<br>
<br>
<br>
<br>
<form action="AddImage" method="post" enctype="multipart/form-data" style="text-align:center";>
   Select Image :
   <input type="file" name="image">
   <input type="submit" value="Add Image">
</form>
</div>

</body>
</html>