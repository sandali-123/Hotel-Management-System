package com.Sewwandi.Model;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;

import com.Sewwandi.Bean.EmpBean;
import com.Sewwandi.Bean.empLeaveBean;

import com.Sewwandi.Util.SewwandiDB;




public class leaveDB {

	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stat = null;
	private static ResultSet rs = null;

	public static List<empLeaveBean> check(String id, String date) {

		// to store the all the values and return the single array
		ArrayList<empLeaveBean> list = new ArrayList<>();

		// validate
		try {

			con = SewwandiDB.getcon();
			// call to SewwandiDB class and get that method
			stat = con.createStatement();

			String sql = "select * from sewwandi.leave where EmpID ='" + id + "' and date ='" + date + "'";
			rs = stat.executeQuery(sql);

			if (rs.next()) {
				String leaveID = rs.getString(1);
				String Ename = rs.getString(2);
				String empId = rs.getString(3);
				String desi = rs.getString(4);
				String type = rs.getString(5);
				String ldate = rs.getString(6);
				String dis = rs.getString(7);

				empLeaveBean cP = new empLeaveBean(leaveID,Ename, empId, desi, ldate, type, dis);

				list.add(cP);
			} else {
				System.out.println("the name , date is worng");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// return the list array object
		return list;
	}

	public static boolean insertleave(String name, String ID, String desig, String date, String type,
			String description) {

		boolean isSuccess = false;

		try {
			SewwandiDB db = new SewwandiDB();
			Connection con = db.getcon();
			stat = con.createStatement();

			String sql = "insert into sewwandi.leave values(0,'" + name + "','" + ID + "','" + desig + "','" + type
					+ "','" + date + "','" + description + "')";
			int rs = stat.executeUpdate(sql);// execute insert method return integer value (1,0)

			// check the query is success or not
			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;

	}

	// update
	public static boolean Updateleave(String leaveID,String name, String ID, String desig, String date, String type,String description) {

		try {

			SewwandiDB db = new SewwandiDB();
			Connection con = db.getcon();
			stat = con.createStatement();

			String sql = "update sewwandi.leave set EmpID='" + ID + "',designationl='" + desig+ "',type='" + type+ "',date='" + date + "',description='" + description+"'"+
					 "where leaveID ='"+leaveID+"'";
			

			int rs = stat.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;

	}
	//retrive
			public static List<empLeaveBean> getLeaveDetails(String Id){
				
				//convert into int
				//int convertedID = Integer.parseInt(Id);
				
				//making list to pass details 
				ArrayList<empLeaveBean> list = new ArrayList<>();
				
				try {
					
					SewwandiDB db = new SewwandiDB();
					Connection con = db.getcon();
					stat=con.createStatement();
					String sql="select * from sewwandi.leave where leaveID ='"+Id+"'";
					rs = stat.executeQuery(sql);
					
					//if next method return true store value
					while (rs.next()){
						
						String leaveID = rs.getString(1);
						String Ename = rs.getString(2);
						String empId = rs.getString(3);
						String desi = rs.getString(4);
						String type = rs.getString(5);
						String ldate = rs.getString(6);
						String dis = rs.getString(7);
					
						empLeaveBean cP = new empLeaveBean(leaveID,Ename, empId, desi, ldate, type, dis);
						list.add(cP);
					}
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				
				return list;
			}
			//to leave apply form get the employee data
			public static List<EmpBean> getDataToForm(String ID) {

				// to store the all the values and return the single array
				ArrayList<EmpBean> list = new ArrayList<>();

				// validate
				try {
					
					int id = Integer.parseInt(ID);

					SewwandiDB db = new SewwandiDB();
					Connection con = db.getcon();// call to SewwandiDB class and get that method
					stat = con.createStatement();

					String sql = "select * from sewwandi.per_employee where employeeId ='" + id +  "'";
					rs = stat.executeQuery(sql);

					if (rs.next()) {
						String empID = rs.getString(1);
						String fname = rs.getString(2);
						String lname = rs.getString(3);
						String birthday = rs.getString(4);
						String gender = rs.getString(5);
						String phoneNum = rs.getString(6);
						String email = rs.getString(7);
						String address = rs.getString(8);
						String section = rs.getString(9);
						String desi = rs.getString(10);
						String basicSal = rs.getString(11);
						
						EmpBean cP = new EmpBean(empID,fname,lname,birthday,gender,phoneNum,email,address,section,desi,basicSal);

						list.add(cP);
					} else {
						System.out.println(" employee ID is worng");
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				// return the list array object
				return list;
			}

	//checkTheNoOfLeave
	public static List<empLeaveBean> checkTheNoOfLeave(String id , String date) {
	
		// to store the all the values and return the single array
		ArrayList<empLeaveBean> list = new ArrayList<>();
	
		// validate
		try {
	
			SewwandiDB db = new SewwandiDB();
			Connection con = db.getcon();// call to SewwandiDB class and get that method
			stat = con.createStatement();
	
			String sql = "SELECT count(leaveID) count  FROM sewwandi.leave where date LIKE '2020-09-%'  and EmpID = 'c5'";
			rs = stat.executeQuery(sql);
	
			if (rs.next()) {
				String leaveID = rs.getString(1);
				String Ename = rs.getString(2);
				String empId = rs.getString(3);
				String desi = rs.getString(4);
				String type = rs.getString(5);
				String ldate = rs.getString(6);
				String dis = rs.getString(7);
	
				empLeaveBean cP = new empLeaveBean(leaveID,Ename, empId, desi, ldate, type, dis);
	
				list.add(cP);
			} else {
				System.out.println("the name , date is worng");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// return the list array object
		return list;
	}
}