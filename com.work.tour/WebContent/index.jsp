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
	ImageList res = new ImageList();
	ArrayList<Image> images = res.getImageList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>中国旅游网</title>
<link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.min.css">
<script src="jquery-3.1.1/jquery-3.1.1.min.js"></script>
<script src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
<!--  
<script type="text/javascript">
	var req;
	function validate() {
		//获取表单提交的内容 
		//alert("haha");
		var idField = document.getElementById();
		//访问validate.do这个servlet，同时把获取的表单内容idField加入url字符串，以便传递给validate.do  
		var url = "servlet/ReCollection?words=" + escape(idField.id);
		//创建一个XMLHttpRequest对象req  
		alert(idField.id);
		if (window.XMLHttpRequest) {
			//IE7, Firefox, Opera支持  
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			//IE5,IE6支持  
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		/* 
		 open(String method,String url, boolean )函数有3个参数 
		 method参数指定向servlet发送请求所使用的方法，有GET,POST等 
		 boolean值指定是否异步，true为使用，false为不使用。 
		 我们使用异步才能体会到Ajax强大的异步功能。 
		 */
		req.open("GET", url, true);
		//onreadystatechange属性存有处理服务器响应的函数,有5个取值分别代表不同状态  
		req.onreadystatechange = callback;
		//send函数发送请求  
		req.send(null);
		// alert("ajax");
	}

	function callback() {
		if (req.readyState == 4 && req.status == 200) {
			var check = req.responseText;
			show(check);
		}
	}

	function show(str) {
		if (str == "已收藏") {
			// var show = "<font color='green'>恭喜！！用户名可用！</font>";  
			document.getElementById("arch").innerText = str;
		} else if (str == "添加到收藏") {
			// var show = "<font color='red'>对不起，用户名不可用！！请重新输入！</font>";  
			document.getElementById("arch").innerText = str;
		}
	}
</script>
-->

<script type="text/javascript">
	function getText(){
		//alert("FUCK");
		var form = document.getElementById("form1");
		var text = document.getElementByName("content");
		 window.location.href("servlet/SearchServlet?text="+text); 
	}
	function URL(){
		var name ,value ;
		var str = location.href;
		var num = str.indexOf("?");//获取？所在位置
		str = str.substr(num+1);
		if(str==null){
			return ;
		}
		var arr = str.split("&");
		num = arr[0].indexOf("=");
		name = arr[0].subString(0,num);
		value = arr[0].substr(num+1);
		alert(value);
		var Request = new URL();
	}
</script>
<style type="text/css">
.img-circle {
	width: 75px;
}

div.thumbnail img {
	cursor: pointer;
	transition: 0.6s;
}

div.thumbnail img:hover {
	transform: scale(1.1);
}
.thumbnail {
    display: block;
    padding: 4px;
    height: 300px;
    width: 220px;
    margin-bottom: 20px;
    line-height: 1.42857143;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 4px;
    -webkit-transition: border .2s ease-in-out;
    -o-transition: border .2s ease-in-out;
    transition: border .2s ease-in-out;
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
							<li><a href="http://better-space.cn/bbs">其他</a></li>
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
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <%=session.getAttribute("admain")%><strong class="caret"></strong>
							</a>
								<ul class = "dropdown-menu">
									<li><a href = "#">个人信息</a>
									<li><a href = "servlet/InvalidateServlet">注销</a>	
								</ul>
							</li>
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
				<%!public static DAO dao = new DAO();
	public static final int PAGESIZE = 6;
	public static String username = null;
	String id = null;
	int pageCount;
	int curPage = 1;%>
				<%
					try {
						username = (String) session.getAttribute("admain");
						Connection conn = dao.getConn();
						String sql = "SELECT ID,URL,Words,Introduce,Description,Collection_deny FROM Images";
						PreparedStatement stat = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE,
								ResultSet.CONCUR_READ_ONLY);//此处的用法存在疑问，"	日后"再说
						ResultSet rs = stat.executeQuery();
						rs.last();
						int size = rs.getRow();
						pageCount = (size % PAGESIZE == 0) ? (size / PAGESIZE) : (size / PAGESIZE + 1);
						String sem = request.getParameter("curPage");
						if (sem == null) {
							sem = "1";
						}
						curPage = Integer.parseInt(sem);
						if (curPage >= pageCount)
							curPage = pageCount;
						boolean flag = rs.absolute((curPage - 1) * PAGESIZE + 1);
				%>

				<ul class="pagination">
					<li><a href="index.jsp?curPage=1">Prev</a></li>
					<%
						for (int i = 1; i <= pageCount; i++) {
					%>
					<li><a href="index.jsp?curPage=<%=i%>"><%=i%></a></li>
					<%
						}
					%>
					<li><a href="index.jsp?curPage=<%=pageCount%>">Next</a></li>
				</ul>

				<div class="container">
					<div class="row clearfix">
						<div class="col-md-8 column">
							<div class="row">
								<%
									int count = 0;

										do {
											boolean cnt = false;
											if (count >= PAGESIZE)
												break;
											String ID = rs.getString("ID");
											String url = rs.getString("URL");
											String words = rs.getString("Words");
											String introduce = rs.getString("Introduce");
											String collection = rs.getString("Collection_deny");
											//System.out.println(words);
											//boolean cnt = Boolean.parseBoolean(collection);
											//System.out.println(introduce);
											count++;
											//id = "arch"+words;
											//System.out.println(id);
											try {
												Connection conn2 = dao.getConn();
												String sql2 = "SELECT * FROM Personal_Collection WHERE Username = ? AND Collection = ? ";
												PreparedStatement state2 = conn2.prepareStatement(sql2);
												state2.setString(1, username);
												state2.setString(2, words);
												ResultSet rs2 = state2.executeQuery();
												if (rs2.next()) {
													cnt = true;
												}
												//conn2.close();
												//state2.close();
												//rs.close();
											} catch (Exception e) {
												e.printStackTrace();
											}
								%>
								<div class="col-md-4" style="width: 250px; height: 300px;">
									<div class="thumbnail">
										<img alt="200×200" src="<%=url%> " height="200px"
											width="200px" />
										<div class="caption">
											<h3><%=words%></h3>
											<p>
												<%
													out.print(introduce);
												%>
											</p>
											<p>
												<a class="btn btn-primary"
													href="express.jsp?words=<%=words%>">详细</a>
												<%
													String feedback = null;
															feedback = request.getParameter("feedback");
															//System.out.println(words);
															//System.out.println(uuu);
															//System.out.println(feedback);
															if (cnt == true) {
												%>
												
															<a class='btn' href='servlet/CancelCollectionServlet?words=<%=words%>' id='arch'>取消收藏</a>
												
												<%
																//} else
																//	out.println(feedback);
												
															} else {
												%>

												<a class="btn" href="servlet/ReCollection?words=<%=words%>"
													id="arch"> 添加到收藏 </a>
													
												<%
													
													}
												%>
											</p>
										</div>
									</div>
								</div>
								<%
									} while (rs.next());
										rs.close();
										conn.close();
										stat.close();
									} catch (Exception e) {
										e.printStackTrace();
									}
								%>
								<!--
								<div class="col-md-4">
									<div class="thumbnail">
										<img alt="300x200" src="v3/default6.jpg" />
										<div class="caption">
											<h3>Thumbnail label</h3>
											<p>Cras justo odio, dapibus ac facilisis in, egestas eget
												quam. Donec id elit non mi porta gravida at eget metus.
												Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
											<p>
												<a class="btn btn-primary" href="#">Action</a> <a
													class="btn" href="#">Action</a>
											</p>
										</div>
									</div>
							</div>
							-->
							</div>
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