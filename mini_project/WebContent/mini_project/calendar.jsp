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
			
			<div class="todo-wrap">
					<div class="todo-title">Todo List</div>
					<div class="input-wrap">
						<input type="text" placeholder="please write here!!" id="input-box" class="input-box">
						<button type="button" id="input-data" class="input-data">INPUT</button>
						<div id="input-list" class="input-list"></div>
					</div>
				</div>
			
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
			</div>
		</div>
		<!-- // .my-calendar -->
	</div>
	<script type="text/javascript" src="./js/showCalendar.js"></script>
</body>
</html>