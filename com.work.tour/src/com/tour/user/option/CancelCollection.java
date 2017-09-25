package com.tour.user.option;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.tour.work.dao.DAO;

public class CancelCollection {
	private DAO dao = new DAO();
	private Connection conn = null;
	private boolean flag = false;
	public boolean deleteCollection(String username,String words){
		try{
			conn = dao.getConn();
			String sql = "DELETE FROM Personal_Collection WHERE Username = ? AND Collection = ?";
			PreparedStatement state = conn.prepareStatement(sql);
			state.setString(1, username);
			state.setString(2, words);
			state.executeUpdate();
			flag = true;
			state.close();
			conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return flag;
	}
}
