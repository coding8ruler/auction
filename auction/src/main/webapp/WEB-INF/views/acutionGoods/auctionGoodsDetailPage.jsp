<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
  
  
  
    /* 탭 메뉴 스타일 */
  .tabs {
    list-style: none;
    margin: 0;
    padding: 0;
  }

  .tabs li {
    display: inline-block;
    margin: 0;
    padding: 0;
  }

  .tabs a {
    display: block;
    background-color: #ccc;
    color: #333;
    padding: 10px 20px;
    text-decoration: none;
  }

  .tabs a:hover {
    background-color: #aaa;
    color: #fff;
  }

  .tabs .active a {
    background-color: #fff;
    color: #333;
  }

  /* 탭 내용 스타일 */
  .tab_container {
    border: 1px solid #ccc;
    padding: 20px;
  }

  .tab_content {
    display: none;
  }

  .tab_content.active {
    display: block;
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
    
    // 탭 메뉴 구현
   $(document).ready(function() {

	//When page loads...
	$(".tab_content").hide(); //Hide all content
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content

	//On Click Event
	$("ul.tabs li").click(function() {

		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content

		var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active ID content
		return false;
	});

});
    
    // -----------------------------------------------------
	// 시작 시간 (2023년 3월 3일 12시 0분 0초)
	var startTime = new Date('March 6, 2023 12:00:00').getTime();

	var x = setInterval(function() {
		// 현재 시간
		var now = new Date().getTime();

		// 남은 시간 계산
		var distance = startTime - now;

		// 일, 시, 분, 초 계산
		var days = Math.floor(distance / (1000 * 60 * 60 * 24));
		var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
		var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
		var seconds = Math.floor((distance % (1000 * 60)) / 1000);

		// 결과 출력
		document.getElementById("timer").innerHTML = days + "d " + hours + "h "
		+ minutes + "m " + seconds + "s ";

		// 시간이 지난 경우
		if (distance < 0) {
			clearInterval(x);
			document.getElementById("timer").innerHTML = "EXPIRED";
		}
	}, 1000); // 1초마다 업데이트

	
	
	function productAddForm(){
		
	}
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
${goodsImageInfo}
<!-- mv.addObject("goodsInfo",goodsInfo);
 goodsInfo[ProductDTO [goods=test, goodsName=test, color=tes, 
 goodsContent=test, firstPrice=32, imageNo=0, releaseDate=Wed Mar 29 00:00:00 KST 2023, goodsSize=null, image=null], 
  -->
  
   <div id="timer"></div>
  
   <main>
   
   <div style="display: flex; justify-content: center; align-items: center;">
   	<div>
   		<img src="${path}/download?goods=${goodsInfo.goods}"  style="display: inline-block; vertical-align: top;">
			<ul  style="display: inline-block; margin-left: 10px; vertical-align: top;">
				<li>상품명 : ${goodsInfo.goodsName}</li>
				<li>모델명: ${goodsInfo.goods}</li>
				<li>출시일 : ${goodsInfo.releaseDate}</li>
				<li>출시가격: ${goodsInfo.firstPrice}</li>
				<li>
					<label for="size-select">Size:</label>
		  <select name="size-select"id="size-select">
					<c:forEach var="item" items="${goodsSizeInfo}">
					<option value="${item.goodsSize}">${item.goodsSize}</option>
					</c:forEach>			
			</select>
				  <span id="price">re</span>
				</li>
				<li>
				<button onclick="location.href='${path}/productAddForm?goodsSize=' + document.getElementById('size-select').value + '&goods=${goodsInfo.goods}'" value="판매하기"></button>
				</li>
				<li>
				  <a href="">구매하기 </a>
				</li>
			</ul>
	   </div>		
   </div>
   
   
   
   
   
 <div id="container">
		<ul class="tabs">
			<li><a href="#tab1">제품상세내용</a></li>
			<li><a href="#tab2">판매내역</a></li>
			<li><a href="#tab3">구매내역</a></li>
			<li><a href="#tab4">최근 거래가</a></li>
		</ul>
		<div class="tab_container">
			<div class="tab_content" id="tab1">
				<h4>제품상세내용</h4>
				<p>${goodsInfo.goodsContent}</p>
				<%-- 상품이미지목록 반복출력시작 --%>
				<c:forEach var="goodsImageInfo" items="${goodsImageInfo}">
					<div class="auction-details" style="text-align: center;">
						<img src="${path}/download2?goods=${goodsInfo.goods}&imageName=${goodsImageInfo.image}" style="width:660px;">
					</div>
				</c:forEach>
				<%-- 상품이미지목록 반복출력끝 --%>
			</div>
			
			<div class="tab_content" id="tab2">
				<h4>판매내역</h4>
				
	<div style="display: flex; justify-content: center; align-items: center;">
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
						</tbody>
					</table>
			</div>
		</section>
	</div>	
				 
				 
			</div>
			
			
<div class="tab_content" id="tab3">
				<h4>구매내역</h4>
				
	<div style="display: flex; justify-content: center; align-items: center;">
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
						</tbody>
					</table>
			</div>
		</section>
	</div>	
</div>
			
			
<div class="tab_content" id="tab4">
	<h4>최근 거래가</h4>
			
	<div style="display: flex; justify-content: center; align-items: center;">
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
						</tbody>
					</table>
			</div>
		</section>
	</div>	
				
				
			</div>
		</div>
	</div>

   
   
   
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