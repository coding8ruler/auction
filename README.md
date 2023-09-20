# auction / 명품 경매 사이트
SPRING STS + JSP_명품 경매 사이트

## 🖥️ 프로젝트 소개
KREAM을 참고하여 만든 명품 경매 사이트입니다.
<br>

## 🕰️ 개발 기간 & 참여인원
* 22.02.17일 - 22.03.09일
* 6명

### 🧑‍🤝‍🧑 역할
 - 후기 review 게시판(CRUD) 구현
 - ERDcloud를 활용한테이블 구조 (상관관계) 정리 DB 설계

### ⚙️ 개발 환경
- `Java 8`
- `JDK 1.8.0`
- `Javascript`
- `HTML5`
- `CSS3`
- **IDE** : eclipse 2020-03
- **Framework** :Spring(3.9.12.RELEASE)
- **Libraries** :jQuery, AJAX
- **Database** : Oracle DB(11xe)
- **ORM** : Mybatis
- **ETC** : git, notion, Apache Tomcat

## ✨ 핵심 기능
```
<script>
let count=1; 
$(document).ready(function(){
 $("#btnDelFile").click(function(){ 
   if(count==1){ //유지해야하는 파일수보다 적다면
           alert("반드시 한개는 있어야 합니다.");
           return;
}
		   	
   let tr = $("#files"+count).parents("tr");
 $(tr).remove();
    count--; 
});
		   
$("#btnAddFile").click(function(){ 
 count++;
 if(count==4){ //허용된 첨부파일수(3개)보다 크다면
     alert("첨부파일은 최대 3개까지 가능합니다.");
     count=3;
     return; //함수종료
}
 let tr = "<tr><th>첨부파일</th><td>";
     tr+="<input type='file' name='file"+count+"' id='files"+count+"'/></td></tr>";
 $("#i1").before(tr);	
 });
});
</script>
```
#### 파일첨부 - <a href="https://github.com/coding8ruler/auction/blob/main/auction/src/main/webapp/WEB-INF/views/review/addForm.jsp >상세보기 - 이동</a>

## 📌 
- 기본 CRUD 구현
- 파일업로드 기능 구현
- SPRING STS 활용, JAVASCRIPT MVC 패턴의 이해
- SPRING MYBATIS 활용 경험
- GitHub 활용 경험
- Oracle데이터베이스 기본 지식 활용 방법 터득
