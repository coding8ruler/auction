<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberInfo</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/memberInfo.css" />
</head>
<body>
	<c:if test="${! empty AUTHUSER && (AUTHUSER.grade eq 1)}">    
	<%-- 일반user가 로그인했을 때 보여지는 메뉴 --%>
	<article class="info-c">
	<div>
 	<br>
 	<br>
	<h2>내정보</h2>
	<br>
	<br>
 	</div>
 	<div>
	<table class="info-t">
	<colgroup>
	<col width="30%"/>
	<col width="auto"/>
	</colgroup>
	<tbody>
	<tr>
     <td>이름</td>
		<td>${member.name}</td>
  	</tr>
  	<tr>
     <td>아이디</td>
		<td>${member.id}</td>
  	</tr>
  	<tr>
     <td>비밀번호</td>
		<td>${member.password}</td>
  	</tr>
  	<tr>
     <td>핸드폰 번호</td>
		<td>${member.phone1}-${member.phone2}-${member.phone3}</td>
  	</tr>
  	<tr>
     <td>이메일</td>
		<td>${member.email1}@${member.email2}</td>
  	</tr>
  	<tr>
     <td>성별</td>
		<td>${member.gender}</td>
  	</tr>
  	<tr>
     <td>생년월일</td>
		<td>${member.birthyear}년 ${member.birthmonth}월 ${member.birthday}일</td>
  	</tr>
  	<tr>
     <td>우편번호</td>
		<td>${member.zipcode}</td>
  	</tr>
  	<tr>
     <td>도로명주소</td>
		<td>${member.roadaddress}</td>
  	</tr>
  	<tr>
     <td>지번주소</td>
		<td>${member.jibunaddress}</td>
  	</tr>
  	<tr>
     <td>상세주소</td>
		<td>${member.detailaddress}</td>
  	</tr>
  	<tr>
     <td>가입일</td>
		<td><fmt:formatDate value="${member.register}" type="both" pattern="yy/MM/dd"/></td>
  	</tr>
	</tbody>
	</table>
	<br>
	<div class="info-btn">
		<button type="button" onclick="location.href='./update?id=${member.id}'">수정</button>
		<button type="button" onclick="location.href='./delete?id=${member.id}'">탈퇴</button>
	</div>
	<br>
	</div>
	</article>
	</c:if>
	
	<%-- 관리자가 로그인했을 때 보여지는 메뉴 --%>
	<c:if test="${not empty AUTHUSER && (AUTHUSER.grade==999)}">
	<article class="info-c">
	<div>
 	<br>
 	<br>
	<h2>회원정보</h2>
	<br>
	<br>
 	</div>
 	<div>
 	<table class="info-t">
	<colgroup>
	<col width="30%"/>
	<col width="auto"/>
	</colgroup>
	<tbody>
	<tr>
     <td>이름</td>
		<td>${member.name}</td>
  	</tr>
  	<tr>
     <td>아이디</td>
		<td>${member.id}</td>
  	</tr>
  	<tr>
     <td>핸드폰 번호</td>
		<td>${member.phone1}-${member.phone2}-${member.phone3}</td>
  	</tr>
  	<tr>
     <td>이메일</td>
		<td>${member.email1}@${member.email2}</td>
  	</tr>
  	<tr>
     <td>성별</td>
		<td>${member.gender}</td>
  	</tr>
  	<tr>
     <td>생년월일</td>
		<td>${member.birthyear}년 ${member.birthmonth}월 ${member.birthday}일</td>
  	</tr>
  	<tr>
     <td>우편번호</td>
		<td>${member.zipcode}</td>
  	</tr>
  	<tr>
     <td>도로명주소</td>
		<td>${member.roadaddress}</td>
  	</tr>
  	<tr>
     <td>지번주소</td>
		<td>${member.jibunaddress}</td>
  	</tr>
  	<tr>
     <td>상세주소</td>
		<td>${member.detailaddress}</td>
  	</tr>
  	<tr>
     <td>가입일</td>
		<td><fmt:formatDate value="${member.register}" type="both" pattern="yy/MM/dd"/></td>
  	</tr>
  	<tr>
     <td>회원등급</td>
		<td>${member.grade}</td>
  	</tr>
	</tbody>
	</table>
	<form>
	<input type="hidden" id='id' name='id' value='<c:out value="${member.id}"/>'>
	<input type="hidden" id='pageNum' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	<input type="hidden" id='amount' name='amount' value='<c:out value="${cri.amount}"/>'>
	</form>
	<br>
	<div class="info-btn">
		<button type="button" onclick="location.href='./update?id=${member.id}'">회원등급 변경</button>
		<button type="button" onclick="location.href='./list?pageNum=${cri.pageNum}&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}'">회원목록</button>
	</div>
	<br>
	</div>
	</article>
	</c:if>   
</body>
</html>