<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<%@ page session="false" %>
<!DOCTYPE html>
<head>
	<title>리뷰게시판 글목록</title>
</head>
<body>
<h2>리뷰 목록</h2>
<p>*전체 게시물수 : ${totalCnt}</p>
<table border=1>
    <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>별점</th>
            <th>작성일</th>
            <th>조회수</th>
            <!-- <th>추천수</th> -->
        </tr>
    </thead>
    <tbody>
         <c:forEach var="data" items="${list}">
            <tr>
                <td>${data.reviewNo}</td>
                <td><a href="${contextPath}/review/detailForm?ano=${data.reviewNo}">${data.reviewTitle}</a></td>
				<td>${data.id}</td>
                <td>${data.starRating}</td>
                <td>${data.reviewDate}</td>
                <td>${data.viewCnt}</td>
               <%--  <td>${review.recommendCnt}</td> --%>
            </tr>
		</c:forEach>
    </tbody>
</table>
	<button type="button" onclick="location.href='${contextPath}/review/addForm'">글쓰기</button>
<%-- <c:if test="${not empty AUTHUSER_ID}">
	<button type="button" onclick="location.href='${contextPath}/review/addForm'">글쓰기</button>
</c:if> --%>
  </body>
</html>
