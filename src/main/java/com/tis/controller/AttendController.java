package com.tis.controller;

import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tis.model.AttendDto;
import com.tis.model.AttendService;
import com.tis.model.MemberDto;
import com.tis.util.ScriptWriter;

@Controller
@RequestMapping("/attend")
public class AttendController {
	
	@Autowired
	AttendService attendDao;
	
	@Autowired	
	AttendDto attendDto;
	
	//출석페이지
	@RequestMapping("/Check.do")
	public String check() {
		return "attend/check";	
	}
	
	//출석
	@RequestMapping("/AttendCheckProcess.do")
	public void checkIn(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		System.out.println("출석임");
		int result = 0; 
		
		MemberDto logged = (MemberDto)session.getAttribute("loggedMember");
		String position = (String)session.getAttribute("loggedPosition");
		attendDto.setCode(logged.getCode());
		attendDto.setName(logged.getName());
		attendDto.setSubject(logged.getSubject());

	    SimpleDateFormat dateFormat = new SimpleDateFormat("hh:mm:ss");
		Date inTime = dateFormat.parse("09:00:00"); // 출결 기준시간(고정)
		
		LocalTime now = LocalTime.now();  // 현재시간 가져오기
		LocalTime setInTime = LocalTime.ofInstant(inTime.toInstant(), ZoneId.systemDefault()); // 기준시간의 형태변환
		
		System.out.println("set기준시간=="+setInTime);
		System.out.println("now지금시간=="+now);
		
		// setEarlyTime(06시) compareTo setInTime(09시) = -1  settime 이 비교 기준시간보다 빠르면 -1, 늦으면 1
		// now(19시) compareTo setInTime(09시) = 1
		
		int judge = now.compareTo(setInTime); // 시간비교.. 빠르면 -1 늦으면 1
		
		if(judge <=0) {
			System.out.println("정시 출결");
			attendDto.setState("출석");
		} else {
			System.out.println("지각");
			attendDto.setState("지각");
		}	
		
		result = attendDao.AttendCheck(attendDto);
		if(result > 0) {
			ScriptWriter.alertAndNext(response, "정상출석", "../lecture/Main.do");
		} else {
			ScriptWriter.alertAndBack(response, "다시시도 ㄱㄱ..");
		}
	}
	
	//퇴실
	   @RequestMapping("/AttendOutProcess.do")
	   public void checkOut(HttpSession session, HttpServletResponse response) throws Exception{
	      int result = 0;
	      SimpleDateFormat dateFormat = new SimpleDateFormat("hh:mm:ss");
	      Date outTime = dateFormat.parse("18:00:00"); // 퇴실 기준시간(고정 - 퇴실때 써)
	      MemberDto loggedMember = (MemberDto)session.getAttribute("loggedMember");
	      String position = (String)session.getAttribute("loggedPosition");
	      
	      attendDto.setCode(loggedMember.getCode());
	      
	      int judge = attendDao.AttendState(attendDto);
	      
	      if(judge >= 1) attendDto.setState("출석");
	      result = attendDao.AttendOut(attendDto);
	      if(result > 0) {
	    	 ScriptWriter.alertAndNext(response, "정상퇴실", "../lecture/Main.do");
	      } else {
	         ScriptWriter.alertAndBack(response, "다시시도 ㄱㄱ..");
	      }
	   }
		
	 //과목출석리스트
	   @RequestMapping("/Attend.do")
	   public String attend(HttpServletRequest request, Model model,HttpSession session) {
	      List<AttendDto> attendList = new ArrayList<>();
	      
	      MemberDto loggedMember = (MemberDto)session.getAttribute("loggedMember");
	      String subject = loggedMember.getSubject();
	      attendList = attendDao.getAllAttend(subject); //Dao 에서 준 데이터 박스
	      
	      model.addAttribute("attendList", attendList);// 보여주는 페이지에 줄 내용 박스
	      
	      return "attend/list";  // 보여줄 JSP 주소
	   }
	
	//개인정보
		@GetMapping("/AttendInfo.do")
		public String info(Integer no,Model model,HttpSession session) {
		attendDto = attendDao.AttendOneSelect(no);
		model.addAttribute("attendDto",attendDto);
		
		return "attend/info";
		}	
		
	//수정페이지
	   	@GetMapping("/AttendUpdate.do")
		public String update(HttpServletRequest request, Model model) {
		int no = Integer.parseInt(request.getParameter("no"));
		attendDto = attendDao.AttendOneSelect(no);
		model.addAttribute("attendDto",attendDto);
		return "attend/update";
		}	
	   	
		//정보수정
		@PostMapping("/AttendUpdateProcess.do")
		public void updateProcess(AttendDto attendDto,HttpServletResponse response,HttpServletRequest request, HttpSession session) throws Exception {
		int result = attendDao.AttendUpdate(attendDto);
		if(result>0) {
			ScriptWriter.alertAndNext(response, "수정완료", "../attend/Attend.do");
		}else {
			ScriptWriter.alertAndBack(response, "수정실패");
			}
		}	
	    
		//해당날짜 리스트
		@GetMapping("/SelectDate.do")
		@ResponseBody
		public List<AttendDto> list(HttpServletRequest request) {
			String selectDate = request.getParameter("selectDate");
			//System.out.println("selectDate="+selectDate); 		
			List<AttendDto> attendDateList = attendDao.getDateList(selectDate);
			//System.out.println("con="+attendDateList); 		
			return attendDateList;	    
		}
	
//		//해당날짜 리스트
//		@GetMapping("/GetState.do")
//		@ResponseBody
//		public String getState(HttpServletRequest request, HttpSession session) {
//			String date = request.getParameter("date");		
//			String code = (String)session.getAttribute("loggedCode");
//			
////			System.out.println("date="+date);
////			System.out.println("code="+code);
//			attendDto.setCode(code);
//			attendDto.setAttendDate(date);
//			
//			attendDto = attendDao.getState(attendDto);	
//			String state = attendDto.getState();
//			System.out.println("state="+state);
//			
//			return state;	    
//		}
}
