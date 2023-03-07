<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){	
	$("#FindIdFrm").submit(function(){  	
		let frmObj = $(this);
		//이름필수입력
		if($("#name").val()==""){
			alert("이름을 입력하세요.");
			$("#name").focus();
			return false; 
		}	 
		//이메일필수입력 
		if($("#email1").val()==""){ 
			alert("이메일을 입력하세요.");
			$("#email1").focus();
			return false; 
		}
		if($("#email2").val()==""){ 
			alert("이메일을 입력하세요.");
			$("#email2").focus();
			return false; 
		}
	});	
});
//이메일
$(function(){
	$("#email_op").change(function(){
		let val = $("select#email_op option:selected").val();
		$("#email2").val(val);
	});
});
</script>
</head>
<body>
	<h3>아이디 찾기</h3>
	<hr/>
	<f:form modelAttribute="NewUser" method="post" action="./findId" id="FindIdFrm">
	<table border="1">
	<tr>
	<th>이름 </th>
	<td><f:input path="name" name="name" id="name"/></td>
	</tr>
	<tr>
	<th>이메일 </th>
	<td><f:input path="email1" name="email1" id="email1"/>@<f:input path="email2" name="email2" id="email2"/>
				<select name="email_op" id="email_op">
	 				<option value="">직접입력</option>
	 				<option value="gmail.com">gmail.com</option>
	 				<option value="naver.com">naver.com</option>
	 				<option value="daum.net">daum.net</option>
	 				<option value="nate.com">nate.com</option>
 			 	</select>
 	</td>
	</tr>
	<tr>
	<td colspan="2" style="text-align:center;">
	<f:button type="submit">찾기</f:button>
	<f:button type="button" onclick="location.href='./login'">취소</f:button>
	</td>
	</tr>
	</table>
	</f:form>
</body>
</html>