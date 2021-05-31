<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbConnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String custno = request.getParameter("custno");
	sql = "delete from member where custno = " + custno;
	conn.prepareStatement(sql).executeUpdate();
%>
<jsp:forward page="list.jsp" />
</body>
</html>
