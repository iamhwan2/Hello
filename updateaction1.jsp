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

	sql = "update board_tbl set writer=?,subject=?,content=? where idx=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("writer"));
	pstmt.setString(2, request.getParameter("subject"));
	pstmt.setString(3, request.getParameter("content"));
	pstmt.setString(4, idx);
	
	pstmt.executeUpdate();
%>
<script type="text/javascript">
alert("완료되었습니다");
location.replace("list.jsp");
</script>
</body>
</html>
