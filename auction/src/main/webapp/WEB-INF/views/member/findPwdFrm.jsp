<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){	
	$("#FindPwdFrm").submit(function(){  	
		let frmObj = $(this);
		//아이디필수입력
		if($("#id").val()==""){
			alert("아이디를 입력하세요.");
			$("#id").focus();
			return false; 
		}	 
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
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/find.css" />
</head>
<body>
	<article class="findidpage">
		<section class="findid">
			<h2>비밀번호 찾기</h2>
		</section>
	<div>	
	<f:form modelAttribute="NewMember" method="post" action="./findPwd" id="FindPwdFrm">
	<f:input path="id" name="id" id="id" placeholder="아이디" class="findidform1"/>
	<f:input path="name" name="name" id="name" placeholder="이름" class="findidform1" />
	<f:select path="phone1" name="phone1" id="phone1" class="findidform2">
                <option value="010">010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="070">070</option>
            </f:select>    
		- <f:input path="phone2" name="phone2" id="phone2" class="findidform2"/>
		- <f:input path="phone3" name="phone3" id="phone3" class="findidform2"/>
	<f:button type="submit" class="findidbnt">찾기</f:button>
	</f:form>
	<br> <br>
	<div>
       <p><a href="<%=request.getContextPath()%>/member/findId">아이디 찾기</a></p>&verbar;
       <p><a href="<%=request.getContextPath()%>/member/login">로그인</a></p>&verbar;
       <p><a href="<%=request.getContextPath()%>/main">메인</a></p>
     </div> 
	</div>
	</article>
</body>
</html>