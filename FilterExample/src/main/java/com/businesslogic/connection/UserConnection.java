package com.businesslogic.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class UserConnection {
		private UserConnection() {
		    throw new IllegalStateException("Utility class");
		  }
	public static Connection getConnection() {
		Connection connect=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			
			
		connect=DriverManager.getConnection("jdbc:mysql://localhost:3306/am","root","Durgadevi@b27");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return connect;
		
	}
}
