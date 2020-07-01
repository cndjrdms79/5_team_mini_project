<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String user_id = (String)session.getAttribute("user_id");
   String user_name = (String)session.getAttribute("user_name");
%>
<%@ include file = "../commons/header.jsp" %>

<%if(user_id != null){ %>
<script type="text/javascript">
   alert('<%= user_id + "(" + user_name + ")님이 로그인" %>');
</script>
<%} %>
   <body>
   <div class="cover-container mx-auto flex-column">
     <main role="main" class="inner cover">
     <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
    
      <img src="./img/bg1.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h1>인공지능 개발자 과정 교육생을 위한 커뮤니티입니다.</h1></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br>
        <p>Copyright 2020. dumptruck. Ltd. all rights reserved.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="./img/bg2.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h1>오늘 배운 내용을 교육생들과 공유해보세요!</h1></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br>
        <p>Copyright 2020. dumptruck. Ltd. all rights reserved.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="./img/bg3.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h1>본 웹 페이지는 인공지능 MINI PROJECT 산출물 입니다.</h1></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br>
        <p>Copyright 2020. dumptruck. Ltd. all rights reserved.</p>
      </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
     </main>
   </div>
<%@ include file="../commons/footer.jsp" %>
</body>
</html>    