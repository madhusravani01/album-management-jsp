package com.businesslogic;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.businesslogic.connection.UserConnection;

@WebServlet("/edits")
public class EditImageRecordServlet extends HttpServlet {
	Connection connect=null;
	Statement stmt=null;
	ResultSet rs=null;
	private final static String QU = "update image_table set category=?,firstname=?,lastname=?,filename=? where id=?";
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//get PrintWriter
		PrintWriter pw = res.getWriter();
		//set content type
		res.setContentType("text/html");
		//link the bootstrap
		pw.println("<link rel='stylesheet' href='css/bootstrap.css'></link>");
		//get the values
		int id = Integer.parseInt(req.getParameter("id"));
		String category = req.getParameter("category");
		String firstname = req.getParameter("firstname");
		String lastname = req.getParameter("lastname");
		String filename = req.getParameter("filename");
		//load the JDBC driver

		//generate the connection
		try{
			connect=UserConnection.getConnection();
			PreparedStatement ps = connect.prepareStatement(QU);
			//set the values
			
			ps.setString(1, category);
			ps.setString(2, firstname);
			ps.setString(3, lastname);
			ps.setString(4, filename);
			ps.setInt(5, id);
			
			//execute the query
			int count = ps.executeUpdate();
			pw.println("<div class='card' style='margin:auto;width:300px;margin-top:100px'>");
			if(count==1) {
				pw.println("<h2 class='bg-danger text-light text-center'>Image Edited Successfully</h2>");
			}else {
				pw.println("<h2 class='bg-danger text-light text-center'>Image Not Edited</h2>");
			}
		}catch(SQLException se) {
			pw.println("<h2 class='bg-danger text-light text-center'>"+se.getMessage()+"</h2>");
			se.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}
		pw.println("<a href='Register.jsp'><button class='btn btn-outline-success'>Home</button></a>");
		pw.println("&nbsp; &nbsp;");
		pw.println("<a href='showdataimage'><button class='btn btn-outline-success'>Show Image</button></a>");
		pw.println("</div>");
		//close the stram
		pw.close();
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req,res);
	}
}

