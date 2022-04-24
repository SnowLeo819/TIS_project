const today = new Date(); // 오늘 날짜...  new Date() 생성자를 통해서만 객체를 생성할 수 있다.
// console.log(today);
const dayList = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
const dateUL = $(".calendar .dates ul");
let pickedNow = new Date(); // 클릭했을때 넘어갈 날짜...
let firstDay = new Date(today.getFullYear(), today.getMonth(), 1); // 현재 날짜의 월에서 1일을 기준으로 새로운 date 생성
const leapYear = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]; // 윤년
const nonLeapYear = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]; // 윤년아님
let selectYear;

const txtYear = $(".calendar .header .year");
const txtMonth = $(".calendar .header .month");

const calendar = $(".calendar");

let queryDate = "";

//const inputDate = $(".inputDate");

// prevMonth
$(".calendar .header .prev").on("click", () => {
  console.log("prevMonth");
  pickedNow = new Date(pickedNow.getFullYear(), pickedNow.getMonth() - 1, 1);
  makeCalendar(pickedNow.getFullYear(), pickedNow.getMonth());
});

// nextMonth
$(".calendar .header .next").on("click", () => {
  console.log("nextMonth");
  pickedNow = new Date(pickedNow.getFullYear(), pickedNow.getMonth() + 1, 1);
  makeCalendar(pickedNow.getFullYear(), pickedNow.getMonth());
});

makeCalendar(pickedNow.getFullYear(), pickedNow.getMonth());
//inputDate.value = `${today.getFullYear()} / ${addZero(today.getMonth() + 1)} / ${addZero(today.getDate())}`;

function makeCalendar(pYear, pMonth) {
  //윤년 공식 4로 떨어지면 윤년,100년 단위는 윤년 아님, 400으로 떨어지면 윤년
  let output = "";
  let count = 1;
  firstDay = new Date(pYear, pMonth, 1);
  txtYear.text(firstDay.getFullYear());
  txtMonth.text(addZero(firstDay.getMonth() + 1));
  if (firstDay.getFullYear() % 4 === 0) {
    if (firstDay.getFullYear() % 100 === 0) {
      selectYear = nonLeapYear;
    } else {
      selectYear = leapYear;
    }
  } else {
    selectYear = nonLeapYear;
  }
  if (firstDay.getFullYear() % 400 === 0) {
    selectYear = leapYear;
  }

  queryDate = firstDay.getFullYear() + "" + addZero(firstDay.getMonth() + 1) + "" + addZero(firstDay.getDate());
  $("#pickedDate").text(addZero(today.getDate()));
  $("#pickedDay").text(dayList[today.getDay()]);

  for (let i = 0; i < 42; i++) {
    if (i < firstDay.getDay()) {
      //비워두기
      output += `<li class="blank"><span></span></li>`;
      //continue;
    } else {
      if (today.getDate() === count && today.getFullYear() === firstDay.getFullYear() && today.getMonth() === firstDay.getMonth()) {
        output += `<li class="today dateBox" data-date="${count}" data-year="${firstDay.getFullYear()}" data-month="${firstDay.getMonth() + 1}">
                    <span>${count}</span>`;
      } else {
        output += `<li class="dateBox ${firstDay.getFullYear()}.${firstDay.getMonth() + 1}.${count}" data-date="${count}" data-year="${firstDay.getFullYear()}" data-month="${firstDay.getMonth() + 1}">
                    <div class="topBox">
                      <span>${count}</span>`;
      }

      let date = `${firstDay.getFullYear()}${addZero(firstDay.getMonth() + 1)}${addZero(count)}`;
      let dateList = [];
      console.log(date);

      // // // 해당일 출석여부를 가져오는 ajax  완성 못하면 삭제하기.//
      // $.ajax({
      //   url: "../attend/GetState.do",
      //   type: "GET",
      //   async: false, // 기존 비동기 방식 -> 동기방식으로 전환해줌!! 안하면 밀려서 오류남;;
      //   data: {
      //     date: date,
      //   },
      //   success: function (res) {
      //     console.log(res.state);
      //     if (res.length > 0) {
      //       output += `<span>${state}</span>
      //                 </div>`;
      //     }
      //   },
      // });

      output += `</div>`;

      // 해당일 강의일정 안내를 가져오는 ajax
      $.ajax({
        url: "../lecture/InnerView.do",
        type: "GET",
        async: false, // 기존 비동기 방식 -> 동기방식으로 전환해줌!! 안하면 밀려서 오류남;;
        data: {
          mass: "",
          date: date,
        },
        success: function (res) {
          dateList = res;
          // console.log("dateList=", dateList);
        },
      });
      // 일정이 있는경우 집어넣기..-------------------------------
      if (dateList != null && dateList.length > 0) {
        output += `<div class="txtBox"><ul class="txtList">`;
        dateList.forEach(function (item, idx) {
          output += `<li class="item"><p>${item.contents}</p></li>`;
        });
        output += `</ul></div>`;
      }
      output += `</li>`;
      count += 1;
    }
    if (count > selectYear[firstDay.getMonth()]) {
      break; // 반목문이 break를 만나면 종료
    }
  }
  dateUL.html(output);
  // gsap.from(".calendar .dates li", { scale: 0, ease: "power3", stagger: 0.02 });
}
//이벤트 위임....

function addZero(num) {
  if (num < 10) {
    return "0" + num;
  } else {
    return "" + num;
  }
}

// 달력 누르면 모달...
$(".calendar").on("click", ".dates ul .dateBox", function () {
  let date = addZero($(this).data("date"));
  let year = addZero($(this).data("year"));
  let month = addZero($(this).data("month"));
  // console.log("눌렀어 / ", year, month, date);

  let data = year + month + date;
  console.log("눌렀어 /", data);
  const dateBody = $("#detailBox .detail table tbody");
  $.ajax({
    url: "../lecture/InnerView.do",
    type: "POST",
    async: false,
    data: {
      mass: "",
      date: data,
    },
    success: function (res) {
      const list = res;
      dateBody.html("");
      output = "";
      console.log(list.length);
      if (list.length <= 0) {
        alert("강의정보가 없습니다!");
        return;
      }
      list.forEach(function (item, idx) {
        console.log("item==" + item);
        output += `
                  <tr class="item${idx}">
                    <td>${item.contents}</td>
                    <td>${item.subject}</td>
                    <td>${item.teacher}</td>
                  </tr>
                  `;
      });
      console.log(output);
      dateBody.html(output);

      //gsap
      $("body").addClass("overHidden");
      $("#detailBox").show();
      gsap.fromTo(
        "#detailBox .detail",
        { top: "-100%" },
        {
          top: "50%",
          ease: "ease",
          duration: 1,
        }
      );
    },
  });
});

// 버튼 누르면 모달 창 닫기 흠......
const dateBody = $("#detailBox .detail table tbody");

function detailClose() {
  gsap.to("#detailBox .detail", {
    top: "-100%",
    ease: "back.in",
    duration: 1,
    onComplete: function () {
      dateBody.html("");
      $("#detailBox").hide();
      $("body").removeClass("overHidden");
    },
  });
}

$("#detailBox .topClose").on("click", function () {
  detailClose();
});

$("#detailBox .close").on("click", function () {
  detailClose();
});
