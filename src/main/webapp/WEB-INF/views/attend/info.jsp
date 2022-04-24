
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<main>
	<div class="contents">
		<div id="inner">
			<div class="title">
				<h2 class="subTitle">STUDENTS INFO</h2>
			</div>
			<div class="tableBox">
				<table class="left">
					<colgroup>
						<col style="width: 20%" />
						<col style="width: 80%" />
					</colgroup>
					<tbody>
						<fmt:parseDate value="${attendDto.attendDate }" var="attendDate" pattern="yyyy-MM-dd" />
						<fmt:parseDate value="${attendDto.attendTime }" var="attendTime" pattern="yyyy-MM-dd HH:mm:ss.S" />
						<fmt:parseDate value="${attendDto.leaveTime }" var="leaveTime" pattern="yyyy-MM-dd HH:mm:ss.S" />
						<tr>
							<th>code</th>
							<td>${attendDto.code }</td>
						</tr>
						<tr>
							<th>name</th>
							<td>${attendDto.name }</td>
						</tr>
						<tr>
							<th>subject</th>
							<td>${attendDto.subject }</td>
						</tr>
						<tr>
							<th>attendDate</th>
							<td><fmt:formatDate value="${attendDate }" pattern="yyyy-MM-dd" /></td>
						</tr>
						<tr>
							<th>attendTime</th>
							<td><fmt:formatDate value="${attendTime }" type="time" /></td>
						</tr>
						<tr>
							<th>leaveTime</th>
							<td><fmt:formatDate value="${leaveTime }" type="time" /></td>
						</tr>
						<tr>
							<th>출결확인</th>
							<td>${attendDto.state }</td>
						</tr>
					</tbody>
				</table>
				<div class="btns">
					<a href="../attend/AttendUpdate.do?no=${attendDto.no }" class="btn btnConfirm">수정</a>
					<%-- <a href="../attend/AttendDelete.do?no=${attendDto.no }" class="btn btnCancel">삭제</a> --%>
					<button type="reset" class="btn btnCancel" onclick="window.history.back()">취소</button>
				</div>
			</div>
		</div>
	</div>
</main>



<%@ include file="../include/footer.jsp"%>
