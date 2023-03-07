<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="PATH" value="<%=request.getContextPath()%>"/>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구인입력폼View</title>
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
	
		<h3 style="text-align: center;">구인 게시글 (입력 폼)</h3>
		<hr>
	<form name="offeraddform" id="offeraddform" method="get" action="${PATH}/offerBoard/offerInsert">
			<div class="tablemain">
			<br>
			<br>
			  <div class="table1">
			    	<div class="table-cell">글쓴이<br/>${sessionScope.AUTHUSER_ID}</div>
			    	<input type="hidden" name="id" id="id" value="${sessionScope.AUTHUSER_ID}" />
			  </div><br>
			  
			  <div class="table2">
			    	<div class="table-cell">구인 글제목<br/>
			    	<input type="text" name="offertitle" id="offertitle" >
			    	</div>
			  </div>
			
			  <div class="table3">
			   	 	<div class="table-cell">급여<br/>
			   	 	<input type="text" name="pay" id="pay">원
			   	 	</div>
			  </div>
			  
			   <div class="table4">
			   	 	<div class="table-cell">작성일<br/>
			   	 	<input type="date" name="wttime" id="wttime">
			   	 	</div>
			  </div>
			  
			    <div class="table5">
			   	 	<div class="table-cell">대행 시작일시<br/>
			   	 	<input type="date" name="starttime" id="starttime">
			   	 	</div>
			  </div>
			  
			   <div class="table6">
			    	<div class="table-cell">내용<br/>
			    	<textarea name="offercontent" id="offercontent" cols="30" rows="5" ></textarea>
			    	</div>
			   </div>
			    
			    <div class="table7">
			    	<div class="table-cell">장소<br/>
			    	<input type="text" name="offerpoint" id="offerpoint">
			    	</div>
			   </div>
			   
			    	
			  </div><br>
			  
			   <div class="table8">
			    	<div class="table-cell" id="clickLatlng">상세주소 텍스트(DB에 저장될 값or히든으로 좌표받아 저장할것)</div>
			  </div>
		 
	
	 	
	 					 <!-- 지도 API -->
	
<div class="map_wrap">
    <div id="map" style="width:50%;height:100%;position:relative;overflow:hidden;"></div>
    <div class="hAddr">
        <span class="title">지도중심기준 행정동 주소정보</span>
        <span id="centerAddr"></span>
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=adb3e49fb0df763233b74e5e8c1f9298&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 1 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
            
            var content = '<div class="bAddr">' +
                            '<span class="title">법정동 주소정보</span>' + 
                            detailAddr + 
                        '</div>';

            // 마커를 클릭한 위치에 표시합니다 
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);

            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
            infowindow.setContent(content);
            infowindow.open(map, marker);
        }   
    });
});

// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});

function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');

        for(var i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                break;
            }
        }
    }    
}
</script>
</div>
			<!-- 지도 API 끝 -->
			<div class="table7"><input type="submit" name="" id="" value="작성 완료"></div>
			
		 </form>
	
</body>
</html>