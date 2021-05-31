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
	String comment_idx = request.getParameter("comment_idx");

	sql = "delete from comment_tbl where idx ="+comment_idx;
	conn.prepareStatement(sql).executeUpdate();
%>
<script type="text/javascript">
alert("완료되었습니다");
location.replace("list.jsp");
</script>
</body>
</html>
