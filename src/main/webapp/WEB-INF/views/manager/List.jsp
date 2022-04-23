<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<main id="main">
	<div class="contents" id="manageContent">
		<div id="inner">
			<div class="title">
				<h2 class="subTitle">
					<a href="../manager/ManageList.do">원생 관리</a>
				</h2>
			</div>
			<div class="searchBox" id="memberSearch">
				<form action="../manager/ManageList.do" method="GET">
					<label class="positionBox"> <span>분류</span> <select
						name="search_position" id="position">
							<option value=""
								<c:if test='${param.search_position eq ""}'>selected</c:if>>전체</option>
							<option value="S"
								<c:if test='${param.search_position eq "S"}'>selected</c:if>>원생</option>
							<option value="T"
								<c:if test='${param.search_position eq "T"}'>selected</c:if>>강사</option>
							<option value="F"
								<c:if test='${param.search_position eq "F"}'>selected</c:if>>직원</option>
							<!-- <option value="F" ${param.search_position eq 'F'?'selected':''}>직원</option>   이렇게 적으면 어떨지?? --> 
					</select>
					</label> <label class="subjectBox"> <span>과목</span> <select
						name="search_subject" id="search_subject">
							<option value=""
								<c:if test='${param.search_position eq ""}'>selected</c:if>>전체</option>
							<option value="first"
								<c:if test='${param.search_position eq "first"}'>selected</c:if>>1강의실:
								프론트엔드 개발자 양성과정</option>
							<option value="second"
								<c:if test='${param.search_position eq "second"}'>selected</c:if>>2강의실:
								백엔드 개발자 양성과정</option>
							<option value="third"
								<c:if test='${param.search_position eq "third"}'>selected</c:if>>3강의실:
								풀스택 개발자 양성과정</option>
							<option value="fourth"
								<c:if test='${param.search_position eq "fourth"}'>selected</c:if>>4강의실:
								퍼블리셔 양성과정</option>
							<option value="fifth"
								<c:if test='${param.search_position eq "fifth"}'>selected</c:if>>5강의실:
								인공지능 개발자 양성과정</option>
							<option value="sixth"
								<c:if test='${param.search_position eq "sixth"}'>selected</c:if>>6강의실:
								데이터 엔지니어 양성과정</option>
					</select>
					</label> <label class="nameBox"> <span>이름</span> <input type="text"
						name="search_name" id="search_name" value="" />
					</label>
					<button class="btn" type="submit">
						<span class="material-icons"> search </span>
					</button>
				</form>
			</div>
			<div class="viewer" id="viewer">
				<form action="../manager/DeleteListProcess.do" method="GET"
					id="delete">
					<table>
						<colgroup>
							<col style="width: 2.5%" />
							<col style="width: 3.5%" />
							<col style="width: 8%" />
							<col style="width: 12%" />
							<col style="width: 30%" />
							<col style="width: 10%" />
							<col style="width: 20%" />
							<col style="width: 7%" />
							<col style="width: 7%" />
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" name="allSelected"
									id="allSelected" /></th>
								<th>순서</th>
								<th>이름</th>
								<th>아이디</th>
								<th>과목</th>
								<th>전화번호</th>
								<th>이메일</th>
								<th>분류</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${memberList}" var="memberDto">
								<c:set var="i" value="${i+1 }" />
								<%-- <fmt:parseDate value="${memberDto.regDate }" var="convertDate"
									pattern="yyyy-MM-dd HH:mm:ss" /> --%>
								<tr>
									<td><input type="checkbox" name="selected" id="selected"
										value=${memberDto.code } /></td>
									<td>${i }</td>
									<td><a href="../manager/Info.do?code=${memberDto.code }">${memberDto.name }</a></td>
									<td>${memberDto.id }</td>
									<c:choose>
										<c:when test="${memberDto.subject eq 'first' }">
											<td>1강의실: 프론트엔드 개발자 양성과정</td>
										</c:when>
										<c:when test="${memberDto.subject eq 'second' }">
											<td>2강의실: 백엔드 개발자 양성과정</td>
										</c:when>
										<c:when test="${memberDto.subject eq 'third' }">
											<td>3강의실: 풀스택 개발자 양성과정</td>
										</c:when>
										<c:when test="${memberDto.subject eq 'fourth' }">
											<td>4강의실: 퍼블리셔 양성과정</td>
										</c:when>
										<c:when test="${memberDto.subject eq 'fifth' }">
											<td>5강의실: 인공지능 개발자 양성과정</td>
										</c:when>
										<c:when test="${memberDto.subject eq 'sixth' }">
											<td>6강의실: 데이터 엔지니어 양성과정</td>
										</c:when>
										<c:otherwise>
											<td>-</td>
										</c:otherwise>
									</c:choose>
									<td>${memberDto.tell }</td>
									<c:choose>
										<c:when test="${empty memberDto.email }">
											<td>-</td>
										</c:when>
										<c:otherwise>
											<td>${memberDto.email }</td>
										</c:otherwise>
									</c:choose>
									<c:if test="${memberDto.position eq 'S' }">
										<td>학생</td>
									</c:if>
									<c:if test="${memberDto.position eq 'T' }">
										<td>강사</td>
									</c:if>
									<c:if test="${memberDto.position eq 'F' }">
										<td>직원</td>
									</c:if>
									<td><fmt:formatDate value="${memberDto.regDate }"
											pattern="MM/dd" />
											</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
			<div class="btns">
				<a href="Create.do" class="btn create btnConfirm">신규 등록</a>
				<button type="submit" form="delete" class="btn btnCancel">삭 제</button>
			</div>
		</div>
	</div>
	<!-- 	<div class="sidebar">
		<ul>
			<li><a href="Create.do">신규 등록</a></li>
			<li><a href="">경영 관리</a></li>
		</ul>
	</div> -->
</main>
<%@ include file="../include/footer.jsp"%>
