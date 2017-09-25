package com.tour.user.option;

import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.SQLException;
import com.tour.work.dao.DAO;

public class Collection {
	private boolean flag = false;
	private boolean cnt = false;
	public boolean gainCollection(String username,String words){
		try{
			DAO dao = new DAO();
			Connection conn = (Connection) dao.getConn();
			String sql = "INSERT INTO Personal_Collection values(?,?)";
			PreparedStatement state = conn.prepareStatement(sql);
			state.setString(1, username);
			state.setString(2, words);
			state.executeUpdate();
			flag=true;
			state.close();
			conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return flag;
	}
	public boolean updateCollection(String words){
		try{
			DAO dao = new DAO();
			Connection conn = (Connection )dao.getConn();
			String sql = "Update Images set Collection_deny = 'true' where Words='"+words+"'";
			PreparedStatement state = conn.prepareStatement(sql);
			state.executeUpdate();
			cnt = true;
			state.close();
			conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return cnt;
	}
}
