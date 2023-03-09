<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<title>일정관리 할 테이블</title>
</head>
<body>
<h2>전체 조회, 입력, 수정, 삭제를 수행할 테이블</h2>
 <h3>resultView.jsp</h3>
  *전체 게시물 : ${list}<br/>
  
  *전체 : ${list}<br/><br/>
   <c:forEach var="data" items="${list}">
   ${data.calenNo} / ${data.calenTitle} / ${data.calenStart} / ${data.calenEnd} /
   <button type="button" 
    onclick="location.href='${conPath}/calendar/updateForm?ano=${data.calenNo}'">수정하기</button>
   <button type="button" 
    onclick="location.href='${conPath}/calendar/delete?ano=${data.calenNo}'">삭제하기</button>
   <br/>	
   </c:forEach>
    <button type="button" onclick="location.href='${conPath}/calendar/addForm'">일정 등록</button>
	<table border="1">
 	 <thead>
  		<tr>
	  	 <th>번호</th>
	  	 <th>제목</th>
	  	 <th>시작일</th>
	  	 <th>종료일</th>
	  	 <th>비고(수정,삭제)</th>
  		</tr>
 	 </thead>
  	<tbody>
  <!--  JSTL forEach반복문이용하여 출력시작 
      for(int i=1; i<=10;i++){ syso(i) } //1 2 3.. 9 10
      for(타입 변수명 : 컬렉션명){ syso(변수명) }
    -->
   <c:forEach  var="data" items="${list}">
 	 <tr>
 	  <td>${data.calenNo}</td>
 	  <td>${data.calenTitle}</td>
 	  <td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${data.calenStart}"/></td>
 	  <td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${data.calenEnd}" /></td>
 	  <td><button type="button" 
    onclick="location.href='${conPath}/calendar/updateForm?ano=${data.calenNo}'">수정하기</button>
   <button type="button" 
    onclick="location.href='${conPath}/calendar/delete?ano=${data.calenNo}'">삭제하기</button>
   <br/></td>
 	 </tr>
 	 </c:forEach>
 <!--    반복문이용하여 출력끝-->
   </tbody> 
   </table> 
</body>
</html>