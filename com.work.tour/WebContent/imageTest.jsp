<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.ArrayList"%>
<%@ page import="com.tour.user.option.ImageList"%>
<%@ page import="com.tour.vo.Image"%>
<%@ page import="com.tour.work.dao.DAO"%>
<%@ page import="java.sql.*"%>
<!--
			<%ImageList res = new ImageList();
			ArrayList<Image> images = res.getImageList();%>
-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
	<table border="1" spacing="2">
		<%!public static final DAO dao = new DAO();
	public static final int PAGESIZE = 2;
	int curPage = 1;
	int pageCount;%>
		<%
			try {
				Connection conn = dao.getConn();
				String sql = "SELECT URL,Words FROM Images";
				PreparedStatement stat = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE,
						ResultSet.CONCUR_READ_ONLY);
				ResultSet rs = stat.executeQuery();

				rs.last();
				//out.println("haha");
				int size = rs.getRow();

				pageCount = size % PAGESIZE == 0 ? size / PAGESIZE : size / PAGESIZE + 1;
				String sem = request.getParameter("curPage");
				if (sem == null) {
					sem = "1";
				}
				curPage = Integer.parseInt(sem);
				if (curPage >= pageCount)
					curPage = pageCount;
				boolean flag = rs.absolute((curPage - 1) * PAGESIZE + 1);
				out.println(curPage);
		%>
		<br />
		<%
			int count = 0;
				do {

					if (count >= PAGESIZE)
						break;
					String url = rs.getString("URL");
					String words = rs.getString("Words");
					count++;
		%>
		<p>
			<img class="usa" src="<%=url%>" alt="<%=words%>" width="128"
				height="128" style="border:2px;border-color:red"/>
		</p>
		<%
			} while (rs.next());
				conn.close();
				stat.close();
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
	<table>
		<tr>
			<td><a href="imageTest.jsp?curPage=1">首页</a></td>
			<td><a href="imageTest.jsp?curPage=<%=curPage - 1%>">上一页</a></td>
			<td><a href="imageTest.jsp?curPage=<%=curPage + 1%>">下一页</a></td>
			<td><a href="imageTest.jsp?curPage=<%=pageCount%>">尾页</a></td>
		</tr>
		<tr>
			<td>第<%=curPage%>页/共<%=pageCount%>页
			</td>
		</tr>
		</table>
</body>
</html>