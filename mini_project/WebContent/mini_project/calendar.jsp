<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../commons/header.jsp" %> 
<link rel="stylesheet" type="text/css" href="css/cale_form.css" />
<br/>
   <div class="container" align="center">
      <div class="my-calendar clearfix">
         <div class="clicked-date">
            <div class="cal-day"></div>
            <div class="cal-date"></div>
         </div>
         
         <!--  <div class="todo-wrap">
               <div class="todo-title">Todo List</div>
               <div class="input-wrap">
                  <div id="input-list" class="input-list"></div>
               </div>
            </div> -->
         <form id="frm" method="GET">
         <div class="calendar-box">
            <div class="ctr-box clearfix">
               <button type="button" title="prev" class="btn-cal prev"></button>
               <span class="cal-month"></span> <span class="cal-year"></span>
               <button type="button" title="next" class="btn-cal next"></button>
            </div>
            <table class="cal-table">
               <thead>
                  <tr>
                     <th>S</th>
                     <th>M</th>
                     <th>T</th>
                     <th>W</th>
                     <th>T</th>
                     <th>F</th>
                     <th>S</th>
                  </tr>
               </thead>
               <tbody class="cal-body"></tbody>
            </table>
            
            <button type="button" id="input-bt" name="input-bt" class="input-bt" onclick="check();">Check</button>
            <input type="text" id="user_id" name="user_id" value="test" style="display: none;"/>
            <input type="text" id="date_format" name="date_format" value="test" style="display: none;"/>
         </div>
         </form>
         
      </div>
<!--       // .my-calendar -->
   </div>
   <script type="text/javascript" src="./js/showCalendar.js"></script>
   <script>
   /* Input Button Click Event */
   function check(){
      var user_id = '<%=user_id2 %>';
      var today_2 = new Date();
      var today_format;
      //year, month, day Value
      today_format = today_2.getFullYear() + '.' + (today_2.getMonth()+1) + '.' + today_2.getDate();
      //today_2.getFullYear() + '-' + today_e2.getMonth()+ '-' + today_2.getDate() 를 DB에 저장
      //check_action();
      document.getElementById('frm').action = 'check_action.jsp';
      document.getElementById('user_id').value = '<%=user_id2 %>';
      document.getElementById('date_format').value = today_format;
      document.getElementById('frm').submit();
   }
   </script>
</body>
</html>