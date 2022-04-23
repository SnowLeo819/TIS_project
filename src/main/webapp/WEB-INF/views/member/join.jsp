<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<main>
	<div class="contents">
		<div id="inner">
			<div class="title">
				<h2 class="subTitle">JOIN</h2>
			</div>
			<form method="POST" action="../member/JoinProcess.do" id="join" class="form" enctype="multipart/form-data">
				<table class="left">
					<colgroup>
						<col style="width: 20%" />
						<col style="width: 80%" />
					</colgroup>
					<tbody>
						<tr>
							<th>아이디 <span class="required">*</span></th>
							<td>
								<input type="text" name="id" id="user_id" placeholder="아이디를 입력하세요." style="width: calc(100% - 120px)" />
								<button type="button" class="btn btnIdCheck sticker" id="btnIdCheck">ID중복체크</button>
							</td>
						</tr>
						<tr>
							<th>패스워드 <span class="required">*</span></th>
							<td><input type="password" name="password" id="user_pw" placeholder="비밀번호를 입력하세요." /></td>
						</tr>
						<tr>
							<th>패스워드 확인 <span class="required">*</span></th>
							<td><input type="password" name="user_pw_confirm" id="user_pw_confirm" placeholder="비밀번호를 입력하세요." /></td>
						</tr>
						<!-- 
						식별코드 랜덤으로 생성하는 게 좋을 거 같아서 생략할게요!
						<tr>
							<th>식별코드 <span class="required">*</span></th>
							<td><input type="text" name="code" id="code"
								placeholder="코드 입력."></td>
						</tr> -->
						<tr>
							<th>이름 <span class="required">*</span></th>
							<td><input type="text" name="name" id="user_name" placeholder="이름을 입력하세요." /></td>
						</tr>
						<tr>
							<th>이메일 <span class="required">*</span></th>
							<td><input type="text" name="email" id="user_email" placeholder="메일을 입력하세요." /></td>
						</tr>
						<tr>
							<th>전화번호 <span class="required">*</span></th>
							<td>
								<select name="tellFirst" class="short">
									<option value="010" selected>010</option>
									<option value="011">011</option>
									<option value="02">02</option>
								</select> - 
								<input type="text" name="tellMiddle" class="short" id="user_phone_middle" placeholder="전화번호를 입력하세요." /> - 
								<input type="text" name="tellLast" class="short" id="user_phone_last" placeholder="전화번호를 입력하세요." />
							</td>
						</tr>
						<tr>
							<th>과목</th>
							<td>
								<select name="subject" id="subject">
									<option value="">전체</option>
									<option value="first">1강의실: 프론트엔드 개발자 양성과정</option>
									<option value="second">2강의실: 백엔드 개발자 양성과정</option>
									<option value="third">3강의실: 풀스택 개발자 양성과정</option>
									<option value="fourth">4강의실: 퍼블리셔 양성과정</option>
									<option value="fifth">5강의실: 인공지능 개발자 양성과정</option>
									<option value="sixth">6강의실: 데이터 엔지니어 양성과정</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="btns">
					<button type="submit" class="btn btnConfirm">회원가입</button>
					<a href="javascript:history.back(-1)" class="btn btnCancel">취소</a>
				</div>
			</form>
		</div>
	</div>
</main>
<%@ include file="../include/footer.jsp"%>






