package test;

import java.sql.PreparedStatement;


import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.tour.work.dao.DAO_mysql;

public class test_mysql {
	private static DAO_mysql mse = new DAO_mysql();
	private static Connection conn = null;
	public static void main(String []args){
		try{
			conn = (Connection) mse.getConn();
			String sql = "Select * From users";
			PreparedStatement state = conn.prepareStatement(sql);
			ResultSet rs = state.executeQuery();
			while(rs.next()){
				String username = rs.getString("username");
				String password = rs.getString("password");
				System.out.println(username);
				System.out.println(password);
			}
			rs.close();
			state.close();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				if(conn!=null){
					conn.close();
					conn=null;
				}
			}catch(SQLException ex){
				ex.printStackTrace();
			}
		}
	}
}
