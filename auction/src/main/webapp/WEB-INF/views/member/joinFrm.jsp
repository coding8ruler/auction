<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="<%=request.getContextPath()%>"/>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinFrm</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function findAddr(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("roadaddress").value = roadAddr;
            document.getElementById("jibunaddress").value = data.jibunAddress;
        }
    }).open();
}    
</script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
//아이디 중복체크
function fn_idChk(){	
	let id = $("#id").val();
	if(!id){
	       alert("아이디를 입력하세요.");
	         return false;
	}
	$.ajax({
		url : "http://localhost:8081/auction/member/idChk",
		type : "post",
		dataType : "json",
		data : {"id" : $("#id").val()},
		success : function(data){
			if(data == 1){
				alert("사용중인 아이디입니다.");
			}else if(data == 0){
				$("#idChk").attr("value", "Y");
				alert("사용가능한 아이디입니다.");
			}
		}
	})
}
//비밀번호 체크
$(function(){
	$('#password2').blur(function(){
		if($('#password').val() != $('#password2').val()){
			if($('#password2').val()!=''){
				alert("비밀번호가 일치하지 않습니다.");
		    	$('#password2').val('');
		        $('#password2').focus();
		     }
		 }
	})  	   
});
//이메일
$(function(){
	$("#email_op").change(function(){
		let val = $("select#email_op option:selected").val();
		$("#email2").val(val);
	});
});
//유효성
$(document).ready(function(){	
	$("#JoinFrm").submit(function(){  	
		let frmObj = $(this);
		//아이디필수입력
		if($("#id").val()==""){
			alert("아이디를 입력하세요.");
			$("#id").focus();
			return false; 
		}	 
		let reg0= /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,12}/g;	
		if(!reg0.test($("#password").val())){
			alert("비밀번호는 최소 한개이상의 숫자,영어대소문자 4~12이내 입력하세요.");
			$("#password").focus(); 
			return false;
		}
		//비밀번호필수입력 
		if($("#password").val()==""){ 
			alert("비밀번호를 입력하세요.");
			$("#password").focus();
			return false; 
		}
		//비밀번호 글자수제한 편의상 4~12
		if($("#password").val().length<4 || $("#mpassword").val().length>12){
			alert("비밀번호는 4~12글자로 입력하세요.");
			$("#password").val("");
			$("#password").focus(); 
			return false; 
		}
		//비밀번호확인필수입력 
		if($("#password2").val()==""){ //비밀번호재확인를 입력하지않았다면
			alert("비밀번호재확인을 입력하세요.");
			$("#password2").focus(); //포커스위치
			return false; 
		}
		//이름필수입력
		if($("#name").val()==""){ 
			alert("이름을 입력하세요.");
			$("#name").focus();
			return false; 
		} 
		//번호필수입력
		if($("#phone1").val()==""){
			alert("번호를 입력하세요.");
			$("#phone1").focus();
			return false; 
		}
		if($("#phone2").val()==""){
			alert("번호를 입력하세요.");
			$("#phone2").focus();
			return false; 
		}
		if($("#phone3").val()==""){
			alert("번호를 입력하세요.");
			$("#phone3").focus();
			return false; 
		}
		//성별필수입력
		if($("#gender").val()==""){
			alert("성별을 입력하세요.");
			$("#gender").focus();
			return false; 
		}
		//생년월일필수입력
		if($("#year").val()==""){
			alert("생년월일를 입력하세요.");
			$("#year").focus();
			return false; 
		}
		if($("#month").val()==""){
			alert("생년월일을 입력하세요.");
			$("#month").focus();
			return false; 
		}
		if($("#day").val()==""){
			alert("생년월일을 입력하세요.");
			$("#day").focus();
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
		//주소필수입력
		if($("#zipcode").val()==""){
			alert("우편번호를 입력하세요.");
			$("#zipcode").focus();
			return false; 
		}
		if($("#roadaddress").val()==""){
			alert("도로명주소를 입력하세요.");
			$("#roadaddress").focus();
			return false; 
		}
		if($("#jibunaddress").val()==""){
			alert("지번주소를 입력하세요.");
			$("#jibunaddress").focus();
			return false; 
		}
		if($("#detailaddress").val()==""){
			alert("상세주소를 입력하세요.");
			$("#detailaddress").focus();
			return false; 
		}
	});	
});
$(document).ready(function(){            
    var now = new Date();
    var year = now.getFullYear();
    var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
    var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());           
    //년도 selectbox만들기               
    for(var i = 1900 ; i <= year ; i++) {
        $('#year').append('<option value="' + i + '">' + i + '년</option>');    
    }

    // 월별 selectbox 만들기            
    for(var i=1; i <= 12; i++) {
        var mm = i > 9 ? i : "0"+i ;            
        $('#month').append('<option value="' + mm + '">' + mm + '월</option>');    
    }
    
    // 일별 selectbox 만들기
    for(var i=1; i <= 31; i++) {
        var dd = i > 9 ? i : "0"+i ;            
        $('#day').append('<option value="' + dd + '">' + dd+ '일</option>');    
    }
    $("#year  > option[value="+year+"]").attr("selected", "true");        
    $("#month  > option[value="+mon+"]").attr("selected", "true");    
    $("#day  > option[value="+day+"]").attr("selected", "true");       
  
});
</script>
</head>
<body>
	<h3>회원가입</h3>
	<f:form modelAttribute="NewMember" method="post" action="${cp}/member/join" id="JoinFrm">
		<table border="1">
		<tbody>
		<tr>
		<th>아이디</th>
		<td><f:input path="id" name="id" id="id" />
		<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N" >중복확인</button>
		</td>
		</tr>
		<tr>
		<th>비밀번호</th>
		<td><f:password path="password" name="password" id="password"/></td>
		</tr>
		<tr>
		<th>비밀번호 확인</th>
		<td><input type="password" name="password2" id="password2"/></td>
		</tr>
		<tr>
		<th>이름</th>
		<td><f:input path="name" name="name" id="name"/></td>
		</tr>
		<tr>
		<th>핸드폰 번호</th> 
		<td><f:select path="phone1" name="phone1" id="phone1">
                <option value="010">010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="070">070</option>
            </f:select>    
		-<f:input path="phone2" name="phone2" id="phone2"/>-<f:input path="phone3" name="phone3" id="phone3"/></td>
		</tr>
		<tr>
		<th>이메일</th>
		<td> <f:input path="email1" name="email1" id="email1"/>@<f:input path="email2" name="email2" id="email2"/>
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
		<th>성별</th>
		<td> <f:radiobutton path="gender" value="남성" id="gender"/> 남성  <f:radiobutton path="gender" value="여성" id="gender"/> 여성  </td>
		</tr>
		<tr>
		<th>생년월일</th>
		<td> <f:select path="birthyear" name="yy" id="year"/>년 <f:select path="birthmonth" name="mm" id="month"/>월  <f:select path="birthday" name="dd" id="day"/>일  </td>
		</tr>
		<tr>
		<th>우편번호</th> 
		<td><f:input path="zipcode" name="zipcode" id="zipcode" /> 
		<f:button type="button" onclick="findAddr()">우편변호 찾기</f:button></td>
		</tr>
		<tr>
		<th>주소</th> 
		<td><f:input path="roadaddress" name="roadaddress" id="roadaddress" />
		<f:input path="jibunaddress" name="jibunaddress" id="jibunaddress" /></td>
		</tr>
		<tr>
		<th>상세주소</th> 
		<td> <f:input path="detailaddress" name="detailaddress" id="address"/> </td>
		</tr>
		<tr>
		<td colspan="2" style="text-align:center;">
		<f:button type="submit">가입</f:button>
		<f:button type="reset">취소</f:button>
		</td>
		</tr>
		</tbody>
		</table>
	</f:form>
</body>
</html>