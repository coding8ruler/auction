<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>셀렉해 보여주기 폼View</title>
<style>
	
  .tablemain {
    display: table;
    margin: auto;
    width: 50%;
  }
  .table1 {
    display: table-row;
  }
   .table2 {
    display: table-row;
  }
   .table3 {
    display: table-row;
  }
   .table4 {
    display: table-row;
  }
   .table5 {
    display: table-row;
  }
  .table-cell {
    display: table-cell;
    padding: 10px;
    border: 1px solid gray;
  }
  .table6 {
    display: table-row;
  }
    .table7 {
    display: table-row;
    text-align: center;
  }
</style>
<style>
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style>

</head>
<body>
	
		<h3 style="text-align: center;">구인 게시글 (저장된 게시글  셀렉해 보여주기 폼)</h3>
		<hr>
	<form>
			<div class="tablemain">
			<br>
			<br>
			  <div class="table1">
			    	<div class="table-cell">사용자 ID 및 정보(글쓴이정보DB에서 셀렉해옴)</div>
			  </div><br>
			  
			  <div class="table2">
			    	<div class="table-cell">구인게시글제목(DB에저장된값 셀렉 출력)<br/>
			    	</div>
			  </div>
			
			  <div class="table3">
			   	 	<div class="table-cell">급여(DB에저장된값 셀렉 출력)<br/>원
			   	 	</div>
			  </div>
			  
			   <div class="table4">
			   	 	<div class="table-cell">근무 일시(DB에저장된값 셀렉 출력)<br/>
			   	 	</div>
			  </div>
			  
			    <div class="table5">
			   	 	<div class="table-cell">근무 시간(DB에저장된값 셀렉 출력)<br/>
			   	 	<input type="time" value="13:10" min="13:00" max="15:00">
			   	 	</div>
			  </div>
			  
			   <div class="table6">
			    	<div class="table-cell">본문 TEXT(DB에저장된값 셀렉 출력)<br/>
			    	<input type="text" id="offermainText">
			    	</div>
			    	
			  </div><br>
			  
			   <div class="table7">
			    	<div class="table-cell" id="">지도 포인터의 주소 위치(DB에저장된값 셀렉 출력)</div>
			  </div>
	 
	 
	 					 <!-- 지도 API -->
	 <!-- 이미지 지도를 표시할 div 입니다 -->
	<div id="map" style="width:100%;height:350px;"></div>

	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=adb3e49fb0df763233b74e5e8c1f9298"></script>
	<script>
		var staticMapContainer  = document.getElementById('map'), // 이미지 지도를 표시할 div 
		    staticMapOption = {
		        center: new kakao.maps.LatLng(37.56797, 126.97800), // 이미지 지도의 중심 좌표
		        level: 4, // 이미지 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		   };
		    
		// 이미지 지도를 생성한다
		var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
		
		// 지도에 마커를 생성하고 표시한다
		var marker = new kakao.maps.Marker({
		    position: new kakao.maps.LatLng(37.56797, 126.97800), // 마커의 좌표
		    map: map
		// 마커를 표시할 지도 객체
		});
		    
	</script>
			<!-- 지도 API 끝 -->
			
			<div class="table7"><button>지원하기 버튼</button></div>
		</div>
	</form>
</body>
</html>