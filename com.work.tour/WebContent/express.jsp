<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.ArrayList"%>
<%@ page import="com.tour.user.option.ImageList"%>
<%@ page import="com.tour.vo.Image"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.tour.work.dao.DAO"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="com.tour.vo.CollectionVO"%>
<%@ page import="com.tour.user.option.UserCollection"%>
<%@ page import="java.util.*"%>
<%
	//ImageList res = new ImageList();
	Image image = new Image();
	DAO dao = new DAO();
	//ArrayList<Image> images = res.getImageList();
	Connection conn = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>中国旅游网</title>
<link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.min.css">
<script src="jquery-3.1.1/jquery-3.1.1.min.js"></script>
<script src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
div.container img {
	cursor: pointer;
	transition: 0.6s;
}

div.container img:hover {
	transform: scale(1.1);
}
.img-circle {
    width: 75px;
    border-radius: 50%;
}
/*----------------------------------------
    页脚
    ------------------------------------
footer {
    background: #333;
    color: #eee;
    font-size: 11px;
    padding: 20px;
}
ul.unstyled {
    list-style: none;
    padding: 0;
}
footer h6 {
    color: white;
}    										*/
#img-circle {
	width: 50px;
	height: 50px;
}
</style>

</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<nav class="navbar navbar-default" role="navigation">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span><span
								class="icon-bar"></span><span class="icon-bar"></span><span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="index.jsp">首页</a>
					</div>

					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class="active"><a href="#">国内景点</a></li>
							<li><a href="#">其他</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">省份<strong class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li><a href="http://www.sdta.cn/">山东</a></li>
									<li><a href="http://www.hnta.cn/">河南</a></li>
									<li><a href="http://www.visitbeijing.com.cn/">北京</a></li>
									<li><a href="http://www.jstour.com/">江苏</a></li>
									<li><a href="http://shzgglv.com/">上海</a></li>
									<li><a href="http://www.tourzj.gov.cn/">浙江</a></li>
									<li><a href="http://www.tjtour.cn/">天津</a></li>
									<li><a href="http://www.xinjiangtour.gov.cn/">新疆</a></li>
									<li><a href="http://www.nmglyw.com/">内蒙古</a></li>
									<li><a href="http://www.ahta.com.cn/">安徽</a></li>
									<!-- 
								<li class="divider">
								</li>
								<li>
									 <a href="#">Separated link</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">One more separated link</a>
								</li>
								!-->
								</ul></li>
						</ul>
						<form class="navbar-form navbar-left" role="search" id = "form1" method = "post" action = "servlet/SearchServlet">
							<div class="form-group">
								<input type="text" class="form-control" name = "content"/>
							</div>
							<input type="submit" class="btn btn-default" value = "搜索"/>
						</form>
						<ul class="nav navbar-nav navbar-right">
							<%
								if (session.getAttribute("admain") != null) {
							%>
							<li><a href="index.jsp"> <%=session.getAttribute("admain")%>
							</a></li>
							<%
								} else {
							%>
							<li><a href="login.jsp">登录</a></li>
							<%
								}
							%>
							<li><a href="input.jsp">注册</a></li>
						</ul>
					</div>
				</nav>

				<%
					String name = request.getParameter("words");
					
					//System.out.println(name);
					try {
						conn = dao.getConn();
						
						String sql = "SELECT * FROM Images where Words = ?";
						PreparedStatement state = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE,
								ResultSet.CONCUR_READ_ONLY);
						state.setString(1, name);
						ResultSet rs = state.executeQuery();
						//rs.first();
						
						while(rs.next()){
							
							
							System.out.println(name);
							image.setId(Integer.toString(rs.getInt("ID")));
							image.setUrl(rs.getString("URL"));
							image.setWords(rs.getString("Words"));
							//System.out.println(image.getWords());
							image.setIntroduce(rs.getString("Introduce"));
							image.setDescription(rs.getString("Description"));
							image.setCollection_deny(Boolean.parseBoolean(rs.getString("Collection_deny")));
							
						}
						state.close();
						conn.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
				<div class="container">
					<div class="row clearfix">
						<div class="col-md-8 column">
							<ul class="breadcrumb">
								<li><a href="index.jsp">Home</a></li>
								<li><a href="#" onclick="javascript:history.back(-1);"><%=name%></a></li>
								<li class="active">概况</li>
							</ul>
							<div class="container">
								<div class="row clearfix">
									<div class="col-md-8 column" align="center">
										<img alt="140x140" src="<%=image.getUrl() %>" height="100px" width="200px" class="img-rounded" />
									</div>
								</div>
							</div>
							<p>
								<%=image.getDescription()%>
							</p>

						</div>
						<div class="col-md-4 column">
							<div class="panel-group" id="panel-758751">
								<div class="panel panel-default">
									<div class="panel-heading">
										<a class="panel-title collapsed" data-toggle="collapse"
											data-parent="#panel-758751" href="#panel-element-185142">我的收藏</a>
									</div>
									<div id="panel-element-185142" class="panel-collapse collapse">
										<div class="panel-body">
											<%
												String user = (String) session.getAttribute("admain");
												if (user == null) {
													out.println("<font color='green'>请先登录</font>");
												} else {

													UserCollection userCollection = new UserCollection();
													//CollectionVO collectionVO = new CollectionVO();
													List<CollectionVO> list = new ArrayList<CollectionVO>();
													list = userCollection.getColl();
													for (CollectionVO cnt : list) {
														if (cnt.getUsername().equals(user)) {
															out.println("<font color = 'green'>" + cnt.getCollection() + "</font><br>");
														} else
															continue;
													}
												}
											%>
										</div>

									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<a class="panel-title collapsed" data-toggle="collapse"
											data-parent="#panel-758751" href="#panel-element-637685">管理</a>
									</div>
									<div id="panel-element-637685" class="panel-collapse collapse">
										<div class="panel-body">Anim pariatur cliche...</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
				<footer>
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<h4 align="center">
									<font color="gray">本网站由<span
										class="glyphicon glyphicon-heart"></span>Perlife制作
									</font>
								</h4>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12" align="center">
								<a href="http://blog.csdn.net/better_space"><img
									src="/com.work.tour/images/csdn.png" class="img-circle" /></a> <a
									href="https://github.com/"><img
									src="/com.work.tour/images/github.png" class="img-circle" /></a> <a
									href="https://www.facebook.com/profile.php?id=100014834554168"><img
									src="/com.work.tour/images/facebook.png" class="img-circle" /></a>
							</div>
						</div>
					</div>
				</footer>
				<!--页脚结束-->

			</div>
		</div>
</body>
</html>