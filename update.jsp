<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbConnection.jsp" %>
<%
	String custno = request.getParameter("custno");
	sql = "select * from member where custno="+custno;
	ResultSet rs = conn.prepareStatement(sql).executeQuery();
	rs.next();
	String custname = rs.getString("custname");
	String phone = rs.getString("phone");
	String address = rs.getString("address");
	String joindate = rs.getString("joindate").substring(0,10);
	String grade = rs.getString("grade");
	String city = rs.getString("city");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp" />
<form action = "updateaction.jsp?custno=<%=custno %>" method = "post">
<table>
<tr>
<td>회원번호(자동생성)</td>
<td><input type = "text" name = "custno" value = "<%=custno %>" required></td>
</tr>
<tr>
<td>회원성명</td>
<td><input type = "text" name = "custname" value = "<%=custname %>" required></td>
</tr>
<tr>
<td>전화번호</td>
<td><input type = "text" name = "phone" value = "<%=phone %>" required></td>
</tr>
<tr>
<td>회원주소</td>
<td><input type = "text" name = "address" value = "<%=address %>" required></td>
</tr>
<tr>
<td>가입일자</td>
<td><input type = "text" name = "joindate" value = "<%=joindate %>" readonly></td>
</tr>
<tr>
<td>고객등급<br>[A:VVIP B:VIP C:일반]</td>
<td><input type = "text" name = "grade" value = "<%=grade %>" required></td>
</tr>
<tr>
<td>도시코드</td>
<td><input type = "text" name = "city" value = "<%=city %>" required></td>
</tr>
<tr>
<td>
	<button type = "submit">수정</button>
	<input type = "button" onclick = "location.href='list.jsp'" value = "조회">
	<input type = "button" onclick = "reset()" value = "리셋"></td>
</tr>
</table>
</form>
</body>
</html>
