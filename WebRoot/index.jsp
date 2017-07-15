<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="edu.nuaa.dao.UserDao"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>

<body>
	<form action="index.jsp" method="post">
		<h2>userid:</h2>
		<input type="text" name="uid">
		<h2>password:</h2>
		<input type="password" name="password">
		<h2></h2>
		<input type="submit" value="Login">
	</form>

	<%
		if (request.getParameter("uid") != null) {
			int uid = Integer.parseInt(request.getParameter("uid"));

			String password = request.getParameter("password");

			UserDao udao = new UserDao();
			String username = udao.getUsername(uid, password);
			if (username != null) {
				response.setHeader("refresh", "3;URL=welcome.jsp");
				session.setAttribute("username", username);
	%>
	<h2>用户登录成功，三秒种之后跳转至欢迎页！</h2>
	<h3>
		如果没有跳转，请点击<a href="welcome.jsp">这里</a>
	</h3>
	<%
		} else {
	%>
	<h2>用户名或密码错误！登录失败！</h2>
	<%
		}
		}
	%>
</body>
</html>
