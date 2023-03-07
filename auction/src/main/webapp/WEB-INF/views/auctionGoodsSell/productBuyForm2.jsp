<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${contextPath}/productBuy" method="post">
		<table border="1">
			<tr>
				<td>모델명</td>
				<td>
					<input type="text" value="${product.goods}" name="goodsName" id="goodsName" readonly="readonly"/>
					<input type="hidden" value="${product.sellNo}" name="sellNo" id="sellNo" readonly="readonly"/>
				</td>
			</tr>		
			<tr>
				<td>사이즈</td>
				<td><input type="text" value="${product.itemSize}" name="GoodsSize" id="GoodsSize" readonly="readonly"/></td>
			</tr>		
			<tr>
				<td>아이디명</td>
				<td><input type="text" value="${sessionScope.AUTHUSER_ID}" name="id" id="id" readonly="readonly"/></td>
			</tr>		
			<tr>
				<td>낙찰 희망가</td>
				<td><input type="text" id="desiredPurPrice" name="desiredPurPrice" pattern="[0-9]+" title="숫자만 입력해주세요." placeholder="숫자만 입력해주세요."></td>
			</tr>		
			<tr>
				<td>구매 수량</td>
				<td><input type="number" id="desireQuantity" name="desireQuantity" placeholder="수량"/></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<input type="submit" value="구매 등록">
					<input type="reset" id="btnReset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>











