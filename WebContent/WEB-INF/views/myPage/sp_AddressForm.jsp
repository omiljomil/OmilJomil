<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.order_ship{
		float: left; /*정렬*/
	    width: 1000px; 
	    margin: 70px 30px;
	    
	    
	}
	.order_ship h4{ margin-left: 50px;}
	.shippingTitle{
		width: 900px;
		height : 70px;
		margin: 10px 50px;
		display: flex;
		justify-content: space-between;
		align-items: flex-end;
	}
	.sp_title{
		width: 350px;
		
	}
	.regi_Btn{
		width: 100px;
		height: 30px;
	}
	.shippingTable{
		border-top: 2px solid #909090;
		border-bottom : 2px solid #909090;
		width: 900px;
		margin: 30px auto;
		padding-top: 25px;
		
	}
	.shippingTable th{
		border-bottom: 1px solid #E2E2E2;
		padding : 20px 0px;
	}
</style>
</head>
<body>
	<%@ include file = "../common/myPage.jsp" %>
	<div class="order_ship">
		<h4 align="left">배송지 목록</h4>
		
		<div class="shippingTitle">
			<div class="sp_title">
				회원님의 배송지 목록입니다.<br>
				자주 쓰는 배송지를 편리하게 관리 하세요!
			</div>
			<div >
				<button class="regi_Btn" id="insertShpping">배송지 등록</button>
			</div>
		</div>
		<table class="shippingTable">
			<tr>
				<th width="120px">배송지</th>
				<th width="330px">주소</th>
				<th width="110px">연락처</th>
				<th width="100px">수정 - 삭제</th>
			</tr>
			<tr>
				<td colspan="4" align="center" style="padding: 50px">등록된 배송지가 없습니다.</td>
			</tr>
		</table>
	</div>
</body>
<script>
	$('#insertShpping').on('click',function(){
		window.open('insertShppingForm.me','insertShppingForm','width=800,height=900');
	});
</script>
</html>