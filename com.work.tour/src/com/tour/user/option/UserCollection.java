package com.tour.user.option;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.tour.vo.CollectionVO;

import com.tour.work.dao.DAO;

public class UserCollection {
	private List<CollectionVO> uc = new ArrayList<CollectionVO>();
	private Connection conn = null;
	//private CollectionVO collection = new CollectionVO();
	private DAO dao = new DAO();
	public List<CollectionVO> getColl(){
		try{
		conn = dao.getConn();
		String sql = "SELECT Username,Collection FROM Personal_Collection";
		PreparedStatement state = conn.prepareStatement(sql);
		ResultSet rs = state.executeQuery();
		while(rs.next()){
			CollectionVO collectionVO = new CollectionVO();
			String collection = rs.getString("Collection");
			String username = rs.getString("Username");
			collectionVO.setUsername(username);
			collectionVO.setCollection(collection);
			uc.add(collectionVO);
		}
		conn.close();
		rs.close();
		state.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		return uc;
	}
}
