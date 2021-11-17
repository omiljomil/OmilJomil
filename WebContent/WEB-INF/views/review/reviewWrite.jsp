<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="review.model.vo.*"%>
    
<%
/* Member user=(Member)request.getSession().getAttribute("loginUser"); */

%>    
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="style10.css">
    <title>상품후기 양식 페이지</title>
 
<style>
* {
  box-sizing: border-box;
}
body {
  margin: 0 auto;
  font-family: sans-serif;
}
section{
margin-top:100px;
}

#review-title {
  margin-left: 140px;
  font-size: 70px;
}
#route {
  position: relative;
  display: flex;
  justify-content: right;
  bottom: 100px;
  right: 150px;
  font-size: 28px;
}
#route a{
text-decoration: none;
 color:gray;
  font-size: 28px;
}
#route a:hover {
  text-decoration:"none";
  color: yellowgreen;
}
#review-porduct {
  position: relative;
  margin-bottom: 100px;
  border: 2px solid gray;
  width: 550px;
  height: 200px;
}
#review-product-image {
  display: inline-block;
  width:180px;
  height:199px;
 border-right:2px solid gray;
 display: flex;
 justify-content: center;
}

#imageBox img:hover,
#review-product-image:hover{
 cursor:pointer;
}
#thumnail-image{
  width:178px;
  height:185px;
  border:none;
  background-color: white;
}

#review-product-image a {
  display: inline-block;
  border-right: 2px solid gray;
  width: 200px;
  height: 200px;
  background-position: 50% 50%;
  background-repeat: no-repeat;
  background-size: contain;
}
#product-title {
 display:inline-block;
  width: 368px;
  height: 80px;
  position: absolute;
  left:180px;
  bottom:100px;
  font-size: 23px;
  border-bottom: 2px solid gray;
 
}
#review-porduct button {
  border: 2px solid gray;
  position: absolute;
  left: 50%;
  top: 130px;
  width: 200px;
  height: 30px;
  background-color: rgb(102, 134, 99);
}
#review-porduct button a {
  text-decoration: none;
  color: beige;
  font-size: 15px;
  font-weight: 700;
}
#review-table {
  width: 500px;
  position: absolute;
  left: 150px;
  height: 100px;
  border-collapse: collapse;
}

#review-table th {
  height: 65px;
  border: 1px solid gray;
  text-align: center;
}
#review-table button {
  border: none;
}
#review-text-title {
  width: 350px;
  height: 60px;

  border: none;
}
#write-content {
  position: absolute;
  width: 0%;
  top: 650px;
}

#option-button-div {
  border: 1px solid #888;
  margin-left: 150px;
  position: relative;
  top: 400px;
  width: 1100px;
}
#ot-backColor,
#ot-textColor {
  position: relative;
  top: 3px;
}

#review-content {
 position:absolute;
  width: 700px;
  height: 500px;
  top:1060px;
  left:500px;
  display:flex;
  justify-content: center;
  align-items: center;
}

#imageBox{
 position:absolute;
 left:150px;
 top:1000px;
}
#imageBox img{
 margin-top:30px;
 border: 1px solid gray;
 
}

#go-button {
  position: absolute;
  width: 80px;
  left: 1300px;
  top: 1700px;
}

#go-button a {
  text-decoration:none;
  font-size: 18px;
  font-weight: 800;
  color: black;
}
#go-button a:hover {
  color: yellowgreen;
}

#input-cancle,
#input-save {
  border: 1px solid gray;
  position: relative;
  left: 540px;
  top: 1200px;
  margin-right: 60px;
  width: 130px;
  height: 50px;
  font-weight: 900;
}

#input-cancle {
  background-color: darkgrey;
}
#input-save {
  background-color: greenyellow;
}

#fileArea{
position:absolute;
 top: 1900px;

}




</style> 
    
</head>
<body>


 
 <%@ include file = "../common/header.jsp" %>
	 <section>
	        <div id="review">
	                <span id="review-title">상품후기</span>
	                <div id="route">
	                    <span><a href="#">홈</a></span>
	                    <span>-></span>
	                    <span><a href="#">커뮤니티</a></span>
	                    <span>-></span>
	                    <span><a href="#">상품후기</a></span>
	                </div>
	        </div><br><br>
	        
	<form action="<%= request.getContextPath() %>/boardInsert.bo" method="post" encType="multipart/form-data"><!-- 파일올리는 거기 때문에 -->
	      	<div id="review-table">
	     	     <div id="review-porduct">
	                <div id="review-product-image"><img id="titleImg"  width="180" height="199" ></div>		<!-- <input  id="thumnail-image" type="button" value="사진첨부" > -->
	                <div id="product-title"></div>
	                <button><a href="#">상품 상세 정보 등록</a></button>
	              </div>
	            
	     <table id="review-write">
	            <tr>
	                <th width="130px" >제목</th>
	                <th><input type="text" id="review-text-title" name="title" placeholder="제목 입력"></th>
	            </tr>
	            <tr>
	                <th>작성자</th>
	                <%if(user!=null){ %>
	                <th><input type="text" id="review-text-title" placeholder="이름 입력" name="name"value="<%=user.getUserName() %>"></th>
	                <%}else{ %>
	                 <th><input type="text" id="review-text-title" placeholder="이름 입력" name="name"></th>
	                 <%} %>
	            </tr>
	        </table>
	      </div>
<!-- 
	<div id="write-content">
	      <div id="option-button-div">
	        &nbsp; 
	         <select name="text-style" id="text-style" >
	          <option value="">굴림체</option>
	          <option value="">돋움체</option>
	          <option value="">바탕체</option>
	          <option value="">궁서체</option>
	          </select> &nbsp;
	
	
	         <label>글씨크기</label>
	        <select name="text-size">
	            <option value="10">10</option>
	            <option value="11">11</option>
	            <option value="12">12</option>
	            <option value="13">13</option>
	            <option value="14">14</option>
	            <option value="15">15</option>
	            <option value="16">16</option>
	            <option value="17">17</option>
	            <option value="18">18</option>
	            <option value="19">19</option>
	            <option value="20">20</option>
	            <option value="21">21</option>
	            <option value="22">22</option>
	            <option value="23">23</option>
	            <option value="24">24</option>
	            <option value="25">25</option>
	            <option value="26">26</option>
	            <option value="27">27</option>
	            <option value="28">28</option>
	            <option value="29">29</option>
	            <option value="30">30</option>
	        </select>
	      
     	   <label>글자 색</label><input  type="color" id="ot-textColor">

      
	        &nbsp;
	        <label>굵기</label>
	        <select name="text-weight">
	            <option value="bord">보통</option>
	            <option value="border">굵게</option>
	            <option value="light">얇게</option>
	         </select>
	         &nbsp;
     

	     <label>목록 형식</label>
	       <select name="text-addlist">
	        <option value="text-underline">없음</option>
	        <option value="text-underline">순서있는 목록</option>
	        <option value="text-underline">순서없는 목록</option>
	     </select>

	     <label>정렬</label>
	       <select name="text-sort">
	        <option value="text-underline">왼쪽정렬</option>
	        <option value="text-underline">가운데 정렬</option>
	        <option value="text-i">오른쪽 정렬</option>
	     </select>

   		</div> -->
   	 <!--여기까지 옵션바 --> 

			    <div id="review-content">
			        <textarea name="content" cols="150" rows="21" placeholder="이미지%내용입력"></textarea>
		   
				 </div>
		
      
		   <div id="imageBox">
			     <div id="contentImgArea1">
						<img id="contentImg1" width="250" height="160"> 
					 </div>
					  
					<div id="contentImgArea2">
						<img id="contentImg2" width="250" height="170">
					</div>
					
					<div id="contentImgArea3">
						<img id="contentImg3" width="250" height="170"> 
					</div> 
		     </div> 
	   
     
         <div id="fileArea">
					<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">
					<input type="file" id="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)">
					<input type="file" id="thumbnailImg3" multiple="multiple" name="thumbnailImg3" onchange="LoadImg(this,3)">
					<input type="file" id="thumbnailImg4" multiple="multiple" name="thumbnailImg4" onchange="LoadImg(this,4)">
				</div>
  
    
  
   
  			 <script>
					// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
					$(function(){
						$("#fileArea").hide();
						
						$("#review-product-image").click(function(){
							//div 내용사진부분을 클릭함으로써 input file의 해당하는 태그는hiddent이므로 그 input을 누르게되는 효과 속성
							$("#thumbnailImg1").click();
				
								});
						$("#contentImgArea1").click(function(){
							$("#thumbnailImg2").click();
						});
						$("#contentImgArea2").click(function(){
							$("#thumbnailImg3").click();
						});
						$("#contentImgArea3").click(function(){
							$("#thumbnailImg4").click();
						});
					});
					
					function LoadImg(value, num){
						if(value.files && value.files[0]){
							var reader = new FileReader();
							
							reader.onload = function(e){								
								switch(num){
								case 1: 
									$("#titleImg").attr("src", e.target.result);
									break;
								case 2:
									$("#contentImg1").attr("src", e.target.result);
									break;
								case 3: 
									$("#contentImg2").attr("src", e.target.result);
									break;
								case 4:
									$("#contentImg3").attr("src", e.target.result);
									break;
								}
							}
							
							reader.readAsDataURL(value.files[0]);
							//파일을 여러개 가져올려고한다면 맨앞에 가져온 파일만 가져오도록 설정!파일창이 띄어지고 파일을여러개골랐다면 맨처음파일만 넘거가도록하는설정
						}
					}
			</script>
			 <button type="button" id="go-button"><a href="#">목록</a></button>
	       <input type="button" value="취소" id="input-cancle" >
	       <input type="submit" value="저장" id="input-save">	
		</form> 
	 </section>	 			
    
</body>
</html>