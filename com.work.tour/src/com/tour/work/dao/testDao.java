package com.tour.work.dao;

import java.sql.Connection;

public class testDao {
	private static Connection conn = null;
	public static void main(String []args){
		DAO dao = new DAO();
		conn = dao.getConn();
		if(conn==null){
			System.out.println("Falure");
		}else
		{
			System.out.println("Success");
		}
	}
}
