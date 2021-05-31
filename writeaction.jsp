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
	sql = "insert into board_tbl values(board_seq.nextval,?,?,?,sysdate)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("writer"));
	pstmt.setString(2, request.getParameter("subject"));
	pstmt.setString(3, request.getParameter("content"));
	
	pstmt.executeUpdate();
%>
<script type="text/javascript">
alert("완료되었습니다");
location.replace("list.jsp");
</script>
</body>
</html>
