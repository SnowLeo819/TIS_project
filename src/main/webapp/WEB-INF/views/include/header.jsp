<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>INCLUDE</title>
<link rel="stylesheet" href="../css/reset.css" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=PT+Serif:wght@400;700&family=Raleway:wght@100;200;300;400;500;600;700;800;900&family=Titillium+Web:wght@200;300;400;600;700;900&display=swap"
   rel="stylesheet" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
   rel="stylesheet" />
<link
   href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
   rel="stylesheet" />
<link href="../summernote/summernote-lite.min.css" rel="stylesheet" />
<link rel="stylesheet" href="../css/layout.css" />
<link rel="stylesheet" href="../css/board.css" />
<link rel="stylesheet" href="../css/form.css" />
<link rel="stylesheet" href="../css/calendar.css" />
<link rel="stylesheet" href="../css/main.css" />
<link rel="stylesheet" href="../css/member.css" />
<link rel="stylesheet" href="../css/manager.css" />
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/gsap/gsap.min.js"></script>
<script src="../summernote/summernote-lite.min.js "></script>
<script src="../js/main.js" defer></script>
</head>
<body>
   <header id="header">
      <div class="inner">
         <c:choose>
            <c:when test="${empty loggedId}">
               <h1>
                  <a href="../member/Login.do">출결관리시스템</a>
               </h1>
               <nav id="gnb">
                  <%-- <h2 class="hidden">global navigation bar</h2> --%>
                  <ul>
                     <li><a href="../member/Login.do">로그인</a></li>
                     <li><a href="../board/List.do">게시판</a></li>
                  </ul>
               </nav>
            </c:when>
            <c:otherwise>
               <c:choose>
                  <c:when test="${loggedPosition eq 'M'}">
                     <h1>
                        <a href="../manager/ManageList.do">출결관리시스템</a>
                     </h1>
                     <nav id="gnb">
                        <ul>
                           <li><a href="../attend/Attend.do">출결관리</a></li>
                           <li><a href="../board/List.do">게시판</a></li>
                           <li><a href="../lecture/Main.do">강의일정</a></li>
                           <li><a href="../manager/ManageList.do">원생관리</a></li>
                        </ul>
                     </nav>
                     <div class="topMenu">
                        <ul>
                           <li><a href="../member/Mypage.do">${loggedName} 관리자님</a></li>
                           <li><a href="../member/Logout.do">로그아웃</a></li>
                        </ul>
                     <div>
                  </c:when>
                  <c:when test="${loggedPosition eq 'T'}">
                     <h1>
                        <a href="../attend/Attend.do">출결관리시스템</a>
                     </h1>
                     <nav id="gnb">
                        <ul>
                           <li><a href="../attend/Attend.do">출결관리</a></li>
                           <li><a href="../board/List.do">게시판</a></li>
                           <li><a href="../lecture/Main.do">강의일정</a></li>
                        </ul>
                     </nav>
                     <div class="topMenu">
                        <ul>
                           <li><a href="../member/Mypage.do">${loggedName} 강사님</a></li>
                           <li><a href="../member/Logout.do">로그아웃</a></li>
                        </ul>
                     <div>
                  </c:when>
                  <c:otherwise>
                  <h1>
                        <a href="../lecture/Main.do">출결관리시스템</a>
                     </h1>
                     <nav id="gnb">
                        <ul>
                           <li><a href="../lecture/Main.do">나의 출결</a></li>
                           <li><a href="../board/List.do">게시판</a></li>
                        </ul>
                     </nav>
                     <div class="topMenu">
                        <ul>
                           <li><a href="../member/Mypage.do">${loggedName} 님</a></li>
                           <li><a href="../member/Logout.do">로그아웃</a></li>
                        </ul>
                     <div>
                  </c:otherwise>
               </c:choose>
            </c:otherwise>
         </c:choose>
      </div>
   </header>