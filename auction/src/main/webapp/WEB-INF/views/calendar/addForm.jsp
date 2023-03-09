<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="conPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>addForm.jsp</h3>


<form id="insertFrm" 
  		method="post"
  		action="${conPath}/calendar/addForm">      
   	<table border="1">
 	  <tbody>
 		<tr>
 		 <th>제목</th>
 		 <td><input type="text" name="calenTitle" id="calenTitle" required="required"/></td>	
 		</tr>
 		<tr>
	     <th>시작일</th>
	     <td>
	        <input type="date" name="calenStart" id="calenStart"/>
	     </td>
	    </tr>
	    <tr>
	     <th>종료일</th>
	     <td>
        <input type="date"  name="calenEnd" id="calenEnd"/>
	     </td>
	    </tr>
 		<tr id="i1">
 		 <td colspan="2" style="text-align:center;">
 		 <input type="submit" value="등록"/>
 		 <input type="reset" id="btnReset" value="취소"/></td>	
 		</tr>
 	  </tbody>
  	</table>
  </form>
</body>
</html>