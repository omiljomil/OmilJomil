<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.shppingimg{
		
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding: 0px 7px;
	}
	.shppingTable{
		border-spacing: 15px;
		margin-left: 10px;
		
	}
	.shppingTable th{
		border-top : 2px solid yellowgreen;
		border-bottom: 1px solid yellowgreen;
		padding: 10px;		
	
	}
	.shppingTable td{
		font-size: 12px;
		width: 85px;
	}
	.shppingTable td input{
		padding: 6px;
		border: 1px solid #E2E2E2;
	}
</style>
<body>
<form action="">
	<div class="shppingimg">
	<div><img src="<%=request.getContextPath() %>/img/logo.png" align="middle" width="120px;" height="70px;"/></div>
	<div>배송지 등록 수정</div>
	<div>X</div>
	</div>
	<table class="shppingTable">
		<tr>
			<th colspan="2" style="border-bottom: 1px solid #909090; padding-bottom: 10px;">배송지 상세 등록</th>
		</tr>
		<tr>
			<td>배송지명</td>
			<td><input type="text" /></td>
		</tr>
		<tr>
			<td>수령인</td>
			<td><input type="text" /></td>
		</tr>
		<tr>
			<td  rowspan="3">주소</td>
			<td ><input type="text" style="width: 100px;"/><input type="button" value="주소검색"/></td>
		</tr>
		<tr>
			<td colspan="2"><input type="text" style="width: 300px;"/></td>
		</tr>
		<tr>
			<td colspan="2"><input type="text"style="width: 300px;" /></td>
		</tr>
		<tr>
			<td>연락처</td>
			<td><input type="text" style="width: 230px;"/></td>
		</tr>
		<tr>
			<td><div>기본 배송지</div></td>
			<td> <input type="checkbox" />기본 배송지로 설정</td>
		</tr>
	</table>
	<div>입력/수정하신 배송지는 배송지 목록에 저장됩니다.</div>
	<div align="center"></div>
	</form>
</body>
</html>