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
background-image: url('https://img.freepik.com/premium-photo/office-workplace-with-keypad-glasses_23-2147833237.jpg?w=2000');
background-attachment:fixed;
background-size:cover;
background-position: center center;
}
</style>
</head>
<body class="container-fluid">
<ul>
  <li style="float:right"><a class="active" href="First.jsp">Login</a></li>
  <li style="float:middle"><a class="active" >Album Management</a></li>
</ul>
    <marquee><h2 class="text-primary">Register Here!!!</h2></marquee>
	<form action="register" method="post" class="form card" id="frm">
		<h2 class="bg-danger text-white card-header" style="text-align:center">Registration Form</h2>
		<th><table class="table table-hover"></th>
		<tr>
		 <td>Name</td>
		 <td><input type="text" name="userName" required></td>
		</tr>
		<tr>
		 <td>Email</td>
		 <td><input type="email" name="email" required></td>
		</tr>
		<tr>
		 <td>Password</td>
		 <td><input type="password" name="password" required></td>
		</tr>
		<tr>
		 <td>Mobile</td>
		 <td><input type="text" name="mobile" required></td>
		</tr>
		<tr>
		<tr>
		 <td>City</td>
		 <td><select name="city">
		 	<option value="pune">Chennai</option>
		    <option value="pune">Pune</option>
		    <option value="Mumbai">Mumbai</option>
		    <option value="Delhi">Delhi</option>
		    <option value="Hydrabad">Hyderabad</option>
		 </select></td>
		</tr>
		<tr>
		<td>Gender</td>
		<td><input type="radio" name="gender" value="male">Male &nbsp;
		    <input type="radio" name="gender" value="female">Female
		</td>
		</tr>
		<tr>
		<td><button type="submit" class="btn btn-outline-success">Register</button></td>
		<td><button type="reset" class="btn btn-outline-danger">cancel</button></td>
		<td>Have an account?<a href="First.jsp">Login</a></td>
		</tr>
		</table>
	</form>
</body>
</html>