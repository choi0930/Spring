<%@ page language="java" contentType="text/html; charset=UTF-8"
    isELIgnored="false"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 출력창</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style>
*{
	margin:0px;
	padding: 0px;
}
a{
text-decoration: none;
}
#table_postion{
	position:relative;
	top:150px;
	width:1000px;
	margin: 0 auto;
}
</style>
</head>
<body>
<div id="table_postion">
	<table  class="table table-hover caption-top" >
	 <caption>회원 목록</caption>
		<thead class="table-dark">
		<tr align="center" class="table-active">
			<td><b>아이디</b></td>
			<td><b>비밀번호</b></td>
			<td><b>이름</b></td>
			<td><b>이메일</b></td>
			<td><b>가입일</b></td>
			<td><b>삭제</b></td>
			<td><b>수정</b></td>
		</tr>
		</thead>
		<c:forEach var="member" items="${membersList }">
			<tr align="center">
				<td>${member.id }</td>
				<td>${member.pwd }</td>
				<td>${member.name }</td>
				<td>${member.email }</td>
				<td>${member.joinDate }</td>
				<td><a href="${contextPath }/member/removeMember.do?id=${member.id }">삭제</a></td>
				<td><a href="${contextPath }/member/modMemberForm.do?id=${member.id }">수정</a></td>
			</tr>
		</c:forEach>
	</table>
	<a href="${contextPath }/member/memberForm.do"><h1 style="text-align: center;">회원가입</h1></a>
<!-- 	<a href=""><h1 style="text-align: center;">회원검색</h1></a> -->
	</div>
</body>
</html>