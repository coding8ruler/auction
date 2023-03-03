<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
  <head>
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
  
  #mainHeader {
    height: 130px;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    background-color: #fff;
    z-index: 1;
  }
  
  #subHeader {
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
  
  #mainFooter {
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
/* Main styles */
main {
	max-width: 800px;
	margin: 20px auto;
	padding: 10px;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

.auction-details {
	flex-basis: 60%;
	margin-bottom: 20px;
}

.auction-details h2 {
	margin-top: 0;
}

.auction-details p {
	margin: 5px 0;
}

.auction-details form {
	margin-top: 20px;
}

.auction-details label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

.auction-details input[type="number"] {
	padding: 5px;
	border-radius: 5px;
	border: 1px solid #ccc;
	width: 100%;
	box-sizing: border-box;
	margin-bottom: 10px;
}

.auction-details button[type="submit"] {
	background-color: #4CAF50;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.auction-details button[type="submit"]:hover {
	background-color: #3e8e41;
}

.auction-history {
	flex-basis: 38%;
}

.auction-history h2 {
	margin-top: 0;
	margin-bottom: 10px;
}

.auction-history table {
	width: 100%;
	border-collapse: collapse;
}

.auction-history table th, .auction-history table td {
	padding: 5px;
	text-align: left;
}

.auction-history table th {
	background-color: #f2f2f2;
}

.auction-history table tr:nth-child(even) {
	background-color: #f2f2f2;
}

.auction-history table tr:hover {
	background-color: #ddd;
}
  
    </style>
    <script>
 // JavaScript 코드
   /*  const sizeSelect = document.querySelector('#size-select');
    const priceSpan = document.querySelector('#price');

    $(document).ready(function(){
    	$("#sizeSelect").change(function(){
      alert("asd");
    		const selectedSize = sizeSelect.value;
      const selectedPrice = prices[selectedSize];
      priceSpan.textContent = `$${selectedPrice}`;
    });
    }); */
    
    $(document).ready(function(){
    	  $("#size-select").change(function(){
    	    alert("asd");
    	  });
    	});
    
    </script>
  </head>
  <body>
    <div id="container">
      <div id="mainHeader">
        <jsp:include page="../module/banner.jsp" flush="false"/>
      </div>
      <div id="subHeader">
        <jsp:include page="../module/top.jsp" flush="false"/>
      </div>
      <div id="content">
        <table>
          <tr>
            <td>
              



${goodsInfo}
<!-- mv.addObject("goodsInfo",goodsInfo);
 goodsInfo[ProductDTO [goods=test, goodsName=test, color=tes, 
 goodsContent=test, firstPrice=32, imageNo=0, releaseDate=Wed Mar 29 00:00:00 KST 2023, goodsSize=null, image=null], 
  -->
  
  
   <main>
   	<div class="auction-details" style="text-align: center;">
			<img src="${path}/download?goods=${goodsInfo.goods}">
		</div>
		<section class="auction-details">
			<h2>상품명 : ${goodsInfo.goodsName}</h2>
			<p>모델명: ${goodsInfo.goods}</p>
			<p>출시일 : ${goodsInfo.releaseDate}</p>
			<p>출시가격: ${goodsInfo.firstPrice}</p>
				<div>
  <label for="size-select">Size:</label>
  <select id="size-select">
    <option value="S">S</option>
    <option value="M">M</option>
    <option value="L">L</option>
  </select>
  <span id="price">re</span>
</div>
		</section>
		
		
		<section class="auction-history">
	<div id="price22">	
			<h2>Bidding History</h2>
			<table>
				<thead>
					<tr>
						<th>Bidder</th>
						<th>Amount</th>
						<th>Date/Time</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>John Doe</td>
						<td>$150.00</td>
						<td>2023-03-06 08:30:00</td>
					</tr>
					<tr>
						<td>Jane Smith</td>
						<td>$140.00</td>
						<td>2023-03-04 11:15:00</td>
					</tr>
					<tr>
						<td>David Lee</td>
						<td>$130.00</td>
						<td>2023-03-02 14:20:00</td>
					</tr>
				</tbody>
			</table>
	</div>
		</section>
	
	
	<c:forEach var="imageFileName" items="${map.fileList}">
		<div class="auction-details" style="text-align: center;">
			<img src="${path}/download2?goods=${goodsInfo.goods}">
		</div>
	</c:forEach>
		
	</main>






            </td>
          </tr>
        </table>
      </div>
      <div id="mainFooter">
        <jsp:include page="../module/bottom.jsp" flush="false"/>
      </div>
    </div>
  </body>
</html>