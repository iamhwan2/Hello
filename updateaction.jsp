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
	sql = "update member set custname=?,phone=?,address=?,joindate=?,grade=?,city=? where custno=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,request.getParameter("custname"));
	pstmt.setString(2,request.getParameter("phone"));
	pstmt.setString(3,request.getParameter("address"));
	pstmt.setString(4,request.getParameter("joindate"));
	pstmt.setString(5,request.getParameter("grade"));
	pstmt.setString(6,request.getParameter("city"));
	pstmt.setString(7,request.getParameter("custno"));
	
	pstmt.executeUpdate();
%>
<script type="text/javascript">
alert("완료되었습니다");
location.replace("list.jsp");
</script>
</body>
</html>
