package com.Sewwandi.Model;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import com.Sewwandi.Bean.User;

import com.Sewwandi.Util.SewwandiDB;

public class changePasswordService {

	private int userChange;
	
	public void changePassword(User user) throws ClassNotFoundException {
		
		Connection connection;
		PreparedStatement preparedStatement;
		String email=null;
		
		try {
			SewwandiDB db = new SewwandiDB();
			Connection con = db.getcon();
			
			//check email
			preparedStatement = con.prepareStatement("select * from users where username=? and password=?");
			preparedStatement.setString(1, user.getEmail());
			preparedStatement.setString(2, Base64.getEncoder().encodeToString(user.getPassword().getBytes()));
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next())
			{
				email = rs.getString(4);	
			}
			
			if(email!=null) {
				
				//update value
				preparedStatement = con.prepareStatement("UPDATE users SET password=? where username=?");
				preparedStatement.setString(1, Base64.getEncoder().encodeToString(user.getNewPassword().getBytes()));
				preparedStatement.setString(2, user.getEmail());
				preparedStatement.execute();
				preparedStatement.close();
				con.close();
				setUserChange(1);
				
			}else {
				setUserChange(0);
			}
		
		}catch (SQLException  e) {
			System.out.println(e.getMessage());
		}
	}
		
	
	public int getUserChange() {
		return userChange;
	}

	public void setUserChange(int userChange) {
		this.userChange = userChange;
	}

}

