<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,review.model.vo.*, page.PageInfo"%>
    
  <%
  
/*   PageInfo pi=(PageInfo)request.getAttribute("pi");
  ArrayList<Board> bList=(ArrayList<Board>)request.getAttribute("bList");
  ArrayList<Attachment>fList=(ArrayList<Attachment>)request.getAttribute("fList"); */
  
  %>  
    
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
    <title>상품후기 목록페이지</title>
    
    
   <style>
   * {
  margin: 0;
  padding: 0;
}
body {
  margin: 0 auto;
  font-family: sans-serif;
}

section{
 margin-top:100px;
}

#title-box {
  box-sizing: content-box;
  position: absolute;
  top: 330px;
  left: 840px;
}

#review-title {
  font-size: 60px;
}
#route {
  color: #888;
  position: absolute;
  padding-left: 10px;
  width: 400px;
  left: 650px;
  font-size: 28px;
}
#route a {
  color: #888;
}

#route div {
  display: inline-block;
  padding-left: 10px;
}
#route a:hover {
  text-decoration: underline;
  color: yellowgreen;
}
#search-box-title {
  border: 2px solid darkgray;
  width: 140px;
  height: 49px;
  text-align: center;
  font-size: 18px;
}

#search-box-title {
  border: 2px solid darkgray;
  width: 140px;
  height: 49px;
  text-align: center;
  font-size: 18px;
}

#search {
  position: relative;
  right: 500px;
  top: 90px;
}
#search-box-option {
  border: 1px solid darkslategrey;
  width: 200px;
  height: 45px;
  text-align: center;
  font-size: 20px;
  background-color: gray;
  color: rgb(242, 243, 241);
  border-radius: 5px;
}
#search-box-option option {
  background-color: white;
  color: black;
}

#search-box {
  width: 250px;
  height: 45px;
}

/*타이틀, 검색부분*/

#review {
  width: 0%;
  position: absolute;
  left: 120px;
}

.review-list {
  box-sizing: content-box;
  position: absolute;
  display: flex;
  top: 400px;
}
.review-list-box {
  margin-left: 110px;
  border: 2px solid gray;

  width: 300px;
  height: 336px;
}
.review-list-innerbox {
  border-bottom: 2px solid #888;
  width: 300px;
  height: 200px;
}
.review-list-innerbox img	{
 width:290px;
 height:190px;

}

.review-list-text {
  text-align: center;
  line-height: 30px;
}
.review-list-text a {
  color: black;
  font-size: 16px;
}
.review-list h2{
   position:absolute;
   left: 700px;
   top:300px;
   width:500px;;
}



#paising {
  position: absolute;
  top: 1500px;
  left: 800px;
  display: flex;
}
#paising div {
  font-size: 28px;
  margin-right: 55px;
}

#paising-1 {
  box-sizing: content-box;
  text-align: center;
  background-color: yellowgreen;
  border-radius: 10px;
}

#paising-2:hover,
#paising-3:hover {
  background-color: yellowgreen;
  border-radius: 10px;
}

#insertBtn{
 position:relative;
 left:1800px;
 top:1300px;
}

   </style> 
</head>
<body>
    <%@ include file = "../common/header.jsp" %>

        <section id="title-box">
            <span id="review-title">상품후기</span>

            <div id="route">
            <div><a href="#">홈</a></div>
            <div>--></div>
            <div><a href="#">커뮤니티</a></div>
             <div>--></div>
            <div><a href="#">상품 후기</a></div>
            </div>

            <div id="search">
            <form action="#" method="#">
            <div id="search-box-bind">
              <select name="search-box-option" id="search-box-option">
                <option value="">전체 검색</option>
              <option value="">글 번호</option>
              <option value="">글 제목</option>
              <option value="">글 내용</option>
              </select>
              <input type="text" id="search-box">
              </form>
            </div>
          </div>
        </section>

         <section id="review">
            <div class="review-list">
               <%if(bList.isEmpty()||fList.isEmpty()){ %>
               		<h2>등록된 상품 후기가 없습니다.</h2>
               	<%}else{ %>
               	<%for(int i=0; i< bList.size(); i++){ %>
               	 	<%Board b=bList.get(i);%>
               	   <div class="review-list-box">
                 	    <input type="hidden"  value="<%=b.getBoardId() %>">
                 	    <div class="review-list-innerbox"> 
                    <%for (int j=0; j<fList.size(); j++){ %>
                         <%Attachment a=fList.get(j);%>
                         <%if(b.getBoardId()==a.getBoardId()){ %>
                         <img src="<%=request.getContextPath() %>/thumbnail_uploadFiles/<%=a.getChangeName() %>">
                       	<%} %>
					<%} %>
				</div>	
                       <div class="review-list-text"><a href="#">제목 :<%=b.getBoardTitle() %><br><%=b.getBoardWriter() %><br>새싹 샐러드(상품정보)<br><%=b.getCreateDate() %></a><br> 조회수 : <%=b.getBoardCount() %></div>
                    </div>
                   <%} %>
               <%} %>
            </div>
           
        </section>   
        
         <script>
		  $('.review-list-box').click(function(){
			 var bId=$(this).children().eq(0).val();
			 location.href='<%=request.getContextPath()%>/boardDetail.bo?bId='+bId;
		  });
  
 		</script>
        
        
         <input type="button" onclick="location.href='writeBoardForm.bo'" id="insertBtn" value="작성하기">
        

         <section id="paising">
       <!-- 맨 처음으로  -->
           <button type="button" onclick="location.href='/SemiTest_JSPServlet/boardList.bo?currentPage=1'">◀◀</button>
           <!-- 이전페이지 -->
            <button id="beforeBtn" onclick="location.href='/SemiTest_JSPServlet/boardList.bo?currentPage=<%=pi.getCurrentPage()-1 %>'" >◀ </button>
         <script>
		    if(<%=pi.getCurrentPage()%><=1){
		    	$('#beforeBtn').prop('disabled',true);
		    }
		  </script>
         
          <!-- 숫자버튼 -->
          <%for (int p=pi.getStartPage(); p<=pi.getEndPage();p++){ %>
           <%if(p == pi.getCurrentPage()){ %>
           <button  disabled>&nbsp;<%=p %>&nbsp;</button>
           <%} else{ %>
           <button onclick="location.href='/SemiTest_JSPServlet/boardList.bo?currentPage=<%=p%>'">&nbsp;<%=p %>&nbsp;</button>
            <% } %>
           <%} %>
           <!-- 다음 페이지로  -->
           <button id="afterBtn" onclick="location.href='/SemiTest_JSPServlet/boardList.bo?currentPage=<%=pi.getCurrentPage()+1 %>'" >▶ </button>
          <script>
          if(<%=pi.getCurrentPage() %>>=<%=pi.getMaxPage()%>){
			   $('#afterBtn').prop('disabled',true);
		   }
          </script>
          
           <!-- 맨 끝으로 -->
           <button onclick="location.href='/SemiTest_JSPServlet/boardList.bo?currentPage=<%=pi.getMaxPage()%>'">▶▶</button>
      </section>
       
            



        
            
    
</body>
</html>