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
<jsp:include page="header.jsp" />
<h3>회원목록조회/수정</h3>
<table>
<tr>
<th>회원번호</th>	<th>회원성명</th>	<th>전화번호</th>	<th>주소</th>
<th>가입일자</th>	<th>고객등급</th>	<th>거주지역</th>	<th>수정 및 삭제</th>
</tr>
<%
	sql = "select * from member order by custno";
	ResultSet rs = conn.prepareStatement(sql).executeQuery();
	while(rs.next()){
		String custno = rs.getString("custno");
		String custname = rs.getString("custname");
		String phone = rs.getString("phone");
		String address = rs.getString("address");
		String joindate = rs.getString("joindate").substring(0,10);
		String grade = rs.getString("grade");
		if(grade.equals("A")){
			grade = "VVIP";
		}else if(grade.equals("B")){
			grade = "VIP";
		}else if(grade.equals("C")){
			grade = "일반";
		}
	
		String city = rs.getString("city");
%>
<tr>
<td><%=custno %></td>
<td><%=custname %></td>
<td><%=phone %></td>
<td><%=address %></td>
<td><%=joindate %></td>
<td><%=grade %></td>
<td><%=city %></td>
<td><a href = "update.jsp?custno=<%=custno %>">수정</a>/
	<a href = "delete.jsp?custno=<%=custno %>" onclick = "if(!confirm('삭제하시겠습니까?')){return false;}">삭제</a></td>
</tr>
<%} %>
</table>
<jsp:include page="footer.jsp" />
</body>
</html>
