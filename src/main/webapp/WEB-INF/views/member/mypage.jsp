<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<main>
	<div class="contents">
		<div id="inner">
			<div class="title">
				<h2 class="subTitle">마이 페이지</h2>
			</div>
			<form method="POST" action="../member/EditMypage.do" id="Mypage"
				class="form" enctype="multipart/form-data">
				<table class="left">
					<colgroup>
						<col style="width: 20%">
						<col style="width: 80%">
					</colgroup>
					<tbody>
						<tr>
							<th>아이디</th>
							<td>${member.id}</td>
						</tr>
						<tr>
							<th>분류</th>
							<c:if test="${member.position eq 'S' }">
								<td>학생</td>
							</c:if>
							<c:if test="${member.position eq 'T' }">
								<td>강사</td>
							</c:if>
							<c:if test="${member.position eq 'F' }">
								<td>직원</td>
							</c:if>
							<c:if test="${member.position eq 'M' }">
								<td>관리자</td>
							</c:if>
						</tr>
						<tr>
							<th>이름</th>
							<td>${member.name }</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${member.email }</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>${member.tell }</td>
						</tr>
						<tr>
						<th>과목</th>
						<c:if test="${member.subject eq 'first' }">
							<td>1강의실: 프론트엔드 개발자 양성과정</td>
						</c:if>
						<c:if test="${member.subject eq 'second' }">
							<td>2강의실: 백엔드 개발자 양성과정</td>
						</c:if>
						<c:if test="${member.subject eq 'third' }">
							<td>3강의실: 풀스택 개발자 양성과정</td>
						</c:if>
						<c:if test="${member.subject eq 'fourth' }">
							<td>4강의실: 퍼블리셔 양성과정</td>
						</c:if>
						<c:if test="${member.subject eq 'fifth' }">
							<td>5강의실: 인공지능 개발자 양성과정</td>
						</c:if>
						<c:if test="${member.subject eq 'sixth' }">
							<td>6강의실: 데이터 엔지니어 양성과정</td>
						</c:if>
						<c:if test="${member.subject eq null }">
							<td>-</td>
						</c:if>
					</tr>
					</tbody>
				</table>
				<div class="btns">
					<a href="../member/EditMypage.do" class="btn btnConfirm">수정하기</a>
					<button type="reset" class="btn btnCancel" onclick="window.history.back()">뒤로가기</button>
				</div>
			</form>
		</div>
	</div>
</main>
<%@ include file="../include/footer.jsp"%>






