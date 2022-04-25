<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>

<main>
  <div class="contents">
    <div id="inner">
      <div class="title">
        <h2 class="subTitle">회원 정보 수정</h2>
      </div>
      <!-- 데이터 받아서 처리하기....forward방식으로 데이터 보여주기....  -->
      <form method="POST" action="../member/EditProcess.do" id="editmypage" class="form" enctype="multipart/form-data">
        <table class="left">
					<caption><span class="caution">※ 아이디, 비밀번호 변경은 삭제 후 재가입 해야합니다.</span></caption>
          <colgroup>
            <col style="width: 20%" />
            <col style="width: 80%" />
          </colgroup>
          <tbody>
            <tr>
              <th>아이디</th>
              <td><input type="text" name="id" id="user_id" value="${member.id}" readonly /></td>
            </tr>
            <tr>
              <th>이름</th>
              <td><input type="text" name="name" id="user_name" value="${member.name}" /></td>
            </tr>
            <tr>
              <th>이메일</th>
              <td><input type="text" name="email" id="user_email" value="${member.email}" /></td>
            </tr>
            <tr>
              <th>전화번호</th>
              <td>
                <select name="tellFirst" class="short">
                  <c:if test="${member.tellFirst eq '010' }">
                    <option value="010" selected>010</option>
                    <option value="011">011</option>
                    <option value="02">02</option>
                  </c:if>
                  <c:if test="${member.tellFirst eq '011' }">
                    <option value="010">010</option>
                    <option value="011" selected>011</option>
                    <option value="02">02</option>
                  </c:if>
                  <c:if test="${member.tellFirst eq '02' }">
                    <option value="010">010</option>
                    <option value="011">011</option>
                    <option value="02" selected>02</option>
                  </c:if>
                </select>
                <input type="text" name="tellMiddle" class="short" id="user_phone_middle" value="${member.tellMiddle}" />
                <input type="text" name="tellLast" class="short" id="user_phone_last" value="${member.tellLast}" />
              </td>
            </tr>
            <tr>
              <th>과목</th>
              <td>
                <select name="subject" id="search_subject">
                  <option value="null">전체</option>
                  <c:if test="${member.subject eq 'first' }">
                    <option value="first" selected>1강의실: 프론트엔드 개발자 양성과정</option>
                    <option value="second">2강의실: 백엔드 개발자 양성과정</option>
                    <option value="third">3강의실: 풀스택 개발자 양성과정</option>
                    <option value="fourth">4강의실: 퍼블리셔 양성과정</option>
                    <option value="fifth">5강의실: 인공지능 개발자 양성과정</option>
                    <option value="sixth">6강의실: 데이터 엔지니어 양성과정</option>
                  </c:if>
                  <c:if test="${member.subject eq 'second' }">
                    <option value="first">1강의실: 프론트엔드 개발자 양성과정</option>
                    <option value="second" selected>2강의실: 백엔드 개발자 양성과정</option>
                    <option value="third">3강의실: 풀스택 개발자 양성과정</option>
                    <option value="fourth">4강의실: 퍼블리셔 양성과정</option>
                    <option value="fifth">5강의실: 인공지능 개발자 양성과정</option>
                    <option value="sixth">6강의실: 데이터 엔지니어 양성과정</option>
                  </c:if>
                  <c:if test="${member.subject eq 'third' }">
                    <option value="first">1강의실: 프론트엔드 개발자 양성과정</option>
                    <option value="second">2강의실: 백엔드 개발자 양성과정</option>
                    <option value="third" selected>3강의실: 풀스택 개발자 양성과정</option>
                    <option value="fourth">4강의실: 퍼블리셔 양성과정</option>
                    <option value="fifth">5강의실: 인공지능 개발자 양성과정</option>
                    <option value="sixth">6강의실: 데이터 엔지니어 양성과정</option>
                  </c:if>
                  <c:if test="${member.subject eq 'fourth' }">
                    <option value="first">1강의실: 프론트엔드 개발자 양성과정</option>
                    <option value="second">2강의실: 백엔드 개발자 양성과정</option>
                    <option value="third">3강의실: 풀스택 개발자 양성과정</option>
                    <option value="fourth" selected>4강의실: 퍼블리셔 양성과정</option>
                    <option value="fifth">5강의실: 인공지능 개발자 양성과정</option>
                    <option value="sixth">6강의실: 데이터 엔지니어 양성과정</option>
                  </c:if>
                  <c:if test="${member.subject eq 'fifth' }">
                    <option value="first">1강의실: 프론트엔드 개발자 양성과정</option>
                    <option value="second">2강의실: 백엔드 개발자 양성과정</option>
                    <option value="third">3강의실: 풀스택 개발자 양성과정</option>
                    <option value="fourth">4강의실: 퍼블리셔 양성과정</option>
                    <option value="fifth" selected>5강의실: 인공지능 개발자 양성과정</option>
                    <option value="sixth">6강의실: 데이터 엔지니어 양성과정</option>
                  </c:if>
                  <c:if test="${member.subject eq 'sixth' }">
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
              <th>비밀번호 확인</th>
              <td><input type="password" name="password" id="user_pw" /></td>
            </tr>
          </tbody>
        </table>
        <div class="btns">
          <button type="submit" class="btn btnConfirm">수정하기</button>
          <a href="../member/Mypage.do" class="btn btnCancel">취소</a>
        </div>
      </form>
    </div>
  </div>
</main>

<%@ include file="../include/footer.jsp"%>






