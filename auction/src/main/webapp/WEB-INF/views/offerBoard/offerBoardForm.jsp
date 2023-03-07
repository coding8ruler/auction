<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="cp" value="<%=request.getContextPath() %>" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구인게시판</title>
</head>
<body>


<h3>구인 게시판</h3>
<hr/>

	<form >
<table border="1">
	  <thead>
		  <tr>
		    <td>글번호</td>
		    <td>작성자ID</td>
		    <td>제목</td>
		    <td>거래 장소</td>
		    <td>급여</td>
		    <td>거래 일정</td>
		    <td>조회수</td>
		    <td>지원자수</td>
		  </tr>
	  </thead>
	  <tbody>

	  <c:forEach var="data" items="${offerBoard.contents}"> 
		  <tr>
		    <td>${data.offerno}</td>
		    <td>${data.id}</td>
		    <td>${data.offertitle}</td>
		    <td>${data.offerpoint}</td>
		    <td>${data.pay}</td>
		    <td>${data.wttime}</td>
		    <td>${data.viewcnt}</td>
		    <td>${data.offercnt}</td>
		     <td>${data.starttime}</td>
		  </tr>
		</c:forEach>  
	
		 <%-- paging출력 부분 --%>
   <tr>
  	<td colspan="5" style="text-align:center;">
     <%-- JSTL if조건문: 이전출력 --%>
     <c:if test="${offerBoard.startpage>5}">
       <a href="${cp}/offerBoard/offerBoardForm?pageNo=${offerBoard.startpage-5}">prev</a>
     </c:if>  
     <%-- JSTL forEch조건문: 페이지번호출력 --%>  
     <c:forEach var="pNo"                       
     			begin="${offerBoard.startpage}" 
     			end="${offerBoard.endpage}">
      <a href="${cp}/offerBoard/offerBoardForm?pageNo=${pNo}">${pNo}</a> 
     </c:forEach>  
                                      
     <%-- JSTL if조건문: 다음출력 --%>  
     <c:if test="${offerBoard.endpage<offerBoard.totalpages}">
       <a href="${cp}/offerBoard/offerBoardForm?pageNo=${offerBoard.startpage+5}">next</a>
     </c:if> 
   </td>
   </tr>
		
		
	  </tbody>
</table>

	 </form>
</body>
</html>