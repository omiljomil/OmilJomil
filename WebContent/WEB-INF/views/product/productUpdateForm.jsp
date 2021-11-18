<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.model.vo.Product"%>
<% 

	Product p = (Product)request.getAttribute("p"); 


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<style>  
	
	#contentSize{
		width: 1200px;
		margin: 60px auto;
	}
	#contentSize *{
		margin: 15px;
		
	}
	
	#updateProductTitle{
		color: rgb(65, 116, 77);
		font-size: 50px;
		font-weight: bold;
		margin: 30px;
	}
	
	.productTable{
		width: 1200px;
		
	}
	
	.tableName{
		background-color:rgb(157, 181, 137);
		color: white;
		text-align: center;
	}
	
	.productTable tr, td{
		width: 300px;
		height: 50px;
		border: 1px solid black;
	}
	
	.productTable select{
		width: 250px;
	}
	
	.categoryArea{
		border-bottom: 1px solid black;
		border-top: 1px solid black;
	}
	.categoryArea select{
		width: 200px;		
	}
	.inputArea{
		border-bottom: 1px solid black;
	}
	.inputArea label{
		width: 100px;
		
	}
	
	
	#productInfo{
		width: 900px;
		height: 400px;

	}
	
	
</style>
</head>
<body>
	
<header>
	<%@ include file = "/WEB-INF/views/common/header.jsp" %>
	
	</header>
	<%@ include file = "/WEB-INF/views/common/imgslide.jsp" %>
		
	<!-- 상품등록 -->	
	<div id="contentSize">
	<div id="updateProductTitle">상품등록</div>
	<!-- 저장 버튼을 누르면 insert.pr로 이동(최종적으로 등록하면 등록상품리스트페이지로 이동) -->
	<form action="<%= request.getContextPath() %>/productUpdate.pr" enctype="multipart/form-data" method="post">
	
		<table class="productTable">
			<tr>
				<td class="tableName">메인카테고리</td>
				<td>
					<select id="mainCategory" name="mainCategory">
						<option value="all" >전체</option>
						<option value="veganType" >채식유형별</option>
						<option value="mainType" >메인재료별</option>
					</select>
				</td>
				<td class="tableName">상세카테고리</td>
				<td>
					<select id="detailCategory" name="detailCategory">
						<option value="all">전체</option>
						<option value="10">채식유형별</option>
						<option value="20">메인재료별</option>
						<option value="30">추천별</option>					
					</select>
				</td>
			</tr>
			<tr>
				<td class="tableName">상품명</td>
				<td colspan="3">
					<input type="text" id="productName" name="productName" value="<%= p.getProdName() %>">
				</td>
			</tr>
			<tr>
				<td class="tableName">재료명</td>
				<td colspan="3">
					<input type="text" id="mainMtrl" name="mainMtrl" value="<%= p.getMtrlName() %>">
				</td>
			</tr>
			<tr>
				<td class="tableName">상품가격</td>
				<td colspan="3">
					<input type="text" id="productPrice" name="productPrice" value="<%= p.getPrice() %>">
				</td>
			</tr>
			<tr>
				<td class="tableName">간단상품설명</td>
				<td>
					<input type="text" class="shortInfo" name="shortInfo" value="<%= p.getShortInfo() %>">
				</td>			
			</tr>
			<tr>
				<td class="tableName">해시태그</td>
				<td colspan="3">
					<input type="text" id="hashtag" name="hashtag" value="<%= p.getProdTag() %>">
				</td>
			</tr>
			<tr  rowspan="2">
				<td class="tableName">대표이미지등록</td>
				<td>
					<input type="file" id="thumImg" name="thumImg" width="" height="">
				</td>
			</tr>
			<tr rowspan="2">
				<td class="tableName">이미지등록</td>
				<td>
					<input type="file" id="imgs" name="imgs" width="" height="">
				</td>
				
			</tr>
			<tr>
				<td class="tableName">상품설명</td>
				<td colspan="3">
					<input type="textarea" id="productInfo" name="productInfo" value="<%= p.getProdExple() %>">
				</td>
			</tr>
			<!-- 파일 업로드 하는 부분 -->
				<div id="fileArea">
					<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">
					<input type="file" id="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)">
					<input type="file" id="thumbnailImg3" multiple="multiple" name="thumbnailImg3" onchange="LoadImg(this,3)">
					<input type="file" id="thumbnailImg4" multiple="multiple" name="thumbnailImg4" onchange="LoadImg(this,4)">
				</div>
			
			
		</table>
		<input type="submit" id="insertProductBtn" value="저장">
		<!-- 취소를 누르면 상품등록리스트로 이동하게 하기 -->
		<input type="reset" id="resetProductBtn" value="취소" onclick="location.href='<%= request.getContextPath() %>/ManagerProductList.pr'">
	</form>
	</div>
	
	<footer>
		<%@ include file="/WEB-INF/views/common/bottontitle.jsp" %>
	</footer>
	<div class="toparrow">
	<a href="#" title="top"><i class="bi bi-arrow-up-circle"></i></a>
	</div>
	
	
	<script>
	$(function(){
		$("#fileArea").hide();//버튼을 숨김
		
		$("#titleImgArea").click(function(){
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
			// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
			
			
			if(value.files && value.files[0]){
				var reader = new FileReader();
							
					reader.onload = function(e){								
					switch(num){
					case 1: 
						$("#mainFileName").attr("src", e.target.result);//타겟result:경로를 가져옴
						break;
					case 2:
						$("#fileName").attr("src", e.target.result);
						break;
					
					}
				}
							
				reader.readAsDataURL(value.files[0]);//여러 사진을 선택하여 업로드 할 경우 처음선택한 사진만 업로드 됨(한 공간에는 한 사진만 올라감)
			}
		}
	
	</script>
		

</body>
</html>