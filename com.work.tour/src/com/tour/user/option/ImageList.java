package com.tour.user.option;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.tour.vo.Image;
import com.tour.work.dao.DAO;

public class ImageList {
	private Connection conn = null;
	private ArrayList<Image> imagelist = new ArrayList<Image>();
	private DAO dao = new DAO();

	public ArrayList<Image> getImageList() {
		try {
			conn = dao.getConn();
			Statement stat = conn.createStatement();
			String sql = "SELECT * FROM Images";
			ResultSet rs = stat.executeQuery(sql);
			while (rs.next()) {
				Image image = new Image();
				image.setUrl(rs.getString("URL"));
				image.setWords(rs.getString("Words"));
				imagelist.add(image);
			}
			rs.close();
			stat.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		return imagelist;
	}
}
