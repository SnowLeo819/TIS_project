<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../include/header.jsp"%>
<main>
  <div class="contents">
    <div id="inner">
      <div class="title">
        <h2 class="subTitle">WRITE</h2>
      </div>
      <!-- 데이터 받아서 처리하기....forward방식으로 데이터 보여주기....  -->
      <form
        method="POST"
        action="WriteProcess.do"
        id="write"
        class="form"
        enctype="multipart/form-data"
      >
        <table class="left">
          <colgroup>
            <col style="width: 20%" />
            <col style="width: 80%" />
          </colgroup>
          <tbody>
            <tr>
              <th>글머리</th>
              <td>
                <select name="category">
                  <c:if test="${ loggedPosition != 'S'}">
                    <option value="notice">공지사항</option>
                  </c:if>
                  <option value="question">질의문답</option>
                  <option value="etc">기타문의</option>
                </select>
              </td>
            </tr>
            <tr>
              <th>제목<span class="required">*</span></th>
              <td>
                <input
                  type="text"
                  name="title"
                  id="title"
                  placeholder="제목을 입력하세요."
                />
              </td>
            </tr>
            <tr>
              <th>아이디<span class="required">*</span></th>
              <td>
                <input
                  type="text"
                  name="id"
                  id="id"
                  value="${memberDto.id}"
                  readonly
                  class="readonly"
                />
              </td>
            </tr>
            <tr>
              <th>내용<span class="required">*</span></th>
              <td class="left">
                <textarea
                  id="summernote"
                  placeholder="내용을 입력하세요."
                  name="contents"
                ></textarea>
              </td>
            </tr>
          </tbody>
        </table>
        <input type="hidden" name="code" id="code" value="${memberDto.code}" />
        <div class="btns">
          <button type="submit" class="btn btnConfirm submit">저장</button>
          <button
            type="reset"
            class="btn btnCancel"
            onclick="window.history.back()"
          >
            취소
          </button>
        </div>
      </form>
    </div>
    <div class="sideBar">
      <ul class="list">
        <li
          class="mainItem ${param.cate_select==''?'on':param.cate_select==null?'on':''}"
        >
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
<script>

  $(".btnConfirm").on("click",function(){
  	if($("#title").val()=="") {
  		alert("제목을 입력해 주세요");
  		$("#user_subject").focus();
  		return false;
  	}
  	}
  });


  //summernote 적용
  $("#summernote").summernote({
  	height : 300
  });
  /*
  //queryString  ===>       view.do?img=aaa&text=bbb   (get)
  // form 태그를 이용하는 방법   <form method="GET 또는 POST" action="넘길 페이지"></form>
  // FormData
  function uploadImage(file,editor) {
  	const sendData = new FormData();
  	sendData.append("summerNoteImage",file);  //uploadFile   <input type="file" name="uploadFile">
  	$.ajax({
  		url:"SummerNoteFileUpload.do",
  		type:"POST",
  		data:sendData,
  		contentType:false, // 기본값은 application/x-www-form-urlencode임 false로 해야지만 multipart/form-data로 날아간다.
  		processData:false, // QueryString형태로 전달되는걸 막음... default는 true
  		dataType:"json",
  		success:function(res) {
  			console.log(res);
  			$(editor).summernote("editor.insertImage",res.url);
  		},
  		error:function(){
  			alert("파일 업로드 실패");
  		}
  	})
  } */
</script>
<%@ include file="../include/footer.jsp"%>
