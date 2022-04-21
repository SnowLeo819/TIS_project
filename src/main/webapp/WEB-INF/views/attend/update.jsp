<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<main>
	<div class="contents">
		<div class="title">
			<h2 class="subTitle">UPDATE</h2>
		</div>
		<div id="inner">
			<!-- 데이터 받아서 처리하기....forward방식으로 데이터 보여주기....  -->
			<form method="POST" action="../attend/AttendUpdateProcess.do" id="join" class="form" enctype="multipart/form-data">
				<table class="left">
					<colgroup>
						<col style="width: 20%" />
						<col style="width: 80%" />
					</colgroup>
					<tbody>
						<tr>
							<th>no</th>
							<td>
								<input type="text" name="no" id="no" value="${attendDto.no}" readonly class="readonly" />
							</td>
						</tr>
						<tr>
							<th>code</th>
							<td>
								<input type="text" name="code" id="code" value="${attendDto.code}" readonly class="readonly" />
							</td>
						</tr>
						<tr>
							<th>이름 <span class="required">*</span></th>
							<td><input type="text" name="name" id="name" value="${attendDto.name}" readonly class="readonly" /></td>
						</tr>
						<tr>
							<th>과정</th>
							<td>
								<input type="text" name="subject" id="subject" value="${attendDto.subject}" readonly class="readonly" />
							</td>
						</tr>
						<tr>
							<fmt:parseDate value="${attendDto.attendDate }" var="loattendDate" pattern="yyyy-MM-dd" />
							<th>날짜</th>
							<td><input type="date" name="attendDate" id="attendDate" readonly class="readonly" value="<fmt:formatDate value="${loattendDate }" pattern="yyyy-MM-dd" />"></td>
						</tr>
						<tr>
							<th>출석</th>
							<td>
								<fmt:parseDate value="${attendDto.attendTime }" var="loattendTime" pattern="yyyy-MM-dd HH:mm:ss.S" />
								<input type="TIME" name="attendTime" id="attendTime" value="<fmt:formatDate value="${loattendTime }" pattern="HH:mm" />">
							</td>
						</tr>
						<tr>
							<th>퇴실</th>
							<fmt:parseDate value="${attendDto.leaveTime }" var="loleaveTime" pattern="yyyy-MM-dd HH:mm:ss.S" />
							<td><input type="TIME" name="leaveTime" id="leaveTime" value="<fmt:formatDate value="${loleaveTime }" pattern="HH:mm" />"></td>
						</tr>
						<tr>
							<th>출결확인</th>
							<td>
								<input type="radio" name="state" id="state" value="출석" />출석 <input type="radio" name="state" id="state" value="지각" />지각
								<input type="radio" name="state" id="state" value="조퇴" />조퇴
							</td>
						</tr>
					</tbody>
				</table>
				<div class="btns">
					<button type="submit" class="btn btnConfirm">수정</button>
					<button type="reset" onclick="window.history.back()" class="btn btnCancel">취소</button>
				</div>
			</form>
		</div>
	</div>
</main>

<%@ include file="../include/footer.jsp"%>

