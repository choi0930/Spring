<%@page import="org.springframework.web.servlet.ModelAndView"%>
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
<title>Insert title here</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style type="text/css">
*{
	margin:0px;
	padding: 0px;
	}
body{
      background: linear-gradient(to top right, #000000 0%, #ffffff 100%);
	}
	fieldset{
	border: 0px
	}
	#modForm{
	height:auto;
		width: 470px;
		margin: 0 auto;
		padding:20px 20px 20px 20px;
		margin-top: 80px;
		background: #fff;
     	border-radius: 10px;
      	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	}
	#form_userId, .form_userPwd, #form_userName, #form_email,#form_joinDate{
	margin-bottom: 20px;
	}
</style>
</head>
<body class="d-flex flex-column min-vh-100">
<div id="modForm">
<form>
	<fieldset>
	<legend>회원정보 수정창</legend>
	<!-- 아이디 -->
	<div id="form_userId">
		<div>아이디</div>
		<div><input type="text"  disabled="disabled" value="${memberVO.id }"class="form_input form-control"></div>
		<input type="hidden" name="id" value="${memberVO.id }">
	</div>
	<!-- 비밀번호 수정 -->
	<div class="form_userPwd">
		<div>비밀번호</div>
		<div><input type="password" name="pwd" value="${memberVO.pwd }" class="form_input form-control"></div>
	</div>
	<!-- 비밀번호 확인 -->
	<div class="form_userPwd">
		<div>비밀번호 확인</div>
		<div><input type="password" name="pwd2" class="form_input form-control"></div>
		<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
		<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
	</div>
	<!-- 이름 수정 -->
	<div id="form_userName">
		<div>이름</div>
		<div><input type="text" name="name" value="${memberVO.name}"class="form_input form-control"></div>
	</div>
	
	<!-- 이메일 수정 -->
	<div id="form_email">
		<label for="userEmail">이메일</label><br>
		<div class="input-group">
			<input type="text" name="email1" id="userEmail" class="form_input form_email form-control" required/>
			<span class="input-group-text">@</span> 
			<input type="text" name="email2" id="selects"class="form_input form_email form-control" required="required"/>
		
		<select name ="email3" id="email_select" class="form-select" onchange="fn_select();">
			<option value="choose">이메일 선택</option>
			<option value="gmail.com">gmail.com</option>
			<option value="naver.com">naver.com</option>
			<option value="daum.net">daum.net</option>
			<option value="hanmail.net">hanmail.net</option>
			<option value="nate.com">nate.com</option>
			<option value="lycos.co.kr">lycos.co.kr</option>
			<option value="hotmail.com">hotmail.com</option>
			<option value="korea.com">korea.com</option>
			<option value="yahoo.co.kr">yahoo.co.kr</option>
			<option value="self">직접 입력</option>
		</select>
		</div>
	</div>
	
	<!-- 가입일 -->
	<div id="form_joinDate">
		<div>가입일</div>
		<div><input type="text" disabled class="form_input form-control"></div>
	</div>
		<button type="submit" class="btn btn-primary" id="submit">회원가입</button>
		<a id="before_page"href="${contextPath }/member/listMembers.do">이전 페이지</a>
	</fieldset>
	</form>
</div>
</body>
</html>