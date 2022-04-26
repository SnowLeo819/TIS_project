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
            <span>출석률</span>
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
          	<c:if test="${Dday==0}">		          	
            	<span class="txt"><span class="point">D - Day</span></span>
           	</c:if>
          	<c:if test="${Dday!=0}">		          	
            	<span class="txt">종강까지 <span class="point">D - ${Dday}</span></span>
           	</c:if>
          </div>
        </li>
        <li class="item">
          <div class="title">
            <span>입실</span>
          </div>
          <div class="info">
            <span class="txt ${attNull?"hidden":""}"><span class="point"> ${isNull?"":attendTime} </span></span>
            <a class="btn btnConfirm ${attNull?"":"hidden"}" href="../attend/AttendCheckProcess.do">입실</a>
          </div>
        </li>
        <li class="item">
          <div class="title">
            <span>퇴실</span>
          </div>
          <div class="info">
						<c:if test="${attNull}">
              <span class="point">입실 전</span>
						</c:if>	
						<c:if test="${!attNull}">
              <span class="txt ${leaNull?"hidden":""}"><span class="point"> ${leaNull?"":leaveTime}</span></span>
              <a class="btn btnConfirm ${leaNull?"":"hidden"}" href="../attend/AttendOutProcess.do">퇴실</a>
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
          <col style="width: 150px" />
          <col style="width: 50px" />
          <col style="width: 50px" />
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
        <button class="btn close">닫기</button>
      </div>
    </div>
  </div>
</main>
<%@ include file="../include/footer.jsp"%>
