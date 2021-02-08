package com.Sewwandi.Util;
import java.sql.DriverManager;


import java.sql.SQLException;
import java.sql.Connection; 

public class SewwandiDB {

	private static Connection con ; 
	
	public  static Connection getcon() {
		
	try {
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sewwandi","root","");
			
		} catch (ClassNotFoundException e) {
			
			 e.printStackTrace();
			 
		}catch (SQLException e) {	
			
			 e.printStackTrace();
		}
		
	return con;
		
	}



}
