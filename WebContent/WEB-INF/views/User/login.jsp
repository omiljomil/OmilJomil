<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.member {
 font-size: 50px;
 text-shadow: 0 0 10px #666;
 color: #fff;
 margin: 0 auto;
 text-align: center;
 text-transform: capitalize;
 font-style: italic;
}



.form {
 width: 498px;
 height: 280px;
 border-radius: 10px;
 border: 2px solid #909090;
 margin: 0 auto;
 margin-top: 100px;
 
}

.form2 {
 width: 450px;
 min-width: 320px;
 height: 200px;
 margin: 60px auto;
 margin-left:20px;
}

.form3 {
 float: left;
 /*   background:#f00;  */
}

.form3 label {
 width: 100px;
 height: 20px;
 /*  display: block; */
 float: left;

}



#wrap {
 width: 600px;
 height: 500px;
 margin: 0 auto;
}
	.weblogin{
	width: 450px;
	text-align : center;
	}
	.weblogin img{
	padding-bottom: 12px;
	}

.clear {
 clear: both;
}

.loginsub {
 
 height: 65px;
 background: #1d2327;
 color:white;
 border-radius: 5px;
 border: none;
  margin-left: 10px;
  position: relative;
  padding: 10px;

}

.loginsub:hover{

	 font-weight: bold;
}


input[type="button"] {
 	height: 30px;
	background : white;
	border : none;
	 margin-top:10px;
	margin-right:20px;
}
input[type="checkbox"] {
 margin-top:20px;
}

#userPwd{
	margin-top: 5px;
}

#member_join{
	
	margin-left : 60px;
	background: #1d2327;
	color:white;
	border-radius: 5px;
}
#member_join:hover{

	 font-weight: bold;
}

.join_login{
	border-top: 1px solid #909090;
}
#idSave{
	margin-bottom: 20px;
	margin-left: 100px;
}
</style>
</head>
<body>
<!--  헤더 부분 -->
	<%@ include file = "../common/header.jsp" %>
		<!--  메인 페이지  -->
		<form id="loginForm" action="<%= request.getContextPath()%>/loginMemberServlet.me" method="post">
		  <div id="wrap">
		   <div class="form">
		    <div class="form2">
		     <div class="form3">
		      <label for="user">아이디</label><input type="text" id="userId" name="userId">
		      <div class="clear"></div>
		      <label for="user">비밀번호</label><input type="password" id="userPwd"name="userPwd">
		     </div>
		    
		     <button type="submit" value="login" class="loginsub">로그인</button>
		     <div class="clear"></div>
		     <div class="form4">
		      <label id="idSave"><input type="checkbox">아이디저장</label>
		       
		      <div class="clear" ></div>
		     
		      <div class="join_login">
		      <label><input type="button" value="회원가입" id="member_join" onclick="location.href='<%=request.getContextPath()%>/joinForm.me'"></label> 
		      <label><input type="button" value="아이디 찾기" onclick="location.href='<%=request.getContextPath()%>/idFind.me'"></label>
		      <label><input type="button" value="비밀번호찾기" onclick="location.href='<%=request.getContextPath() %>/pwdFindForm.me'"/></label>
		      
		      </div>
		     </div>
		    </div>
		   </div>
		  </div>
		</form>


</body>





</html>