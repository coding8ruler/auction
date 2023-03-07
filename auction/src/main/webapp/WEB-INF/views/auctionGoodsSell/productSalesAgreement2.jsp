<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css'>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js'></script>
<title>Insert title here</title>
</head>
<style>
.table {
  border-collapse: collapse;
}
.table td, .table th {
  border: 1px solid #ddd;
  padding: 8px;
}
label {
  font-size: 1.2em; /* 글자 크기 */
  font-weight: bold; /* 글자 굵기 */
}
.form-check-input {
  width: 20px;
  height: 20px;
  transform: scale(1.5);
}
</style>
<body>
		  <button onclick="window.history.back()" style="width: 50px; height: 50px; border:none; font-size: 2em;">←</button>
		  <h2 align="center" style="font-weight: bold;">판매 동의</h2>
		<h2 style="font-weight: bold;">
			<span style="color: #03C988; ">판매</span>하시기 전에 <br>
			꼭 확인하세요.
		</h2>
<form action="">
 <div class="table-responsive">
  <table class="table">
    <tbody>
      <tr>
        <td>
          <label for="confirm1" >
          	판매하려는 상품이 맞습니다.
          </label><br>
         		 상품 이미지, 모델번호, 출시일, 상품명, 사이즈를 한 번 더 확인했습니다.
        </td>
        <td>
          <div class="form-check">
            <input class="form-check-input" type="checkbox" id="confirm1" name="confirm1" value="1">
          </div>
        </td>
      </tr>
      <tr>
        <td>
          <label for="confirm2">
          	국내/해외에서 발매한 정품 · 새상품입니다.
          </label><br>
        		  모든 구성품이 그대로이며, 한 번도 착용하지 않은 정품・새상품입니다. 손상/오염/사용감 있는 상품은 판매가 불가능합니다.
        </td>
        <td>
          <div class="form-check">
            <input class="form-check-input" type="checkbox" id="confirm2" name="confirm2" value="1">
          </div>
        </td>
      </tr>
      <tr>
        <td>
          <label for="confirm3">
          	박스/패키지의 상태를 확인합니다.
          </label><br>
         		 박스/패키지 상태에 따른 검수 기준과 패키지(포장) 개봉 검수에 대한 주의사항을 확인했습니다.
        </td>
        <td>
          <div class="form-check">
            <input class="form-check-input" type="checkbox" id="confirm3" name="confirm3" value="1">
          </div>
        </td>
      </tr>
      <tr>
        <td>
          <label for="confirm4">
          		이중 포장하여 선불 발송합니다.
          </label><br>
         		 반드시 이중 포장하여 택배 상자에 담아 선불 발송합니다. 합배송은 권장하지 않으며 이로 인한 박스/패키지 훼손은 판매자의 책임입니다.
        </td>
        <td>
          <div class="form-check">
            <input class="form-check-input" type="checkbox" id="confirm4" name="confirm4" value="1">
          </div>
        </td>
      </tr>
      <tr>
        <td>
          <label for="confirm5">
          	AUCTION의 최신 이용정책을 모두 확인하였으며, 판매를 계속합니다.
          </label><br>
         		 건전하고 안전한 거래를 위해 반드시 숙지해야 할 미입고, 페널티, 부정거래 등의 이용정책을 확인했습니다.
				</td>
	        <td>
	          <div class="form-check">
	            <input class="form-check-input" type="checkbox" id="confirm5" name="confirm5" value="1">
	          </div>
	        </td>
	      </tr>
	      <tr>
	      	<td>
	      		<div style="display: flex; justify-content: center;">
							<button class="btn" type="submit" name="submitBtn" value="continue" style="font-size: 1.2em; padding: 10px 20px; display:block; margin: 0 auto; width: 100%;">판매 계속</button>
	      		</div>
	      	</td>
	      </tr>
      </tbody>
     </table>
    </div>
</form>
</body>
</html>