<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
  <head>
 <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
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
      
      .table {
  display: table;
  border-collapse: collapse;
  width: 100%;
}

.row {
  display: table-row;
}

.cell {
  display: table-cell;
  padding: 10px;
  border: 1px solid black;
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
            
            
 
 
   게시물수:
  <select name="rowSize" id="rowSize">
		<option value="3">선택</option>
		<option value="3">3</option>
		<option value="5">5</option>
		<option value="10">10</option>
  </select>
  
  
  
 <c:set  var="goods_count" value="0" /> 
 <c:forEach var="message" items="${messageList}" begin="0" end="0">
  <div class="table">
  	<div class="cell">Message No</div>
  	<div class="cell">Title</div>
  	<div class="cell">content</div>
  	<div class="cell">Send ID</div>
  	<div class="cell">Receive ID</div>
  	
   <c:forEach var="purList" items="${PurList}">
   <c:set  var="goods_count" value="${goods_count+1 }" />
  	<div class="row">
    <div class="cell">${goods_count}</div>
    <div class="cell">${message.title}</div>
    <div class="cell">
    ${message.content}
          구매하신 상품명은 ${purList.goodsName} 이며 
          구매하신 사이즈는 ${purList.goodsSize} 이고,
          낙찰된 가격은 ${purList.desiredPurPrice} 입니다.
         구매자는 버튼을 누르시면 결재가 진행됩니다.
  		 <!-- 결제하기 버튼 생성 -->
    </div>
	    <div class="cell">${message.sendId}</div>
	    <div class="cell">${message.receiveId}</div>
    </div>
   </c:forEach>
  </div>
</c:forEach>
  </tbody>
 </table>   
            
              
              
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