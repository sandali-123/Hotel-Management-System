package com.Sewwandi.Model;


import java.sql.Connection;

import java.sql.SQLException;
import java.sql.Statement;

import com.Sewwandi.Bean.AddMenuBean;
import com.Sewwandi.Bean.AddRoomBean;
import com.Sewwandi.Util.SewwandiDB; 

public class AddMenuDB {

	String e1 = null;
	public AddMenuDB() {
		// TODO Auto-generated constructor stub
	}
	public String addMenu(AddMenuBean AddMenuBean) {//add
		

		SewwandiDB db = new SewwandiDB();
		Connection con = db.getcon();
		
		try {
			Statement stmt = con.createStatement();
			stmt.executeUpdate("INSERT INTO menu(menuId,menuDescription,menuPrice,menuImage)VALUE ('"+AddMenuBean.getMenuId()+"','"+AddMenuBean.getMenuDescription()+"','"+AddMenuBean.getMenuPrice()+"', '"+AddMenuBean.getMenuImage()+"')");
			e1 = "call inserted";
		} catch (SQLException e) {
			 
			e.printStackTrace();
		}
		return e1;
		
	}
	//Update
	String s2 = null;
	public String updateMenu(AddMenuBean AddMenuBean) {
		SewwandiDB db = new SewwandiDB();
		Connection con = db.getcon();
	
		
		try {																																																																																																							
			Statement stmt = con.createStatement();			
			stmt.executeUpdate("UPDATE  menu SET menuId = '"+AddMenuBean.getMenuId()+"',menuDescription = '"+AddMenuBean.getMenuDescription()+"',menuPrice = '"+AddMenuBean.getMenuPrice()+"',menuImage = '"+AddMenuBean.getMenuImage()+"' WHERE menuId = '"+AddMenuBean.getMenuId()+"' ");
			s2 = "data Updated ";
			
			if (con != null) {
				con.close();
			}
			 
		} catch (SQLException e) {
			 
			e.printStackTrace();
		}
		return s2;
	}
	
	  // delete
	  
	   String s6 = null; 
	   
	   public String DeleteMenu(AddMenuBean AddMenuBean) { 
		   
		   SewwandiDB db = new SewwandiDB();
		   Connection con = db.getcon();
		   String idd = AddMenuBean.getMenuId();
	  
	  try { Statement stmt = con.createStatement();
	  stmt.executeUpdate("DELETE  FROM menu  WHERE menuId ='"+AddMenuBean.getMenuId()+"' ");
	  s6 = "data deleted ";
	  
	  if (con != null) {
		  con.close();
		  }
	  
	  } catch (SQLException e) {
	  
	  e.printStackTrace(); 
	  
	  } return s6; }//end
	 
}
