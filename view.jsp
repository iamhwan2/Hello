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
<h3>게시물 조회</h3>
<%
	String idx = request.getParameter("idx");
	sql = "select * from board_tbl where idx = " +idx;
	ResultSet rs = conn.prepareStatement(sql).executeQuery();
	rs.next();
	String subject = rs.getString("subject");
	String writer = rs.getString("writer");
	String board_date = rs.getString("board_date");
	String content = rs.getString("content");
%>
<ul>
<li>제목:<%=subject %></li>
<li>작성자:<%=writer %></li>
<li>작성일:<%=board_date %></li>
<li><%=content %></li>
</ul>
<h4>댓글 조회</h4>
<%
	idx = request.getParameter("idx");
	sql = "select * from comment_tbl where bidx = " + idx;
	rs = conn.prepareStatement(sql).executeQuery();
	while(rs.next()){
		String comment_idx = rs.getString("idx");
		String comment_writer = rs.getString("writer");
		String comment_content = rs.getString("content");
		String comment_date = rs.getString("commet_date");
%>
<ul>
<li><%=comment_writer %>/<%=comment_content %>/<%=comment_date %>/<a href = "comment_delete.jsp?comment_idx=<%=comment_idx %>">삭제</a></li>
</ul>
<%} %>
<h4>댓글작성</h4>
<form action = "commentwriteaction.jsp?idx=<%=idx %>" method = "post">
<input type = "text" name = "writer">
<input type = "text" name = "content">
<button type = "submit">작성완료</button>
</form>
<input type = "button" onclick = "location.href = 'list.jsp'" value = "목록">
<input type = "button" onclick = "location.href = 'update.jsp?idx=<%=idx %>'" value = "수정">
<input type = "button" onclick = "location.href = 'delete.jsp?idx=<%=idx %>'" value = "삭제">
</body>
</html>
