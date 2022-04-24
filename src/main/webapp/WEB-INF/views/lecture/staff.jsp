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
        <li class="item">
          <div class="title">
            <span>출석률(당일)</span>
          </div>
          <div class="info">
            <span class="txt"><span class="point"> ${attendRate} </span>%</span>
          </div>
        </li>
        <li class="item">
          <div class="title">
            <span>출석률(강의)</span>
          </div>
          <div class="info">
            <span class="txt"><span class="point"> ${attendRate} </span>%</span>
          </div>
        </li>
        <li class="item">
          <div class="title">
            <span>종강일</span>
          </div>
          <div class="info">
            <span class="txt"><span class="point">D - ${Dday==0?Day:Dday}</span></span>
          </div>
        </li>
        <li class="item">
          <div class="title">
            <span>오늘 일정</span>
          </div>
          <div class="info">
            <ul>
            <li><span class="txt"><span class="point">시험감독</span></span></li>
            </ul>
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
        <button class="btn close btnCancel">닫기</button>
        <button class="btn btnConfirm">추가</button>
      </div>
    </div>
    <div class="form detailInput">
      <table>
        <colgroup>
          <col style="width: 20%" />
          <col style="width: 80%" />
        </colgroup>
        <tbody>
          <tr>
            <th>제목</th>
            <td class="left">
              <input type="text" name="title" id="title" placeholder="제목을 입력하세요." />
            </td>
          </tr>
          <tr>
            <th>과목</th>
            <td class="left">
              <select name="subject" id="subject">
                <option value="" ${item.subject == "" ? selected : ""}>전체</option>
                <option value="first" ${item.subject == "first" ? selected : ""}>프론트엔드 개발자 양성과정</option>
                <option value="second" ${item.subject == "second" ? selected : ""}>2강의실: 백엔드 개발자 양성과정</option>
                <option value="third" ${item.subject == "third" ? selected : ""}>3강의실: 풀스택 개발자 양성과정</option>
                <option value="fourth" ${item.subject == "fourth" ? selected : ""}>4강의실: 퍼블리셔 양성과정</option>
                <option value="fifth" ${item.subject == "fifth" ? selected : ""}>5강의실: 인공지능 개발자 양성과정</option>
                <option value="sixth" ${item.subject == "sixth" ? selected : ""}>6강의실: 데이터 엔지니어 양성과정</option>
              </select>
            </td>
          </tr>
          <tr>
            <th>내용</th>
            <td class="left">
              <input type="text" name="contents" id="contents" placeholder="세부내용을 입력하세요." />
            </td>
          </tr>
        </tbody>
      </table>
      <div class="btns">
        <button class="btn btnConfirm">저장</button>
        <button class="btn close btnCancel">닫기</button>
      </div>
    </div>
  </div>
</main>

<%@ include file="../include/footer.jsp"%>