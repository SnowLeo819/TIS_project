
<%@page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
<main>
	<div class="title">
		<h2 class="subTitle">BOARD LIST(Category : 
			<c:choose>
				<c:when test="${param.cate_select==''||param.cate_select==null}">All</c:when>
				<c:when test="${param.cate_select=='notice'}">notice</c:when>
				<c:when test="${param.cate_select=='question'}">question</c:when>
				<c:when test="${param.cate_select=='etc'}">etc</c:when>
			</c:choose>
		)</h2>
	</div>
	<div class="inner">
		<div id="contents">
			<div class="tableBox">
				<table class="board">
					<colgroup>
						<col style="width: 100px">
						<col style="width: 250px">
						<col style="width: 550px">
						<col style="width: 250px">
						<col style="width: 250px">
						<col style="width: 100px">
					</colgroup>
					<thead>
						<tr>
							<th>NO</th>
							<th>CATEGORY</th>
							<th>TITLE</th>
							<th>ID</th>
							<th>DATE</th>
							<th>HIT</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${boardList }" var="boardDto" varStatus="loop" begin="0" end="${totalPage }">
						<tr>
							<%-- <td>${boardDto.no }</td> --%>
							<td>${totalPage - (clickPage-1) * listPerPage - loop.index}</td>
							<td>${boardDto.category }</td>
							<td class="space${boardDto.reStep } left">
								<%-- <c:if test="${boardDto.reStep > 1 }">
									<span class="material-icons">subdirectory_arrow_right</span>
								</c:if> --%>
								<a href="../board/View.do?no=${boardDto.no }&num=${boardDto.num}&cate_select=${param.cate_select}&search_select=${param.search_select}&search_word=${param.search_word}">${boardDto.title }</a>
							</td>
							<td>${boardDto.id }</td>
							<td>${boardDto.regDate }</td>
							<td>${boardDto.hit }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="pagination">
					<ul>
						${page }
					</ul>
				</div>
				<form action="../board/List.do" class="form" method="GET">
					<div class="searchBox">
						<select name="cate_select">
							<option value=""  	 ${param.cate_select==""?"selected":"" }>전체</option>
							<option value="notice"   ${param.cate_select=="notice"?"selected":"" }>공지사항</option>
							<option value="question" ${param.cate_select=="question"?"selected":"" }>질의문답</option>
							<option value="etc" ${param.cate_select=="etc"?"selected":"" }>기타뭔들</option>
						</select>
						<select name="search_select">
							<option value="title"  ${param.search_select=="title"?"selected":"" }>제목</option>
							<option value="id"     ${param.search_select=="id"?"selected":"" }>작성자</option>
							<option value="contents" ${param.search_select=="contents"?"selected":"" }>내용</option>
						</select>
						<input type="text" placeholer="검색할 내용을 입력해 주세요." name="search_word"  value="${param.search_word }">
						<button class="btn btnBlack">검색</button>
					</div>
				</form>
				<div class="btns">
					<!-- 로그인 안되어 있으면 버튼 안뜨게... c:if -->
					<%-- <c:if test="${not empty loggedMember }"> --%>
						<a href="../board/Write.do" class="btn btnConfirm">글쓰기</a>
					<%-- </c:if> --%>
				</div>
			</div>
		</div>
		<div class="sideBar">
			<ul class="list">
	          <li class="mainItem  ${param.cate_select==''?'on':param.cate_select==null?'on':''}">
	            <a href="../board/List.do?cate_select=">
	              <p>전체 게시판</p>
	            </a>
	          </li>
	          <li class="subItem  ${param.cate_select=='notice'?'on':''}">
	            <a href="../board/List.do?cate_select=notice">
	              <p>공지사항</p>
	            </a>
	          </li>
	          <li class="subItem  ${param.cate_select=='question'?'on':''}">
	            <a href="../board/List.do?cate_select=question">
	              <p>질의문답</p>
	            </a>
	          </li>
	          <li class="subItem  ${param.cate_select=='etc'?'on':''}">
	            <a href="../board/List.do?cate_select=etc">
	              <p>기타문의</p>
	            </a>
	          </li>
	        </ul>
		</div>	
	</div>
</main>
<script>

	console.log(${not empty loggedMember });
	$(".btnConfirm").on("click",function(){
		if(${empty loggedMember }) {
			alert("로그인 해야 글을 쓸 수 있습니다."); 
			location.href="../member/Login.do";
			/* location.href="../board/Write.do"; */
			return false;
		}
	});
	
</script>
<%@ include file="../include/footer.jsp"%>

