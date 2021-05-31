<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "dbConnection.jsp" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp" />
<h3>홈쇼핑 회원 등록</h3>
<form action = "insertaction.jsp" method = "post" name = "frm" onsubmit = "return chk()">
<table>
<%
	sql = "select max(custno) from member";
	ResultSet rs = conn.prepareStatement(sql).executeQuery();
	rs.next();
	int max = Integer.parseInt(rs.getString(1))+1;
%>
<tr>
<td>회원번호(자동생성)</td>
<td><input type = "text" name = "custno" value = "<%=max %>"></td>
</tr>
<tr>
<td>회원성명</td>
<td><input type = "text" name = "custname"></td>
</tr>
<tr>
<td>전화번호</td>
<td><input type = "text" name = "phone"></td>
</tr>
<tr>
<td>회원주소</td>
<td><input type = "text" name = "address"></td>
</tr>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
<tr>
<td>가입일자</td>
<td><input type = "text" name = "joindate" value = "<%=sf.format(nowTime) %>"></td>
</tr>
<tr>
<td>고객등급<br>[A:VVIP B:VIP C:일반]</td>
<td><input type = "text" name = "grade"></td>
</tr>
<tr>
<td>도시코드</td>
<td><input type = "text" name = "city"></td>
</tr>
<tr>
<td>
<button type = "submit">등록</button>
<input type = "button" onclick = "location.href = 'list.jsp'" value = "조회">
<input type = "button" onclick = "reset()" value = "리셋">
</td>
</tr>
</table>
</form>
<jsp:include page="footer.jsp" />
</body>
<script type="text/javascript">
function chk(){
	if(frm.custname.value == ""){
		alert("회원성명을 입력하세요");
		frm.custname.focus();
		return false;
	}
	if(frm.phone.value == ""){
		alert("전화번호를 입력하세요");
		frm.phone.focus();
		return false;
	}
	if(frm.address.value == ""){
		alert("주소를 입력하세요");
		frm.address.focus();
		return false;
	}
	if(frm.grade.value == ""){
		alert("고객등급을 입력하세요");
		frm.grade.focus();
		return false;
	}else if(!(frm.grade.value == "A" || frm.grade.value == "B" || frm.grade.value == "C")){
		alert("A,B,C만 입력하세요");
		frm.grade.focus();
		return false;
	}
	if(frm.city.value == ""){
		alert("도시코드를 입력하세요");
		frm.city.focus();
		return false;
	}else if(frm.city.value.length > 2){
		alert("도시코드를 2자리만 입력하세요");
		frm.city.focus();
		return false;
	}
}
</script>
</html>
