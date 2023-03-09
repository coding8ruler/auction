<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cp" value="<%=request.getContextPath()%>"/>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateFrm</title>
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
$(function(){
	$("#email_op").change(function(){
		let val = $("select#email_op option:selected").val();
		$("#email2").val(val);
	});
});
</script>
</head>
<body>
	<%-- 일반user가 로그인했을 때 보여지는 메뉴 --%>
	<c:if test="${! empty AUTHUSER && (AUTHUSER.grade eq 1)}">
	<h3>내정보 수정</h3>
	<hr/>
	<f:form modelAttribute="NewMember" method="post" action="./update">
	<table border="1">
	 <f:hidden path="id" name="id" value="${member.id}"/>
	 	<tr>
		<th>아이디</th>
		<td>${member.id}</td>
		</tr>
		<tr>
		<th>비번</th>
		<td><f:password path="password" name="password" value="${member.password}"/></td>
		</tr>
		<tr>
		<th>이름</th>
		<td><f:input path="name" name="name" value="${member.name}"/></td>
		</tr>
		<tr>
		<th>핸드폰 번호</th> 
		<td><f:select path="phone1" name="phone1" id="phone1" value="${member.phone1}">
                <option value="010">010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="070">070</option>
            </f:select>    
		-<f:input path="phone2" name="phone2" id="phone2" value="${member.phone2}"/>-<f:input path="phone3" name="phone3" id="phone3" value="${member.phone3}"/></td>
		</tr>
		<tr>
		<th>이메일</th>
		<td> <f:input path="email1" name="email1" id="email1" value="${member.email1}"/>@<f:input path="email2" name="email2" id="email2" value="${member.email2}"/>
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
		<td>${member.gender}</td>
		</tr>
		<tr>
		<th>생년월일</th>
		<td>${member.birthyear}년 ${member.birthmonth}월 ${member.birthday}일</td>
		</tr>
		<tr>
		<th>우편번호</th>
		<td><f:input path="zipcode" name="zipcode" value="${member.zipcode}"/>
		<f:button type="button" onclick="findAddr()">우편변호 찾기</f:button></td></td>
		</tr>
		<tr>
		<th>도로명주소</th>
		<td><f:input path="roadaddress" name="roadaddress" value="${member.roadaddress}"/></td>
		</tr>
		<tr>
		<th>지번주소</th>
		<td><f:input path="jibunaddress" name="jibunaddress" value="${member.jibunaddress}"/></td>
		</tr>
		<tr>
		<th>상세주소</th>
		<td><f:input path="detailaddress" name="detailaddress" value="${member.detailaddress}"/></td>
<!--    <p>회원등급 : <f:input path="grade" name="grade" id="grade" value="${member.grade}"/>	-->
		<tr>
		<td colspan="2" style="text-align:center;">
		<f:hidden path="grade" name="grade" id="grade" value="${member.grade}"/>
		<f:button type="submit">수정</f:button>
		</tr>
	</table>	
	</f:form>
	</c:if>
	<%-- 관리자가 로그인했을 때 보여지는 메뉴 --%>
	<c:if test="${not empty AUTHUSER && (AUTHUSER.grade==999)}">
	<h3>회원등급 변경</h3>
	<hr/>
	 <f:form modelAttribute="NewMember" method="post" action="./update">
	 <table border="1">
	 	<tr>
		<th>아이디</th>
		<td>${member.id} <input type="hidden" name="id" value="${member.id}"/></td>
		</tr>
<!-- 	<p>비번 : <f:password path="password" name="password" value="${member.password}"/> -->
		<f:hidden path="password" name="password" id="password" value="${member.password}"/>
		<tr>
		<th>이름</th>
		<td>${member.name} <input type="hidden" name="name" value="${member.name}"/></td>
		</tr>
		<tr>
		<th>전화번호</th>
		<td>${member.phone1}-${member.phone2}-${member.phone3} <input type="hidden" name="phone1" value="${member.phone1}"/> <input type="hidden" name="phone2" value="${member.phone2}"/> <input type="hidden" name="phone3" value="${member.phone3}"/></td>
		</tr>
		<tr>
		<th>이메일</th>
		<td>${member.email1}@${member.email2}<input type="hidden" name="email1" value="${member.email1}"/> <input type="hidden" name="email2" value="${member.email2}"/></td>
		</tr>
		<tr>		
		<th>성별</th>
		<td>${member.gender} <input type="hidden" name="gender" value="${member.gender}"/></td>
		</tr>
		<tr>
		<th>생년월일</th>
		<td>${member.birthyear}년 ${member.birthmonth}월 ${member.birthday}일 <input type="hidden" name="birthyear" value="${member.birthyear}"/> <input type="hidden" name="birthmonth" value="${member.birthmonth}"/> <input type="hidden" name="birthday" value="${member.birthday}"/></td>
		</tr>
		<tr>
		<th>우편번호</th>
		<td>${member.zipcode} <input type="hidden" name="zipcode" value="${member.zipcode}"/></td>
		</tr>
		<tr>
		<th>도로명주소</th>
		<td>${member.roadaddress} <input type="hidden" name="roadaddress" value="${member.roadaddress}"/></td>
		</tr>
		<tr>
		<th>지번주소</th>
		<td>${member.jibunaddress} <input type="hidden" name="jibunaddress" value="${member.jibunaddress}"/></td>
		</tr>
		<tr>
		<th>상세주소</th> 
		<td>${member.detailaddress} <input type="hidden" name="detailaddress" value="${member.detailaddress}"/></td>
		</tr>
		<tr>
		<th>회원등급</th>
		<td><f:input path="grade" name="grade" id="grade" value="${member.grade}"/></td>
		</tr>
		<tr>
		<td colspan="2" style="text-align:center;">
		<f:button type="button" onclick="location.href='./info?id=${member.id}'">취소</f:button>
		<f:button type="submit">수정</f:button>
		</tr>
	</table>
	</f:form>
	</c:if>
</body>
</html>