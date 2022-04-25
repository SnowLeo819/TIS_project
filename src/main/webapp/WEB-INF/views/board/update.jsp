<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<main>
	<div class="contents">
		<div id="inner">
			<div class="title">
				<h2 class="subTitle">UPDATE</h2>
			</div>
			<!-- 데이터 받아서 처리하기....forward방식으로 데이터 보여주기....  -->
			<form method="POST" action="../board/UpdateProcess.do" id="join" class="form">
				<input  type="hidden" name="no" value="${param.no }">
				<table class="left">
					<colgroup>
						<col style="width: 20%">
						<col style="width: 80%">
					</colgroup>
					<tbody>
						<tr>
							<th>카테고리</th>
							<td>
								<select name="category">
									<option value="notice"   ${boardDto.category=="notice"?"selected":"" }>공지사항</option>
									<option value="question" ${boardDto.category=="question"?"selected":"" }>질의문답</option>
									<option value="etc" ${boardDto.category=="etc"?"selected":"" }>기타문의</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>title <span class="required">*</span></th>
							<td><input type="text" name="title" id="title" value="${boardDto.title}"></td>
						</tr>
						<tr>
							<th>id <span class="required">*</span></th>
							<td><input type="text" name="id" id="id" value="${boardDto.id}" readonly class="readonly">
						</tr>
						<tr>
							<th>contents<span class="required">*</span></th>
							<td class="left">
							<textarea name="contents" id="summernote" >${boardDto.contents }</textarea>
							</td>
						</tr>
					</tbody>
				</table>
				<input type="hidden" name="code" id="code" value="${boardDto.code}">
				<div class="btns">
					<button type="submit" class="btn btnConfirm">저장</button>
					<button type="reset" id="goBack" class="btn btnCancel" onclick="window.history.back()">취소</button>
				</div>
			</form>
		</div>
		<div class="sideBar">
			<ul class="list">
				<li class="mainItem ${param.cate_select==''?'on':param.cate_select==null?'on':''}">
					<a href="../board/List.do?cate_select=">
						<p>전체 게시판</p>
					</a>
				</li>
				<li class="subItem ${param.cate_select=='notice'?'on':''}">
					<a href="../board/List.do?cate_select=notice">
						<p>공지사항</p>
					</a>
				</li>
				<li class="subItem ${param.cate_select=='question'?'on':''}">
					<a href="../board/List.do?cate_select=question">
						<p>질의문답</p>
					</a>
				</li>
				<li class="subItem ${param.cate_select=='etc'?'on':''}">
					<a href="../board/List.do?cate_select=etc">
						<p>기타문의</p>
					</a>
				</li>
			</ul>
		</div>
	</div>
</main>
<%@ include file="../include/footer.jsp"%>






