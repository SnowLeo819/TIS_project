<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../include/header.jsp" %>
<main>
  <div class="contents">
    <div id="inner">
      <div class="title">
        <h2 class="subTitle">LOGIN</h2>
      </div>
      <form
        method="POST"
        action="../member/LoginProcess.do"
        id="join"
        class="form"
      >
        <div class="panel">
          <div class="panelInner">
            <div class="innerWrap">
              <input
                type="text"
                name="id"
                id="user_id"
                placeholder="아이디를 입력하세요."
                class="text"
              />
              <input
                type="password"
                name="password"
                id="user_pw"
                placeholder="비밀번호를 입력하세요."
                class="text"
              />
            </div>
            <div class="btns">
              <button type="submit" class="btn btnConfirm">로그인</button>
              <a href="../member/Join.do" class="btn btnCancel">회원가입</a>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</main>
<script>
  $(".btnConfirm").on("click", function () {
    if ($("#user_id").val() === "") {
      alert("아이디를 입력하세요.");
      $("#user_id").focus();
      return false;
    } else if ($("#user_pw").val() === "") {
      alert("비밀번호를 입력하세요.");
      $("#user_pw").focus();
      return false;
    }
  });
</script>
<%@ include file="../include/footer.jsp" %>
