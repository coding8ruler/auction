<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){	
	$("#LoginFrm").submit(function(){  	
		let frmObj = $(this);
		//아이디필수입력
		if($("#id").val()==""){
			alert("아이디를 입력하세요.");
			$("#id").focus();
			return false; 
		}	 
		//비밀번호필수입력 
		if($("#password").val()==""){ 
			alert("비밀번호를 입력하세요.");
			$("#password").focus();
			return false; 
		}
	});	
});
</script>
<body>
	<h3>로그인</h3>
	<hr/>
 <f:form modelAttribute="NewMember" method="post" action="./login" id="LoginFrm">
 <table border="1">
 	<tr>
	<th>아이디</th>
	<td><f:input path="id" name="id" /></td>
	</tr>
	<tr>
  	<th>비밀번호</th>
  	<td><f:password path="password" name="password" /></td>
 	</tr>
 	<tr>
	<td colspan="2" style="text-align:center;">
	<f:button type="submit">로그인</f:button> 
	<f:button type="button" onclick="location.href='./findId'">아이디 찾기</f:button> 
	<f:button type="button" onclick="location.href='./findPwd'">비밀번호 찾기</f:button> 
	</td>
	</tr>
</table>
</f:form>
</body>
</html>