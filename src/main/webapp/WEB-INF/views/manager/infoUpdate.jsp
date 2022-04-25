<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<main id="main">
	<div class="contents">
		<div id="inner">
			<div class="title">
				<h2><a href="../manager/ManageList.do">원생정보 수정</h2>
			</div>
			<form action="../manager/InfoUpdateProcess.do?code=${memberDto.code }" method="POST" id="info"  class="form" >
					<table>
						<caption><span class="caution">※ 분류, 아이디, 비밀번호 변경은 삭제 후 재등록 해야합니다.</span></caption>
						<colgroup>
							<col style="width: 20%" />
							<col style="width: 80%" />
						</colgroup>
						<tr>
							<th>이름<span class="required">⁕</span></th>
							<td><input type="text" name="name" id="name" value="${memberDto.name }" /></td>
						</tr>
						<tr>
							<th>분류</th>
							<td class="left"><c:if test="${memberDto.position eq 'S' }"> 원생 </c:if> <c:if test="${memberDto.position eq 'T' }"> 강사 </c:if> <c:if test="${memberDto.position eq 'F' }"> 직원 </c:if></td>
						</tr>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="id" id="user_id" value="${memberDto.id }" readonly /></td>
						</tr>
						<tr>
							<th>비밀번호<span class="required">⁕</span></th>
							<td><input type="password" name="password" id="user_pw" placeholder="비밀번호를 입력하세요." /></td>
						</tr>
						<tr>
							<th>전화번호<span class="required">⁕</span></th>
							<td class="left">
								<select name="tellFirst" class="short tell">
									<c:if test="${memberDto.tellFirst eq '010' }">
										<option value="010" selected>010</option>
										<option value="011">011</option>
										<option value="02">02</option>
									</c:if>
									<c:if test="${memberDto.tellFirst eq '011' }">
										<option value="010">010</option>
										<option value="011" selected>011</option>
										<option value="02">02</option>
									</c:if>
									<c:if test="${memberDto.tellFirst eq '02' }">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="02" selected>02</option>
									</c:if>
								</select>
								- <input type="number" name="tellMiddle" id="tellMiddle" class="tell short" value="${memberDto.tellMiddle }" /> -
								<input type="number" name="tellLast" id="tellLast" class="tell short" value="${memberDto.tellLast }" />
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" name="email" id="user_email" value="${memberDto.email }" /></td>
						</tr>
						<tr>
							<th>과목</th>
							<td>
								<select name="subject" id="search_subject">
									<option value="null">전체</option>
									<c:if test="${memberDto.subject eq 'first' }">
										<option value="first" selected>1강의실: 프론트엔드 개발자 양성과정</option>
										<option value="second">2강의실: 백엔드 개발자 양성과정</option>
										<option value="third">3강의실: 풀스택 개발자 양성과정</option>
										<option value="fourth">4강의실: 퍼블리셔 양성과정</option>
										<option value="fifth">5강의실: 인공지능 개발자 양성과정</option>
										<option value="sixth">6강의실: 데이터 엔지니어 양성과정</option>
									</c:if>
									<c:if test="${memberDto.subject eq 'second' }">
										<option value="first">1강의실: 프론트엔드 개발자 양성과정</option>
										<option value="second" selected>2강의실: 백엔드 개발자 양성과정</option>
										<option value="third">3강의실: 풀스택 개발자 양성과정</option>
										<option value="fourth">4강의실: 퍼블리셔 양성과정</option>
										<option value="fifth">5강의실: 인공지능 개발자 양성과정</option>
										<option value="sixth">6강의실: 데이터 엔지니어 양성과정</option>
									</c:if>
									<c:if test="${memberDto.subject eq 'third' }">
										<option value="first">1강의실: 프론트엔드 개발자 양성과정</option>
										<option value="second">2강의실: 백엔드 개발자 양성과정</option>
										<option value="third" selected>3강의실: 풀스택 개발자 양성과정</option>
										<option value="fourth">4강의실: 퍼블리셔 양성과정</option>
										<option value="fifth">5강의실: 인공지능 개발자 양성과정</option>
										<option value="sixth">6강의실: 데이터 엔지니어 양성과정</option>
									</c:if>
									<c:if test="${memberDto.subject eq 'fourth' }">
										<option value="first">1강의실: 프론트엔드 개발자 양성과정</option>
										<option value="second">2강의실: 백엔드 개발자 양성과정</option>
										<option value="third">3강의실: 풀스택 개발자 양성과정</option>
										<option value="fourth" selected>4강의실: 퍼블리셔 양성과정</option>
										<option value="fifth">5강의실: 인공지능 개발자 양성과정</option>
										<option value="sixth">6강의실: 데이터 엔지니어 양성과정</option>
									</c:if>
									<c:if test="${memberDto.subject eq 'fifth' }">
										<option value="first">1강의실: 프론트엔드 개발자 양성과정</option>
										<option value="second">2강의실: 백엔드 개발자 양성과정</option>
										<option value="third">3강의실: 풀스택 개발자 양성과정</option>
										<option value="fourth">4강의실: 퍼블리셔 양성과정</option>
										<option value="fifth" selected>5강의실: 인공지능 개발자 양성과정</option>
										<option value="sixth">6강의실: 데이터 엔지니어 양성과정</option>
									</c:if>
									<c:if test="${memberDto.subject eq 'sixth' }">
										<option value="first">1강의실: 프론트엔드 개발자 양성과정</option>
										<option value="second">2강의실: 백엔드 개발자 양성과정</option>
										<option value="third">3강의실: 풀스택 개발자 양성과정</option>
										<option value="fourth">4강의실: 퍼블리셔 양성과정</option>
										<option value="fifth">5강의실: 인공지능 개발자 양성과정</option>
										<option value="sixth" selected>6강의실: 데이터 엔지니어 양성과정</option>
									</c:if>
								</select>
							</td>
						</tr>
						<tr>
							<th>등록일<span class="required">⁕</span></th>
							<td class="left"><input type="date" name="regDate" id="regDate" value="${memberDto.regDate}" /></td>
						</tr>
					</table>
					<div class="btns">
						<a href="javascript:history.back(-1)" class="btn btnCancel">뒤로 가기</a>
						<button type="submit" class="btn btnConfirm">확 인</button>
					</div>
				<%-- </div> --%>
			</form>
		</div>
	</div>
</main>

<%@ include file="../include/footer.jsp"%>