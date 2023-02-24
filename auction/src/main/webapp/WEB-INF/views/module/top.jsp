<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<style>
/* 스타일링을 위한 CSS */
.dropdown {
  position: relative;
  display: inline-block;
  margin-right: 10px;
}
.dropbtn {
  background-color: #fff;
  color:  #000;
  padding: 10px 20px;
  font-size: 16px;
  border-radius: 5px;
  border: 1px solid #ccc;
  cursor: pointer;
  transition: all 0.3s ease-in-out;
}
.dropdown-content {
  display: none;
  position: absolute;
  z-index: 1;
}
.dropdown-content a {
 color: #000;
  padding: 10px 20px;
  display: block;
  transition: all 0.3s ease-in-out;
}
.dropdown:hover .dropbtn {
  background-color: #000;
  color: #fff;
  border-color: #000;
}
.dropdown:hover .dropdown-content {
background-color: white;
  display: block;
}
</style>
</head>
<body>



<div class="dropdown">
  <button class="dropbtn">Button 1</button>
  <div class="dropdown-content">
    <a href="#">Option 1-1</a>
    <a href="#">Option 1-2</a>
    <a href="#">Option 1-3</a>
  </div>
</div>

 <div class="dropdown">
  <button class="dropbtn">Button 1</button>
  <div class="dropdown-content">
    <a href="#">Option 1-1</a>
    <a href="#">Option 1-2</a>
    <a href="#">Option 1-3</a>
  </div>
</div>

<div class="dropdown">
  <button class="dropbtn">Button 2</button>
  <div class="dropdown-content">
    <a href="#">Option 2-1</a>
    <a href="#">Option 2-2</a>
    <a href="#">Option 2-3</a>
  </div>
</div>

<div class="dropdown">
  <button class="dropbtn">Button 2</button>
  <div class="dropdown-content">
    <a href="#">Option 2-1</a>
    <a href="#">Option 2-2</a>
    <a href="#">Option 2-3</a>
  </div>
</div>

<div class="dropdown">
  <button class="dropbtn">Button 2</button>
  <div class="dropdown-content">
    <a href="#">Option 2-1</a>
    <a href="#">Option 2-2</a>
    <a href="#">Option 2-3</a>
  </div>
</div>

<div class="dropdown">
  <button class="dropbtn">Button 2</button>
  <div class="dropdown-content">
    <a href="#">Option 2-1</a>
    <a href="#">Option 2-2</a>
    <a href="#">Option 2-3</a>
  </div>
</div>

<div class="dropdown">
  <button class="dropbtn">Button 2</button>
  <div class="dropdown-content">
    <a href="#">Option 2-1</a>
    <a href="#">Option 2-2</a>
    <a href="#">Option 2-3</a>
  </div>
</div>
<div class="dropdown" style="float: right;">
  <button class="dropbtn" onclick="location.href=''">로그아웃</button>
</div>
<div class="dropdown" style="float: right;">
  <button class="dropbtn" onclick="location.href=''">로그인</button>
</div>

</body>
</html>