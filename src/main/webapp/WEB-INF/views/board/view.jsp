<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<main>
	<div class="inner">
		<div class="title">
			<h2 class="subTitle">VIEW</h2>
		</div>
		<div id="contents">
			<!-- 데이터 받아서 처리하기....forward방식으로 데이터 보여주기....  -->
			<div class="form">
				<table class="left">
					<colgroup>
						<col style="width: 150px" />
						<col style="width: 600px" />
						<col style="width: 150px" />
						<col style="width: 500px" />
					</colgroup>
					<tbody>
						<tr>
							<th>CATEGORY</th>
							<td class="left">${boardDto.category }</td>
							<th>HIT</th>
							<td class="left">${boardDto.hit }</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td class="left">${boardDto.id }</td>
							<th>DATE</th>
							<td class="left">${boardDto.regDate }</td>
						</tr>
						<tr>
							<th>TITLE</th>
							<td colspan="3" class="left">${boardDto.title }</td>
						</tr>
						<tr>
							<th>CONTENTS</th>
							<td colspan="3" class="left">${boardDto.contents }</td>
						</tr>
					</tbody>
				</table>

				<!-- 다음 글 이전 글 보기 -->
				<div class="prevAndNext">
					<div class="item">
						<div class="direc">
							<span class="material-icons">keyboard_arrow_up</span>
							<span class="target">PREV</span>
						</div>
						<c:if test="${empty prevBoard }">
							<a href="">이전글 없음</a>
						</c:if>
						<a href="../board/View.do?no=${prevBoard.no }&num=${prevBoard.num}&cate_select=${param.cate_select}&search_select=${param.search_select}&search_word=${param.search_word}"
							>${prevBoard.title }</a
						>
					</div>
					<div class="item">
						<div class="direc">
							<span class="material-icons">keyboard_arrow_down</span>
							<span class="target">NEXT</span>
						</div>
						<c:if test="${empty nextBoard  }">
							<a href="">다음글 없음</a>
						</c:if>
						<a href="../board/View.do?no=${nextBoard.no }&num=${nextBoard.num}&cate_select=${param.cate_select}&search_select=${param.search_select}&search_word=${param.search_word}"
							>${nextBoard.title }</a
						>
					</div>
				</div>

				<!-- 삭제 수정이 내가 쓴 글에만 보이게... -->
				<div class="btns">
					<a href="../board/List.do" class="btn btnConfirm">목록</a>
					<c:if test="${boardDto.code == loggedCode }">
						<a href="../board/Update.do?no=${param.no }" class="btn btnConfirm">수정</a>
						<a href="../board/Delete.do?no=${param.no }" class="btn btnCancel">삭제</a>
					</c:if>
				</div>
			</div>
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






