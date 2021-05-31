<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbConnection.jsp" %>
<%
	String idx = request.getParameter("idx");
	
	sql = "select * from board_tbl where idx = " + idx;
	ResultSet rs = conn.prepareStatement(sql).executeQuery();
	rs.next();
	String writer = rs.getString("writer");
	String subject = rs.getString("subject");
	String content = rs.getString("content");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp" />
<h4>게시물 작성</h4>
<form action = "updateaction.jsp?idx=<%=idx %>" method = "post">
<table>
<tr>
<td>작성자</td>
<td><input type = "text" name = "writer" value = "<%=writer %>" required></td>
</tr>
<tr>
<td>제목</td>
<td><input type = "text" name = "subject" value = "<%=subject %>" required></td>
</tr>
<tr>
<td>내용</td>
<td><input type = "text" name = "content" value = "<%=content %>" style = "height:100px; width:300px;" required></td>
</tr>
</table>
<button type = "submit">완료</button>
<input type = "button" onclick = "location.href = 'list.jsp'" value = "취소">
</form>
</body>
<jsp:include page="footer.jsp" />
</html>
