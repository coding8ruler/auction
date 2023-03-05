<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구인게시판</title>
</head>
<body>


<h3>구인게시판</h3>


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
	  <c:forEach var="data" items="${list}"> 
		  <tr>
		    <td>${data.offerno}</td>
		    <td>${data.id}</td>
		    <td>${data.offertitle}</td>
		    <td>${data.offerpoint}</td>
		    <td>${data.pay}</td>
		    <td>${data.offertime}</td>
		    <td>${data.viewcnt}</td>
		    <td>${data.offercnt}</td>
		  </tr>
		</c:forEach>  
		
		
		
		
	  </tbody>
</table>

	 </form>
</body>
</html>