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

	sql = "insert into comment_tbl values(comment_seq.nextval,?,?,?,sysdate)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,idx);
	pstmt.setString(2,request.getParameter("writer"));
	pstmt.setString(3,request.getParameter("content"));
	
	pstmt.executeUpdate();
%>
<script type="text/javascript">
alert("완료되었습니다");
location.replace("list.jsp");
</script>
</body>
</html>
