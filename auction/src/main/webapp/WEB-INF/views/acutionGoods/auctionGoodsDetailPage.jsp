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
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
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
    
	function sizeSearch(goodsSize) {
		  // user가 입력한 값 가져오기
		  let goods = document.getElementById("goodsId").value;

		  $.ajax({
		    type: "GET", // 요청방식.
		    async: "true", // 기본값은 true.(true이면 비동기식방식)
		    url: "${path}/sizeSearch",
		    data: { goodsSize: goodsSize, goods: goods }, // 서버로 전송할 데이터. 예){name:"홍GD"}
		    success: function (data, status, xhr) {
		      let jsonInfo = JSON.parse(data);

		      let goodsSellObj = jsonInfo;
		      let table =
		        "<table><thead><tr><th>판매자명</th><th>상품명</th><th>판매시작가</th><th>판매시작일</th><th>판매종료일</th><th>구매목록 보기</th><th>구매하기</th><th>남은 시간</th></tr></thead><tbody>";
		        var tab2Link = document.querySelector('a[href="#tab2"]');

		      for (let i = 0; i < goodsSellObj.goodsSell.length; i++) {
		        let goods = goodsSellObj.goodsSell[i];
		        let startTimeFormatted = moment(goods.startTime).format("MM-DD HH:mm:ss");
		        let endTimeFormatted = moment(goods.endTime).format("MM-DD HH:mm:ss");

		        // 남은 시간 계산
		        let now = moment().valueOf();
		        let distance = moment(goods.endTime).valueOf() - now;

		        // 일, 시, 분, 초 계산
		        let days = Math.floor(distance / (1000 * 60 * 60 * 24));
		        let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
		        let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
		        let seconds = Math.floor((distance % (1000 * 60)) / 1000);

		        // 결과 출력
		        let countdownText = days + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초";
		        table +=
		        		"</td><td>" +
		        	  goods.id +
		        	  "</td><td>" +
		        	  goods.goods +
		        	  "</td><td>" +
		        	  goods.desiredSellPrice +
		        	  "</td><td>" +
		        	  startTimeFormatted +
		        	  "</td><td>" +
		        	  endTimeFormatted +
		              "</td><td> <button  id=find onclick='selectPurList(" + goods.sellNo + ")'>구매목록보기</button>" +
		              "</td><td> <button  onclick='purInsert(" + '"' + goods.goods + '"' + "," + '"' + goods.itemSize + '"' + ")'>구매하기</button>" +
		              "</td><td><span class='countdown' data-time='" +
		              distance +
		              "'>" +
		              countdownText +
		              "</span></td></tr>";
		      }

		      table += "</tbody></table>";
		      document.getElementById("tableContainer").innerHTML = table;
		      
		   // 카운트 다운 실행
		   		
		      let countdowns = document.getElementsByClassName("countdown");
		      for (let i = 0; i < countdowns.length; i++) {
		        let countdown = countdowns[i];
		        let distance = countdown.getAttribute("data-time");
		        let timer = setInterval(function() {
		          // 현재 시간
		          let now = new Date().getTime();
		          
		          // 남은 시간 계산
		          distance = distance - 1000;

		          // 일, 시, 분, 초 계산
		          let days = Math.floor(distance / (1000 * 60 * 60 * 24));
		          let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
		          let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
		          let seconds = Math.floor((distance % (1000 * 60)) / 1000);

		          // 결과 출력
		          countdown.innerHTML = days + "일" + hours + "시"
		          + minutes + "분" + seconds + "초 ";

		          // 시간이 지난 경우
		          if (distance < 0) {
		            clearInterval(timer);
		            countdown.innerHTML = "경매시간 종료";
		          }
		        }, 1000); // 1초마다 업데이트
		      }
		    
		      tab2Link.click();
		    }
		  });
	}
    
    
    
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
    
   function purInsert(goods,itemSize){
	   alert(goods+" / "+itemSize);
	   window.location.href = "${path}/productBuyForm?goods=" + goods + "&goodsSize=" + itemSize;
	 }
    
   function selectPurList(sellNo){
	   var tab3Link = document.querySelector('a[href="#tab3"]');
	   $.ajax({
		    type: "GET", // 요청방식.
		    async: "true", // 기본값은 true.(true이면 비동기식방식)
		    url: "${path}/sellNoSearch",
		    data: {sellNo: sellNo}, // 서버로 전송할 데이터. 예){name:"홍GD"}
		    success: function (data, status, xhr) {
	    	  let jsonInfo = JSON.parse(data);

		      let sellNoObj = jsonInfo;
			      
		      let table ="<table><thead><tr><th>구매자명</th><th>제품명</th><th>낙찰희망가</th><th>사이즈</th><th>희망수량</th></tr></thead><tbody>";

			      for (let i = 0; i < sellNoObj.sellNoSearch.length; i++) {
			        let goods = sellNoObj.sellNoSearch[i];
			        // 결과 출력
			        table +=
			        		"<td>" +
			        	  goods.id +
			        	  "</td><td>" +
			        	  goods.goodsName +
			        	  "</td><td>" +
			        	  goods.desiredPurPrice +
			        	  "</td><td>" +
			        	  goods.goodsSize +
			        	  "</td><td>" +
			        	  goods.desireQuantity +
			        	  "</td></tr>";
			      }
			      table += "</tbody></table>";
			      document.getElementById("purchTableContainer").innerHTML = table;
			      tab3Link.click();
		    }
	    });
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
  
   <!-- <div id="timer"></div> -->
  
   <main>
   <form>
   	<input type="text" disabled="disabled" id="goodsId" value="${goodsInfo.goods}">
   </form>
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
		  <select name="size-select" id="size-select" onchange="sizeSearch(this.value)">
		  			<option value="">사이즈 선택</option>
					<c:forEach var="item" items="${goodsSizeInfo}">
						<option value="${item.goodsSize}">${item.goodsSize}</option>
					</c:forEach>			
			</select>
				</li>
				<li>
				<button onclick="location.href='${path}/productAddForm?goodsSize=' + document.getElementById('size-select').value + '&goods=${goodsInfo.goods}'" >판매하기</button>
				<button onclick="selectPurList()">구매목록보기</button>
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
	<div style="display: flex; justify-content: center; align-items: center;">
		<section class="auction-history">
			<div id="price22">	
					<h2>경매 판매품 리스트</h2>
					<div id="tableContainer"></div>
			</div>
		</section>
	</div>	
</div>
			
<div class="tab_content" id="tab3">
	<div style="display: flex; justify-content: center; align-items: center;">
		<section class="auction-history">
			<div id="price22">	
					<h2>낙찰 리스트</h2>
					<div id="purchTableContainer"></div>
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
    
    <script>
		    document.addEventListener("load", function() { 
		 	   const button = document.getElementById("find");
		 	   const link = document.querySelector('a[href="#tab3"]');
		 	   
		 	   button.addEventListener("click", function() {
		 	     link.click();
		 	   });
		 	 });
    </script>
    
  </body>
</html>