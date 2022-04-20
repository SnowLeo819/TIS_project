<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<main>
	<div class="inner">
      <div class="contents">
        <div class="title">
          <h1>제목 텍스트</h1>
          <div class="index">
            <a href=""><span>상위 인덱스</span></a>
            <!-- 상위 인덱스 링크 -->
            <p>></p>
            <a href=""><span>하위 인덱스</span></a>
            <!-- 하위 인덱스 링크 -->
          </div>
        </div>
        <!-- title end -->
        <div class="calendarBox">
          <div class="calendar">
            <div class="header">
              <button class="prev">
                <span class="material-icons">chevron_left</span>
              </button>
              <div class="monthBox"><span class="year">2021</span>.<span class="month">12</span></div>
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
        <!-- calendar end -->
      </div>
      <div class="sideBar">
        <ul class="list">
          <li class="mainItem">
            <a href="">
              <!-- 나중에 링크 추가 -->
              <p>사이드바 텍스트</p>
            </a>
          </li>
          <li class="subItem">
            <a href="">
              <!-- 나중에 링크 추가 -->
              <p>사이드바 텍스트</p>
            </a>
          </li>
          <li class="subItem">
            <a href="">
              <!-- 나중에 링크 추가 -->
              <p>사이드바 텍스트</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
</main>
<%@ include file="../include/footer.jsp"%>






