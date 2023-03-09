<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
let moveForm = $('#moveForm');
$(".pageInfo a").on("click", function(e){
	 
    e.preventDefault();
    moveForm.find("input[name='pageNum']").val($(this).attr("href"));
    moveForm.attr("action", "././list");
    moveForm.submit();
    
	});
$(".search_area button").on("click", function(e){
    
    e.preventDefault();
        
    let type = $(".search_area select").val();
    let keyword = $(".search_area input[name='keyword']").val();
    let pageNum = $(".search_area input[name='pageNum']").val();
        
    if(!type){
         alert("검색 종류를 선택하세요.");
         return false;
      }
    if(!keyword){
         alert("검색어를 입력하세요.");
         return false;
       }
      moveForm.find("input[name='type']").val(type);
      moveForm.find("input[name='keyword']").val(keyword);
      moveForm.submit();  
    });		
});	
</script>
<style>
.pageInfo{
      list-style : none;
      display: inline-block;
    margin: 50px 0 0 100px;      
  }
  .pageInfo li{
      float: left;
    font-size: 20px;
    margin-left: 18px;
    padding: 7px;
    font-weight: 500;
  }
 a:link {color:black; text-decoration: none;}
 a:visited {color:black; text-decoration: none;}
 a:hover {color:black; text-decoration: underline;}
.active{
    background-color: #cdd5ec;
  }
</style>
</head>
<body>
	<h3>회원목록</h3>
	<hr>
	<table border="1">
	<thead>
		<tr>
			<th>아이디</th><th>이름</th><th>번호</th><th>이메일</th><th>성별</th><th>우편번호</th><th>도로명주소</th><th>지번주소</th><th>상세주소</th><th>가입일</th><th>회원등급</th><th>수정</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${memberlist}" var="member">
		<tr>
			<td><a href="<%=request.getContextPath()%>/member/info?pageNum=${page.cri.pageNum}&amount=${page.cri.amount}&type=${page.cri.type}&keyword=${page.cri.keyword}&id=${member.id}">${member.id}</a></td>
			<td>${member.name}</td>
			<td>${member.phone1}-${member.phone2}-${member.phone3}</td>
			<td>${member.email1}@${member.email2}</td>
			<td>${member.gender}</td>
			<td>${member.zipcode}</td>
			<td>${member.roadaddress}</td>
			<td>${member.jibunaddress}</td>
			<td>${member.detailaddress}</td>
			<td><fmt:formatDate value="${member.register}" type="both" pattern="yy년MM월dd일"/></td>
			<td>${member.grade}</td>
			<td><button type="button" onclick="location.href='./update?id=${member.id}'">수정</button></td>
		</tr>	
		</c:forEach>
	</tbody>
	</table>
	<div class="search_wrap">
    	<div class="search_area">
            <select name="type">
                <option value="I" <c:out value="${page.cri.type eq 'I'?'selected':'' }"/>>아이디</option>
                <option value="N" <c:out value="${page.cri.type eq 'N'?'selected':'' }"/>>이름</option>
                <option value="IN" <c:out value="${page.cri.type eq 'IN'?'selected':'' }"/>>아이디 +이름 </option>
            </select>    
            <input type="text" name="keyword" value="${page.cri.keyword}" placeholder="검색어를 입력하세요">
            <button>Search</button>
        </div>
    </div> 
       
	<div class="pageInfo_wrap" >
        <div class="pageInfo_area">
        <ul class="pageInfo" id="pageInfo">
         <!-- 이전페이지 버튼 -->
         <c:if test="${page.prev}">
            <li class="pageInfo_btn previous"><a href="${page.startPage-1}">Previous</a></li>
         </c:if>
         <!-- 각 번호 페이지 버튼 -->       
         <c:forEach var="num" begin="${page.startPage}" end="${page.endPage}">
             <li class="pageInfo_btn ${page.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
         </c:forEach>
         <!-- 다음페이지 버튼 -->
         <c:if test="${page.next}">
             <li class="pageInfo_btn next"><a href="${page.endPage + 1 }">Next</a></li>
         </c:if>    
        </ul>
        </div>
    </div>
    <form id="moveForm" method=get >
	 <input type="hidden" name="pageNum" value="${page.cri.pageNum}">
     <input type="hidden" name="amount" value="${page.cri.amount}">
	 <input type="hidden" name="type" value="${page.cri.type}">
	 <input type="hidden" name="keyword" value="${page.cri.keyword}">
    </form>
    <c:if test="${page.total == 0}">	
		<script>
		 alert("검색결과가 없습니다.");
		 location.href ="<%=request.getContextPath()%>/member/list";
		</script>
	</c:if>   
</body>
</html>