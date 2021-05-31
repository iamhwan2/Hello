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
<%
	sql = "select count(*) as cnt from board_tbl";
	ResultSet rs = conn.prepareStatement(sql).executeQuery();
	int cnt = 0;
	if(rs.next()) cnt = Integer.parseInt(rs.getString(1)); 
%>
총 <%=cnt %>개의 게시물이 있습니다.
<table>
<tr>
<th>번호</th>		<th>작성자</th>	<th>제목</th>		<th>작성일</th>
</tr>
<%
	sql = "select * from board_tbl";
	rs=conn.prepareStatement(sql).executeQuery();
	while(rs.next()){
		String idx = rs.getString("idx");
		String writer = rs.getString("writer");
		String subject = rs.getString("subject");
		String board_date = rs.getString("board_date");
%>
<tr>
<td><%=idx %></td>
<td><%=writer %></td>
<td><a href = "view.jsp?idx=<%=idx %>"><%=subject %></a></td>
<td><%=board_date %></td>
</tr>
<%} %>
</table>
<input type = "button" onclick = "location.href = 'write.jsp'" value = "작성">
</body>
<jsp:include page="footer.jsp" />
</html>
