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
    width: 30%;
    text-align: center;
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
  .table8 {
    display: table-row;
    text-align: center;
  }
  
  
</style>
<!-- <script type="text/javascript">
$(document).ready(function(){
	  $("#offersave").click(function(){
	    let hiddenID = $("#id").val();
	    if (hiddenID !== "") {
	      alert("작성 실패, 재로그인이 필요합니다.");
	      return false;
	    } else {
	      alert("작성 완료");
	      //offerno++;
	      //document.getElementById("offerno").value = offerno;
	      return true;
	    }
	  });
	});
</script> -->
<!-- <script type="text/javascript">
function incrementOfferno() {
	  
	  offerno++;
	  document.getElementById("offerno").value = offerno;
	}
${offerBoard.offerno}

</script> -->
</head>
<body>
	
		<h3 style="text-align: center;">구인 게시글 (입력 폼)</h3>
		<hr>
		<form name="offerBoardfrm" id="offerBoardfrm" method="get" action="${CPATH}/offerBoard/offerInsertForm1">
			<div class="tablemain">
			<br>
			<br>
			  <div class="table1">
			    	<div class="table-cell">글쓴이<br/>${sessionScope.AUTHUSER_ID}
			    <!-- 	<input type="hidden" name="offerno" id="offerno" /> -->
			    	<input type="hidden" name="id" id="id" value="${sessionScope.AUTHUSER_ID}" />
			  <br></div>
			  </div>
			  
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
			   	 	<input type="datetime-local" name="starttime" id="starttime"/>
			   	 	</div>
			  </div>
			  
			   <div class="table6">
			    	<div class="table-cell">내용<br/>
			    	<textarea  name="offercontent" id="offercontent" cols="30" rows="5" ></textarea>
			    	</div>
			   </div>
			    
			  <br>
			   <div class="table7">
			    	<div class="table-cell" >상세주소
			    	<br/>
			    	<input type="text" name="offerpoint" id="offerpoint"/>
			    	</div>
			  </div>
			
			<!-- 지도 API 끝 -->
			<div class="table8"><input type="submit" name="offersave" id="offersave" value="작성 완료" /></div>
			 </div>
		 </form>
	
</body>
</html>