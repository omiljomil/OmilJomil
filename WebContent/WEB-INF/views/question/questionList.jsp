
<%@page import="oracle.net.aso.q"%>
<%@page import="page.PageInfo"%>
<%@page import="question.model.vo.Question"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ArrayList<Question> list = (ArrayList<Question>)request.getAttribute("list");
    PageInfo pi = (PageInfo)request.getAttribute("pi");
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.questionmain{
		width: 100%;
		border-top:2px solid #909090;
	}
	.questionTitle{
		padding-top : 30px;
		display: flex;
		width: 1100px;
		margin: 0 auto;
		justify-content: flex-end;
	}
	.questionSelectList{
		display : flex;
		width: 1300px;
		justify-content: flex-start;
		margin: 0 auto;
		
		
	}
	
	.questionTable table{
		
		width: 1300px;
		margin: 30px auto;
	}
	.questionTable th{
		text-align: center;
	}
	.questionTable th, td{
		border: 1px solid black;
	}
	.questionInsert{
		display: flex;
		width: 1300px;
		margin: 0 auto;
		justify-content: flex-end;
		
	}
	
</style>
<body>
	<%@ include file = "../common/header.jsp" %>
	<div class="questionmain">
		<div class="questionTitle">
			<div style="font-size: 30px; font-weight: bold;">문의사항</div>
			<div style="margin-left: 350px;"><a href="#">홈</a>--><a href="#">커뮤니티</a>--> <a href="#">문의 사항</a></div>
		</div>
	</div>
	<div class="questionSelectList">
		<select name="questionSelect" id="questionSelect">
			<option value="all">전체</option>
			<option value="Title">글 제목</option>
			<option value="content">글 내용</option>
		</select>
		<input type="text" id="questionSearch"/>
	</div>
	<div class="questionTable">
		<table border="1" class="QuesList">
			<tr>
				<th width="100px;">번호</th>
				<th  width="700px;">제목</th>
				<th>작성</th>
				<th>작성일</th>
			</tr>
			<% if(list.isEmpty()){ %>
				<tr align="center">
					<td colspan="4">문의사항이 없습니다.</td>
				</tr>
			<%}else{ %>
				<%for(Question q : list){ %>
					
						<tr >
							
							<td><%=q.getQst_no() %></td>
							<%if(loginUser == null){ %>
								<td>비밀글입니다.</td>
							<%}else if(q.getUser_id().equals(loginUser.getUserId())){ %>
								<td><%=q.getQst_title() %></td>
				
							<%}else{ %>
								<td>비밀글 입니다.</td>
							<%} %>
							
							<td><%=q.getUser_id().replaceAll("(?<=.{3}).", "*") %></td>
							<td colspan="2"><%=q.getEnroll_date() %></td>
							<td><input type="hidden" value="<%= q.getUser_id()%>"/></td>
						</tr>
					
					
				<%} %>
			<%} %>
		</table>
		<div class="questionInsert"><input type="button" id="questionInsertBtn"value="글쓰기"/></div>
	</div>
	<div class="pagingArea" align="center">

		<button onclick="location.href='<%= request.getContextPath()%>/questionList.bo?currentPage=1'">&lt;&lt;</button>
		<button id="beforeBtn" onclick="location.href='<%= request.getContextPath()%>/questionList.bo?currentPage=<%= pi.getCurrentPage() -1%>'">&lt;</button>
		<script>
			if(<%= pi.getCurrentPage() <=1%>){
				$('#beforeBtn').prop('disabled',true);
			}
		</script>
		<%for(int p = pi.getStartPage(); p<= pi.getEndPage(); p++){ %>
			<%if(p == pi.getCurrentPage()){ %>
				<button id="choosen" disabled><%= p %></button>
			<%}else{ %>
				<button id="numBtn" onclick="location.href='<%= request.getContextPath()%>/questionList.bo?currentPage=<%= p%>'"><%= p %></button>
			<%} %>
		<%} %>
		<button  id="afterBtn" onclick="location.href='<%= request.getContextPath()%>/questionList.bo?currentPage=<%= pi.getCurrentPage() +1%>'">&gt;</button>
		<script>
		if(<%= pi.getCurrentPage() >=pi.getMaxPage()%>){
			$('#afterBtn').prop('disabled',ture);
		}
		</script>
		<button onclick="location.href='<%= request.getContextPath()%>/questionList.bo?currentPage=<%= pi.getMaxPage()%>'">&gt;&gt;</button>
		
	</div>
	
</body>
<script>
	$('#questionInsertBtn').on('click',function(){
		if(<%= loginUser ==null%>){
			alert("회원만 가능합니다.");
			location.href="<%= request.getContextPath()%>/loginForm.me";
		}else{
			location=href="<%= request.getContextPath()%>/insertQuestionForm.qt";
		}
	});
	
	$('.QuesList td').mouseenter(function(){
		$(this).parent().css({'background':'darkgray','cursor':'pointer'});
	}).mouseout(function(){
		$(this).parent().css({'background':'none'});
	}).click(function(){
		if(<%= session.getAttribute("loginUser") !=""%>){
			var qId = $(this).parent().children().eq(4).children('input').val();
				location.href='<%= request.getContextPath() %>/QuestionDetail.qs?qId=' + qId;
			}else{
				alert('비밀글입니다.');
			}

		
	});
</script>
</html>