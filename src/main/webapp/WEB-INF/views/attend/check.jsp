<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<main>
	<div class="contents">
		<div id="inner">
			<div class="title">
				<h2 class="subTitle">check</h2>
			</div>
			<!-- 데이터 받아서 처리하기....forward방식으로 데이터 보여주기....  -->
			<table class="left">
				<colgroup>
					<col style="width: 50%">
					<col style="width: 50%">
				</colgroup>
				<tbody>
				<%-- 폼 구조 조금 이상함.. 확인 필요 --%>
					<tr> 
						<form method="POST" action="../attend/AttendCheckProcess.do" id="join"
							class="form">
							<input  type="hidden" name="code" value="${loggedMember.code}">
							<th><button type="submit" id="attend">출첵<button></th>
						</form>	
						</tr>
						<tr>
						<form method="POST" action="../attend/AttendOutProcess.do" id="join"
							class="form">
							<input  type="hidden" name="code" value="${loggedMember.code}">
							<th><button type="submit" id="leave">퇴실<button></th>
						</tr>
				</tbody>
			</table>
		</div>
	</div>
</main>

<%@ include file="../include/footer.jsp"%>

