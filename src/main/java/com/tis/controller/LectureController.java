package com.tis.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tis.model.AttendDao;
import com.tis.model.AttendDto;
import com.tis.model.LectureDto;
import com.tis.model.LectureService;
import com.tis.model.MemberDto;
import com.tis.model.MemberService;

@Controller
@RequestMapping("/lecture")
public class LectureController {
	
	@Autowired
	LectureService lectureDao;
	
	@Autowired
	LectureDto lectureDto;

	@Autowired
	AttendDto attendDto;
	
	@Autowired
	AttendDao attendDao;
	
	@Autowired
	MemberService memberDao;
	
	
	@GetMapping("List.do")
	public String list() {

		return "lecture/list";
	}
	// 출결일수 구하기
	@GetMapping("Main.do")
	public String main(HttpSession session, Model model) throws ParseException {
		String loggedCode = (String)session.getAttribute("loggedCode");
		MemberDto member = (MemberDto)session.getAttribute("loggedMember");
		String subject = member.getSubject();
		
		String startDay = "20220401";	
		String endDay = "20220426";
		int setDate = lectureDao.getDay(startDay,endDay);
		int Dday = lectureDao.getDDay(endDay);
		
		double attenCount = attendDao.getAllAttendCount(loggedCode); // 출결일수
		double attendRate = attenCount/setDate*100;
		double roundRate = Math.round(attendRate*10)/10.0;
//		System.out.println("출석일수="+attenCount); 
//		System.out.println("출석률="+attendRate);
//		System.out.println("출석률="+Math.round(attendRate*10)/10.0);

		
//	    SimpleDateFormat dateFormat = new SimpleDateFormat("hh:mm:ss");
		String attendTime = "00:00:00";
		String leaveTime = "00:00:00";
		
		attendDto = attendDao.getTodayAttend(loggedCode);
		boolean attNull = true;
		boolean leaNull = true;
		if(attendDto != null) {
			if(attendDto.getAttendTime() != null) {
				attNull = false;
				attendTime = attendDto.getAttendTime().toString().split(" ")[1].replace(".0","");;
			}		
			if(attendDto.getLeaveTime() != null) {
				leaNull = false;
				attendTime = attendDto.getAttendTime().toString().split(" ")[1].replace(".0","");;
				leaveTime = attendDto.getLeaveTime().toString().split(" ")[1].replace(".0","");
			}
		}
//		System.out.println(attendTime);
//		System.out.println(leaveTime);
		
		model.addAttribute("attNull", attNull);
		model.addAttribute("leaNull", leaNull);
		model.addAttribute("attendTime", attendTime);
		model.addAttribute("leaveTime", leaveTime);
		model.addAttribute("attendRate", roundRate);
		model.addAttribute("Dday", Dday);
		model.addAttribute("subject", subject);
		
		String position = (String)session.getAttribute("loggedPosition");
		if(position.equals("S")) {
			return "lecture/student";	
		} else {
			return "lecture/staff";	
		}
	}
	
	// ajax 받음
	// ( 오브젝트 넘길때는... 필수..  @ResponseBody )
	@RequestMapping("/InnerView.do")
	@ResponseBody
	public List<LectureDto> innerView(HttpServletRequest request, HttpSession session) {
		List<LectureDto> lectureList = new ArrayList<>();
		
		String mass = request.getParameter("mass");
		String date = request.getParameter("date");
//		System.out.println("가져온 date== "+date);
//		System.out.println("가져온 mass== "+mass);
		
		String loggedCode = (String)session.getAttribute("loggedCode");
		MemberDto memberDto = memberDao.getSelectOne(loggedCode);
//		System.out.println("dto test="+memberDto);
		
		lectureDto.setSubject(memberDto.getSubject());
		lectureDto.setSelectDate(date);		
		
//		System.out.println("lectureDto== "+lectureDto);
		
		// mass 데이터 없으면 subject, selectDate 모두 검색.
		// mass = all 이면 subject 만 검색
		if(mass.equals("all")) {
			lectureList = lectureDao.getAllLecture(lectureDto);
		} else {
			lectureList= lectureDao.getDateLecture(lectureDto);
		}
		
//		System.out.println("가져온 date== "+date);
//		System.out.println("가져온 mass== "+mass);
//		System.out.println("가져온 list== "+lectureList);
				
		return lectureList;
	}
}
