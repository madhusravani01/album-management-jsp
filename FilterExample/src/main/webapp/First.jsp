<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
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
background-image: url('https://img.freepik.com/free-photo/workspace-with-smartphone-mug-keypad_23-2147833248.jpg?w=2000');
background-attachment:fixed;
background-size:cover;
background-position: center center;
}
</style>
</head>
<body class="container-fluid">
<br>
<br>
<ul>
  <li style="float:middle"><a class="active" >Album Management</a></li>
</ul>
<marquee><h2 class="text-primary">Login Here!!!</h2></marquee>
  <form action="LoginChecker" method="post" class="form card" id="frm">
   <h2 class="bg-danger text-white card-header" style="text-align:center";>Login Form</h2>
   <table class="table table-hover">
    <tr>
     <td>UserName</td>
     <td><input type="text" name="username" required/></td>
    </tr>
    <tr>
     <td>Password</td>
     <td><input type="password" name="password"  required/></td>
    </tr>
    <tr>
   <td><input type="submit" value="Submit" /></td><td>Don't have an account? <a href="Register.jsp">Register Here</a></td>
   </tr>
   </table>
  </form>
 </div>
</body>
</html>




