package com.tour.user.option;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tour.work.dao.DAO;

public class Search {
	private Connection conn = null;
	private DAO dao = new DAO();
	private boolean flag = false;
	public boolean detectName(String text){
		try{
			conn = dao.getConn();
			String sql = "SELECT Words FROM Images WHERE Words = ?";
			PreparedStatement state = conn.prepareStatement(sql);
			state.setString(1, text);
			ResultSet rs = state.executeQuery();
			while(rs.next()){
				flag = true;
			}
			rs.close();
			state.close();
			conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return flag;
	}
}
