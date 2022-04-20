//관리자 리스트 체크박스 기능
const allCheckBox = $(".viewer table tbody tr td #selected");
$(".viewer table #allSelected").click((e) => {
  // console.log(e);
  if ($("#allSelected").is(":checked")) {
    allCheckBox.prop("checked", true);
  } else {
    allCheckBox.prop("checked", false);
  }
});
allCheckBox.click(function () {
  var total = allCheckBox.length;
  var checked = $(".viewer table tbody tr td #selected:checked").length;

  if (total != checked) $(".viewer table #allSelected").prop("checked", false);
  else $(".viewer table #allSelected").prop("checked", true);
});
//아이디 중복 확인
let idCheck = false;
const korean = /[ㄱ-ㅎㅏ-ㅣ가-힣]/g;
const email =
  /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/; //이메일 정규식

$("#btnIdCheck").on("click", function (e) {
  //e.preventDefault();
  const user_id = $("#user_id").val();
  if (user_id === "") {
    alert("아이디를 입력해 주세요.");
    return false;
  }

  $.ajax({
    url: "../member/idCheck.do",
    type: "POST",

    data: {
      user_id: user_id,
    },
    success: function (res) {
      console.log(res);
      if (res != 0) {
        alert("사용할 수 없는 아이디입니다.");
        $("#user_id").val("");
        $("#user_id").focus();
      } else {
        //alert("사용할 수 있는 아이디입니다.");
        const yes = confirm("사용가능한 아이디입니다. 사용하시겠어요?");
        if (yes) {
          $("#user_id").attr("readonly", true);
          $("#btnIdCheck").attr("disabled", true);
          $("#btnIdCheck").css("display", "none");
          $("#resetUser_id").attr("disabled", false);
          $("#resetUser_id").css("display", "inline-block");
          idCheck = true;
        } else {
          $("#user_id").val("");
        }
      }
    },
  });
  return false;
});

//멤버 생성 및 수정시 필수입력사항 알림
$("#info .btns .submit").on("click", function () {
  if ($("#name").val() === "") {
    alert("이름을 입력하세요.");
    $("#name").focus();
    return false;
  } else if ($("#position").val() === "") {
    alert("분류를 선택해주세요.");
    $("#position").focus();
    return false;
  } else if ($("#user_id").val() === "") {
    alert("아이디를 입력하세요.");
    $("#user_id").focus();
    return false;
  } else if ($("#user_pw").val() === "") {
    alert("비밀번호를 입력하세요.");
    $("#user_pw").focus();
    return false;
  } else if ($("#user_pw_confirm").val() === "") {
    alert("비밀번호 확인을 입력하세요.");
    $("#user_pw_confirm").focus();
    return false;
  } else if ($("#user_pw").val() !== $("#user_pw_confirm").val()) {
    alert("비밀번호가 맞지 않습니다.");
    $("#user_pw_confirm").focus();
    return false;
  } else if ($("#tellMiddle").val() === "") {
    alert("전화번호를 입력하세요.");
    $("#user_phone_middle").focus();
    return false;
  } else if ($("#tellLast").val() === "") {
    alert("전화번호를 입력하세요.");
    $("#user_phone_last").focus();
    return false;
  } else if ($("#regDate").val() === "") {
    alert("등록일을 선택하세요.");
    $("#regDate").focus();
    return false;
  }
});

$(".fileBox input[type='file']").on("change", function () {
  const fileName = $(this).val();
  console.log(fileName);
  $(this).parent().siblings(".fakeFile").val(fileName);
});

// 날짜List 부분
document.getElementById("now_date").valueAsDate = new Date();

// 해당날짜 리스트 불러오기
let now = $("#now_date");
let attendTable = $(".tableBox table tbody");
$("#now_date").on("change", function () {
  let selectDate = $("#now_date").val();
  console.log(selectDate);
  attendTable.html("");
  $.ajax({
    url: "../attend/SelectDate.do",
    type: "GET",
    data: { selectDate: selectDate },
    success: function (res) {
      output = "";
      const list = res;
      list.forEach(function (item, idx) {
        console.log("code==" + item.code);
        console.log("idx==" + idx);
        output += `<tr>
		 				<td>${item.no}</td>
									<td>${item.code}</td>
									<td><a href="../students/StudentsInfo.do?no=${item.no}">${item.name}</td>
									<td>${item.subject}</td>
									<td>${item.attendDate}</td>
									<td>${item.attendTime}</td>
									<td>${item.leaveTime}</td>
									<td>${item.state}</td>
									</tr>
									`;
      });
      console.log(output);
      attendTable.html(output);
    },
  });
});

function newFunction() {}

let test = confirm("??");
if (test == true) {
  location.href = "";
} else if (test == false) {
  histohistory.back();
}
