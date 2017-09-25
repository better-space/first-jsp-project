package com.tour.user.option;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tour.work.dao.DAO;

public class inputOpt implements rigisterInterface{
	private boolean flag=false;
	private Connection conn = null;
	
	private int num = 0;
	public boolean userInputDatabase(String username,String password){
		DAO dao = new DAO();
		try{
			conn = dao.getConn();
			String sql = "INSERT INTO Users_work(Username,Password) VALUES (?,?)";
			PreparedStatement state = conn.prepareStatement(sql);
			state.setString(1, username);
			state.setString(2, password);
			state.executeUpdate();
			flag = true;
			state.close();
			conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return flag;
	}
	public int userNum(String username){
		try{
			DAO dao = new DAO();
			conn = dao.getConn();
			String sql = "SELECT * FROM Users_work WHERE Username=?";
			
			PreparedStatement state = conn.prepareStatement(sql);
			
			state.setString(1, username);
			ResultSet rs = state.executeQuery();
			if(rs.next()){
				num = 1;
			}
			state.close();
			conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return num;
	}
}
