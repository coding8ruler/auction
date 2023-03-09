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
</head>
<body>
	<c:if test="${! empty AUTHUSER && (AUTHUSER.grade eq 1)}">    
	<h3>내정보</h3>
	<hr>
	<%-- 일반user가 로그인했을 때 보여지는 메뉴 --%>
	<table border="1">
	<thead>
		<tr>
			<th>아이디</th><th>이름</th><th>비밀번호</th><th>번호</th><th>이메일</th><th>성별</th><th>우편번호</th><th>도로명주소</th><th>지번주소</th><th>상세주소</th><th>가입일</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>${member.id}</td>
			<td>${member.name}</td>
			<td>${member.password}</td>
			<td>${member.phone1}-${member.phone2}-${member.phone3}</td>
			<td>${member.email1}@${member.email2}</td>
			<td>${member.gender}</td>
			<td>${member.zipcode}</td>
			<td>${member.roadaddress}</td>
			<td>${member.jibunaddress}</td>
			<td>${member.detailaddress}</td>
			<td><fmt:formatDate value="${member.register}" type="both" pattern="yy년MM월dd일"/></td>
		</tr>	
	</tbody>
	</table>
	<span><a href="<%=request.getContextPath()%>/member/update?id=${member.id}">수정</a></span>
	<span><a href="<%=request.getContextPath()%>/member/delete?id=${member.id}">탈퇴</a></span>
	</c:if>
	<%-- 관리자가 로그인했을 때 보여지는 메뉴 --%>
	<c:if test="${not empty AUTHUSER && (AUTHUSER.grade==999)}">
	<h3>회원정보</h3>
	<hr>
	<table border="1">
	<thead>
		<tr>
			<th>아이디</th><th>이름</th><th>번호</th><th>이메일</th><th>성별</th><th>우편번호</th><th>도로명주소</th><th>지번주소</th><th>상세주소</th><th>가입일</th><th>회원등급</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>${member.id}</td>
			<td>${member.name}</td>
			<td>${member.phone1}-${member.phone2}-${member.phone3}</td>
			<td>${member.email1}@${member.email2}</td>
			<td>${member.gender}</td>
			<td>${member.zipcode}</td>
			<td>${member.roadaddress}</td>
			<td>${member.jibunaddress}</td>
			<td>${member.detailaddress}</td>
			<td><fmt:formatDate value="${member.register}" type="both" pattern="yy년MM월dd일"/></td>
			<td>${member.grade}</td>
		</tr>	
	</tbody>
	</table>
	<form>
	<input type="hidden" id='id' name='id' value='<c:out value="${member.id}"/>'>
	<input type="hidden" id='pageNum' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	<input type="hidden" id='amount' name='amount' value='<c:out value="${cri.amount}"/>'>
	</form>
	<button type="button" onclick="location.href='./update?id=${member.id}'">회원등급 변경</button>
	<button type="button" onclick="location.href='./list?pageNum=${cri.pageNum}&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}'">회원목록</button>
	</c:if>    
</body>
</html>