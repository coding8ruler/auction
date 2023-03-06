<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="contextPath1" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
</head>
<body>
<%-- 컨트롤러에 의해서 아래와 같이 모델을 받았다 
 Article review
 model.addAttribute("review",review);--%>

  <h3>리뷰글수정(updateForm.jsp)</h3>
  <form id="updateForm" 
        action="${contextPath}/review/updateForm" method="post">
 	<input type="hidden" name="reviewNo" value="${review.reviewNo}"/>
   	<table border="1">
 	  <tbody>
 		<tr>
 		 <th>글번호</th>
 		 <td>${review.reviewNo}</td>
 		</tr>
 		<tr>
 		 <th>작성자</th>
 		 <td>${review.id}</td>
 		</tr>
 		 <tr>
	  	<th>별점</th>
	  		<td><label>
	  			<select name="starRating" id="starRating" required>
		  		 <option value="★★★★★">★★★★★</option>
			  		 <option value="★★★★☆">★★★★☆</option>
			  		 <option value="★★★☆☆">★★★☆☆</option>
			  		 <option value="★★☆☆☆">★★☆☆☆</option>
			  		 <option value="★☆☆☆☆">★☆☆☆☆</option>
	  	  		</select>
	  	  	</label>
	  	  </td>
	 	</tr>
 		<tr>
 		 <th>제목</th>
 		 <td><input type="text" name="reviewTitle" id="reviewTitle" required="required" value="${review.reviewTitle}"/></td>	
 		</tr>
 		<tr>
 		 <th>내용</th>
 		 <td><textarea name="reviewContent" id="reviewContent" cols="30" rows="5" required="required">${review.reviewContent}</textarea></td>	
 		</tr>
 		<tr>
 		 <td colspan="2" style="text-align:center;">
 		 <input type="submit" id="btnSubmit" value="수정"/>
 		 <input type="reset" id="btnReset" value="취소"/>	
 		 <input type="button" id="btn1"
 		     value="목록보기" onclick="location.href='${contextPath}/review/listForm?ano=${review.reviewNo}'"/>
		</td>	
 		</tr>
 	  </tbody>
  	</table>
  </form>
</body>
</html>