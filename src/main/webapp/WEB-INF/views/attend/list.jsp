<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>


<main>
	<div class="inner">
		<div class="head">
			<h2 class="subTitle">출결관리</h2>
		</div>
		 <input type="date" id="now_date">
		<div id="contents">
			<div class="tableBox">
				<table>
					<colgroup>
						<col style="width: 50px">
						<col style="width: 80px">
						<col style="width: 80px">
						<col style="width: 150px">
						<col style="width: 100px">
						<col style="width: 100px">
						<col style="width: 100px">
						<col style="width: 100px">

					</colgroup>
					<thead>

						<tr>
							<th>번호</th>
							<th>코드</th>
							<th>이름</th>
							<th>과목</th>
							<th>날짜</th>
							<th>출석</th>
							<th>퇴실</th>
							<th>출결상태</th>


						</tr>

					</thead>
					<tbody>
						<c:forEach items="${attendList}" var="attendDto" varStatus="loop"
							begin="0">
						<fmt:parseDate value="${attendDto.attendDate }" var="attendDate" pattern="yyyy-MM-dd" />	
						<fmt:parseDate value="${attendDto.attendTime }" var="attendTime"  pattern="yyyy-MM-dd HH:mm:ss.S" />
						<fmt:parseDate value="${attendDto.leaveTime }" var="leaveTime"  pattern="yyyy-MM-dd HH:mm:ss.S" />	
						
							<tr>
								<td>${attendDto.no}</td>
								<td>${attendDto.code}</td>
								<td><a href="../attend/AttendInfo.do?no=${attendDto.no }">${attendDto.name }</td>
								<td>${attendDto.subject }</td>
								<td><fmt:formatDate value="${attendDate }" pattern="yyyy-MM-dd" /></td>
								<td><fmt:formatDate value="${attendTime }" pattern="HH:mm" /></td>
								<td><fmt:formatDate value="${leaveTime }" pattern="HH:mm" /></td>
								<td>${attendDto.state }</td>
								
								

							</tr>
						</c:forEach>
					</tbody>

				</table>
				</form>
			</div>
		</div>
	</div>
	<aside class="sidebar">
		<ul class="sidemenu">
			<li><a href="../attend/attendAllList.do">출결 관리</a></li>
			<li><a href="#">수업 일정</a></li>
			
			
		</ul>
	</aside>
</main>
<%@ include file="../include/footer.jsp"%>