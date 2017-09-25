/**
package com.tour.work.dao;


import java.sql.Connection;
import java.sql.DriverManager;
public class DAO {
	private Connection conn = null;
	public Connection getConn(){
		try {
			Class.forName("com.hxtt.sql.access.AccessDriver");
			String url = "jdbc:Access:/d:/Database/Database1.mdb";
		conn = DriverManager.getConnection(url,"","");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
**/
//连接mysql

package com.tour.work.dao;

import java.sql.Connection;

import java.sql.DriverManager;

public class DAO {
	private Connection conn = null;
	public Connection getConn(){
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/com.tour.work?useUnicode=true&characterEncoding=utf-8&useSSL=false";
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




