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
<h3>게시물 작성</h3>
<form action = "writeaction.jsp" method = "post">
<table>
<tr>
<td>작성자</td>
<td><input type = "text" name = "writer" required></td>
</tr>
<tr>
<td>제목</td>
<td><input type = "text" name = "subject" required></td>
</tr>
<tr>
<td>내용</td>
<td><input type = "text" name = "content" style = "height:100px; width:300px;" required></td>
</tr>
</table>
<button onclick = "history.back()">목록</button>
<button type = "submit">완료</button>
</form>
</body>
<jsp:include page="footer.jsp" />
</html>
