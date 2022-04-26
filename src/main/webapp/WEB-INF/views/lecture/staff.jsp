<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../include/header.jsp"%>
<head>
  <script src="../js/calendar.js" defer></script>
</head>
<main>
  <div class="attend">
    <div id="top">
      <!-- prog_list -->
      <ul class="itemList">
        <li class="item" style="width: calc(33.3% - 4px);">
          <div class="title">
            <span>학생 출석률</span>
          </div>
          <div class="info">
            <span class="txt"><span class="point"> ${attendRate} </span>%</span>
          </div>
        </li>
        <li class="item" id="task" style="width: calc(33.3% - 4px);">
          <div class="title">
            <span>원내 공지</span>
          </div>
          <ul class="info">
          <li><span class="point"> - </span></li>
          </ul>
        </li>
        <li class="item" style="width: calc(33.3% - 4px);">
          <div class="title">
            <span>종강일</span>
          </div>
          <div class="info">
          	<c:if test="${Dday==0}">		          	
            	<span class="txt"><span class="point">D - Day</span></span>
           	</c:if>
          	<c:if test="${Dday!=0}">		          	
            	<span class="txt">종강까지 <span class="point">D - ${Dday}</span></span>
           	</c:if>
          </div>
        </li>
      </ul>
      <!-- prog_list end -->
    </div>
    <div id="calendar">
      <div class="title">
        <h2 class="subTitle">일정표</h2>
      </div>
      <!-- 달력 -->
      <div class="calendarBox">
        <div class="calendar">
          <div class="header">
            <button class="prev">
              <span class="material-icons">chevron_left</span>
            </button>
            <div class="monthBox">
              <span class="year">2021</span>.<span class="month">12</span>
            </div>
            <button class="next">
              <span class="material-icons">chevron_right</span>
            </button>
          </div>
          <!-- header -->
          <div class="days">
            <ul>
              <li class="sun"><span>SUN</span></li>
              <li><span>MON</span></li>
              <li><span>TUE</span></li>
              <li><span>WED</span></li>
              <li><span>THU</span></li>
              <li><span>FRI</span></li>
              <li class="sat"><span>SAT</span></li>
            </ul>
          </div>
          <!-- days -->
          <div class="dates">
            <ul>
              <!-- <li><span>01</span></li>
          <li><span>02</span></li>
          <li><span>03</span></li>
          <li><span>04</span></li> -->
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div id="detailBox">
    <button class="topClose">
      <span class="material-icons">close</span>
    </button>
    <div class="form detail dtList">
      <table>
        <colgroup>
          <col style="width: 35%" />
          <col style="width: 50%" />
          <col style="width: 15%" />
        </colgroup>
        <thead>
          <tr>
            <td>contents</td>
            <td>subject</td>
            <td>teacher</td>
          </tr>
        </thead>
        <tbody>
          <!-- <tr>
              <td>${lectureDto.contents }</td>
              <td>${lectureDto.subject }</td>
              <td>${lectureDto.teacher }</td>
            </tr> -->
        </tbody>
      </table>
      <div class="btns">
        <button class="btn btnConfirm toggle">추가</button>
        <button class="btn close btnCancel">닫기</button>
      </div>
    </div>
    <div class="form detail dtInput hidden">
      <table>
        <colgroup>
          <col style="width: 20%" />
          <col style="width: 80%" />
        </colgroup>
        <tbody>
          <%-- <tr>
            <th>제목</th>
            <td class="left">
              <input type="text" name="title" id="title" placeholder="제목을 입력하세요." />
            </td>
          </tr> --%>
          <tr>
            <th>과목</th>
            <td class="left">
              <select name="subject" id="subject">
                <option value="" ${subject eq "" or subject eq null? selected : ""}>전체</option>
                <option value="first" ${subject eq "first" ? selected : ""}>프론트엔드 개발자 양성과정</option>
                <option value="second" ${subject eq "second" ? selected : ""}>백엔드 개발자 양성과정</option>
                <option value="third" ${subject eq "third" ? selected : ""}>풀스택 개발자 양성과정</option>
                <option value="fourth" ${subject eq "fourth" ? selected : ""}>퍼블리셔 양성과정</option>
                <option value="fifth" ${subject eq "fifth" ? selected : ""}>인공지능 개발자 양성과정</option>
                <option value="sixth" ${subject eq "sixth" ? selected : ""}>데이터 엔지니어 양성과정</option>
              </select>
            </td>
          </tr>
          <tr>
            <th>내용</th>
            <td class="left">
              <textarea type="text" name="contents" id="contents" placeholder="세부내용을 입력하세요."></textarea>
            </td>
          </tr>
        </tbody>
      </table>
      <div class="btns">
        <button class="btn btnConfirm insert">저장</button>
        <button class="btn toggle btnCancel">취소</button>
        <button class="btn close btnCancel">닫기</button>
      </div>
    </div>
  </div>
</main>

<%@ include file="../include/footer.jsp"%>
