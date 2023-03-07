<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>W3.CSS Template</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
      body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
      }
      
      #container {
        position: relative;
        min-height: 100vh;
      }
      
      #header1 {
        height: 130px;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        background-color: #fff;
        z-index: 1;
      }
      
      #header2 {
        height: 70px;
        position: fixed;
        top: 130px;
        left: 0;
        width: 100%;
        background-color: #fff;
        z-index: 1;
      }
      
      #content {
        margin-top: 200px;
        margin-bottom: 100px;
      }
      
      #footer {
        height: 70px;
        position: fixed;
        bottom: 0;
        left: 0;
        width: 100%;
        background-color: #fff;
        z-index: 1;
      }
      
      table {
        width: 95%;
        margin: 0 auto;
        border: 1px solid #ccc;
        border-collapse: collapse;
      }
      
      tr {
        border: 1px solid #ccc;
      }
      
      td {
        border: 1px solid #ccc;
        padding: 10px;
      }
    </style>
  </head>
  <body>
    <div id="container">
      <div id="header1">
        <jsp:include page="../module/banner.jsp" flush="false"/>
      </div>
      <div id="header2">
        <jsp:include page="../module/top.jsp" flush="false"/>
      </div>
      <div id="content">
        <table>
          <tr>
            <td>
            
            
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
				<td><input type="number" id="desireQuantity" name="desireQuantity" placeholder="수량" min="0"/></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<input type="submit" value="구매 등록">
					<input type="reset" id="btnReset" value="취소">
				</td>
			</tr>
		</table>
	</form>
              
              
              
            </td>
          </tr>
        </table>
      </div>
      <div id="footer">
        <jsp:include page="../module/bottom.jsp" flush="false"/>
      </div>
    </div>
  </body>
</html>