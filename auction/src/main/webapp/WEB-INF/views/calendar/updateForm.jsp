<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="updateFrm" 
  		method="post"
  		action="${conPath}/calendar/updateForm">      
   	<table border="1">
 	  <tbody>
 		<tr>
 		 <th>제목</th>
 		 <td><input type="text" name="calenTitle" id="calenTitle" required="required"/></td>	
 		</tr>
 		<tr>
	     <th>시작일</th>
	     <td>
	        <input type="date" name="calenStart" id="calenStart"/>
	     </td>
	    </tr>
	    <tr>
	     <th>종료일</th>
	     <td>
        <input type="date"  name="calenEnd" id="calenEnd"/>
	     </td>
	    </tr>
 		<tr id="i1">
 		 <td colspan="2" style="text-align:center;">
 		 <input type="submit" value="등록"/>
 		 <input type="reset" id="btnReset" value="취소"/></td>	
 		</tr>
 	  </tbody>
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