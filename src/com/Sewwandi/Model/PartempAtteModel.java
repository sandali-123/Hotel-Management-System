package com.Sewwandi.Model;

import java.sql.Connection;

import java.sql.SQLException;
import java.sql.Statement;

import com.Sewwandi.Bean.AttenBean;
import com.Sewwandi.Bean.EmpBean;
import com.Sewwandi.Bean.PartEmpBean;
import com.Sewwandi.Bean.partEmpAttenBean;

import com.Sewwandi.Util.SewwandiDB;

public class PartempAtteModel {
	
String e1 = null;	
	
	public String insertEmp(partEmpAttenBean at) {
		
		SewwandiDB db = new SewwandiDB();
		Connection con = db.getcon();
		
		try {
			Statement stmt = con.createStatement();
			stmt.executeUpdate("INSERT INTO sewwandi.part_empattendance(date,employeeId,firstName, lastName,section, designation, status)VALUE ('"+at.getDate()+"','"+at.getEmployeeId()+"','"+at.getFirstName()+"','"+at.getLastName()+"',  '"+at.getSection()+"', '"+at.getDesignation()+"', '"+at.getStatus()+"' )");
			e1 = "call inserted";
		} catch (SQLException e) {
			 
			e.printStackTrace();
		}
		return e1;
	}
	
	
	//Update employee
		String s2 = null;
		public String updateEmp(partEmpAttenBean at) {
			SewwandiDB db = new SewwandiDB();
			Connection con = db.getcon();
			
			try {																																																																																																							
				Statement stmt = con.createStatement();			
				stmt.executeUpdate("UPDATE sewwandi.part_empattendance SET date = '"+at.getDate()+"',employeeId ='"+at.getEmployeeId()+"',firstName = '"+at.getFirstName()+"',lastName = '"+at.getLastName()+"',section ='"+at.getSection()+"',designation ='"+at.getDesignation()+"',status = '"+at.getStatus()+"' where AttendanceId = '"+at.getAttendanceId()+"' ");
				s2 = "data Updated ";
				
				if (con != null) {
					con.close();
				}
				 
			} catch (SQLException e) {
				 
				e.printStackTrace();
			}
			return s2;

}
		
		String s4 = null;
		public String DeleteEmp(partEmpAttenBean employeebean) {
			SewwandiDB db = new SewwandiDB();
			Connection con = db.getcon();
			
			try {
				Statement stmt = con.createStatement();			
				stmt.executeUpdate("DELETE  FROM sewwandi.part_empattendance WHERE AttendanceId ='"+employeebean.getAttendanceId()+"' ");
				s4 = "data deleted ";
				
				if (con != null) {
					con.close();
				}
				 
			} catch (SQLException e) {
				 
				e.printStackTrace();
			}
			return s4;
		}
}
