<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "dbConnection.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp" />
<h3>회원매출조회</h3>
<table>
<tr>
<th>회원번호</th>	<th>회원성명</th>	<th>고객등급</th>	<th>매출</th>
</tr>
<%
	sql = "select m.custno,m.custname,m.grade,sum(b.price) sum from member m,buymember b where m.custno = b.custno group by m.custno,m.custname,m.grade order by sum desc";
	ResultSet rs = conn.prepareStatement(sql).executeQuery();
	while(rs.next()){
		String num = rs.getString(1);
		String name = rs.getString(2);
		String grade = rs.getString(3);
		if(grade.equals("A")){
			grade = "VVIP";
		}else if(grade.equals("B")){
			grade = "VIP";
		}else if(grade.equals("C")){
			grade = "일반";
		}
		String sum = rs.getString(4);
%>
<tr>
<td><%=num %></td>
<td><%=name %></td>
<td><%=grade %></td>
<td><%=sum %></td>
</tr>
<%} %>
</table>
</body>
</html>
