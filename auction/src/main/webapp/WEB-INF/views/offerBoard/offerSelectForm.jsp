<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="frm" uri="http://www.springframework.org/tags/form" %>  
<c:set var="CPATH" value="<%=request.getContextPath()%>"/>  
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
<!-- <style>
 .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style> -->
</head>
<body>
	
		<h3 style="text-align: center;">구인 게시글 (입력 폼)</h3>
		<hr>
		<form name="offerBoard2" id="offerBoard2" method="post" action="${CPATH}/offerBoard/offerSelectForm">
			<div class="tablemain">
			<br>
			<br>
			  <div class="table1">
			    	<div class="table-cell">글쓴이<br/>${sessionScope.AUTHUSER_ID}</div>
			    	<input type="hidden" name="id" id="id" value="${sessionScope.AUTHUSER_ID}" />
			  </div><br>
			  
			  <div class="table2">
			    	<div class="table-cell">구인 글제목<br/>
			    	<input type="text" name="offertitle" id="offertitle" />
			    	</div>
			  </div>
			
			  <div class="table3">
			   	 	<div class="table-cell">급여<br/>
			   	 	<input type="text" name="pay" id="pay"/>원
			   	 	</div>
			  </div>
			  
			   <div class="table4">
			   	 	<div class="table-cell">작성일<br/>
			   	 	<input type="date" name="wttime" id="wttime"/>
			   	 	</div>
			  </div>
			  
			    <div class="table5">
			   	 	<div class="table-cell">대행 시작일시<br/>
			   	 	<input type="date" name="starttime" id="starttime"/>
			   	 	</div>
			  </div>
			  
			   <div class="table6">
			    	<div class="table-cell">내용<br/>
			    	<textarea  name="offercontent" id="offercontent" cols="30" rows="5" ></textarea>
			    	</div>
			   </div>
			    
			  </div><br>
			  
			   <div class="table7">
			    	<div class="table-cell" >상세주소 텍스트(DB에 저장될 값or히든으로 좌표받아 저장할것)</div>
			    	<br/>
			    	<input type="text" name="offerpoint" id="offerpoint"/>
			  </div>
		 
			<!-- 지도 API 끝 -->
			<div class="table7"><input type="submit" value="작성 완료"/></div>
			
		 </form>
	
</body>
</html>