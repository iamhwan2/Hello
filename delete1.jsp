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
	String idx = request.getParameter("idx");
	
	sql = "delete from board_tbl where idx = " +idx;
	conn.prepareStatement(sql).executeUpdate();
%>
<script type="text/javascript">
alert("삭제되었습니다");
location.replace("list.jsp");
</script>
</body>
</html>
