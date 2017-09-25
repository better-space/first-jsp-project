package com.tour.user.option;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tour.work.dao.DAO;

public class loginOpt implements loginInterface {
	private DAO dao = new DAO();
	private boolean flag = false;
	private Connection conn = null;

	public boolean userLookupDatabase(String username, String password) {
		try {
			conn = dao.getConn();
			String sql = "SELECT * FROM Users_work WHERE Username=? AND Password=?";
			PreparedStatement state = conn.prepareStatement(sql);
			state.setString(1, username);
			state.setString(2, password);
			ResultSet rs = state.executeQuery();
			if(rs.next()){
				flag=true;
			}
			state.close();
			rs.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			
		}
		return flag;
	}
}
