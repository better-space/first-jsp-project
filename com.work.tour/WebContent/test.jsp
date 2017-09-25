<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
    <%@ page import="java.net.URLEncoder"%>
<%@ page import="com.tour.vo.CollectionVO" %>
<%@ page import="com.tour.user.option.UserCollection" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Test</title>
</head>
<body>
	<%
		UserCollection userCollection = new UserCollection();
		List<CollectionVO> list = new ArrayList<CollectionVO>();
		list = userCollection.getColl();
		for(CollectionVO cnt:list){
			out.println("<font color = 'green'>"+cnt.getCollection()+"</font><br/>");
		}
	%>
</body>
</html>