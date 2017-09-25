package com.tour.work.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO_mysql {
	private Connection conn = null;
	public Connection getConn(){
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/com.work.tour";
		String password = "suhe5059";
		String user = "root";
		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			if(conn!=null){
				System.out.println("成功连接mysql数据库");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return conn;
	}
}
