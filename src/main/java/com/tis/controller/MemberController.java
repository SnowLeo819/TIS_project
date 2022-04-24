package com.tis.controller;

import java.util.Date;
import java.util.Random;

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

import com.tis.model.MemberDto;
import com.tis.model.MemberService;
import com.tis.util.ScriptWriter;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	MemberDto logmemberDto;
	@Autowired
	MemberDto memberDto;
	@Autowired
	MemberService memberDao;

	// 로그인 페이지
	@GetMapping("/Login.do")
	public String login() {
		return "member/login";
	}

	// 로그인 진행(DB)
	@PostMapping("/LoginProcess.do")
	public void loginProcess(MemberDto memberDto, HttpServletResponse response, HttpSession session) throws Exception {

		logmemberDto = memberDao.isRegistered(memberDto);
		System.out.println(logmemberDto);
		if (logmemberDto == null){
			ScriptWriter.alertAndBack(response, "아이디와 비밀번호를 확인 해주세요!");
		} else {
			String temp = logmemberDto.getCode();
			logmemberDto.setPosition(temp.substring(0, 1));
			String position = logmemberDto.getPosition();

			//세션 유지시간 지정(단위:초)
			session.setMaxInactiveInterval(60*60*24);
			session.setAttribute("loggedMember", logmemberDto);
			session.setAttribute("loggedId", logmemberDto.getId());
			session.setAttribute("loggedName", logmemberDto.getName());
			session.setAttribute("loggedCode", logmemberDto.getCode());
			session.setAttribute("loggedPosition", position);
			if (position.equals("M")) {
				ScriptWriter.alertAndNext(response, logmemberDto.getName() + " 관리자님 환영합니다.",
						"../manager/ManageList.do");
			} else if (position.equals("T")) {
				ScriptWriter.alertAndNext(response, logmemberDto.getName() + "님 환영합니다.", "../attend/Attend.do");
			} else {
				ScriptWriter.alertAndNext(response, logmemberDto.getName() + "님 환영합니다.", "../lecture/Main.do");
			}
		}
	}

	@RequestMapping("/Logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "member/login";
	}

	// 회원가입 작성페이지
	@GetMapping("/Join.do")
	public String join() {
		return "member/join";
	}

	// id 중복체크
	@PostMapping("/idCheck.do")
	@ResponseBody
	public int idCheck(HttpServletRequest request) {
		String check = request.getParameter("user_id");
//		System.out.println("중복체크");
		int result = memberDao.idCheck(check);
		System.out.println(result);
		return result;
	}

	// 회원가입 등록(DB)
	   @PostMapping("/JoinProcess.do")
	   public void joinProcess(HttpServletRequest request, MemberDto memberDto, HttpServletResponse response,
	         HttpSession session) throws Exception {
	      //전화번호 설정
	      String first = request.getParameter("tellFirst");
	      String middle = request.getParameter("tellMiddle");
	      String last = request.getParameter("tellLast");
	      memberDto.setTell(first + '-' + middle + '-' + last);
	      //분류 설정(학생 회원가입은 S자동 설정
	      memberDto.setPosition("S");
	      //분류코드 랜덤 생성
	      MemberDto tempMemDto = null;
	      String code = null;
	      do {
	         code = "S" + rand4num();
	         tempMemDto = memberDao.getSelectOne(code);
//	         if (tempMemDto != null)
//	            System.out.println(code + "//" + tempMemDto.getCode());
	      } while (tempMemDto != null);
	      memberDto.setCode(code);
	      //가입날짜 입력(매니저 변경 가능)      
	      Date now = new Date();
	      memberDto.setRegDate(now);

	      
	      int result = memberDao.insertMember(memberDto);
	      if (result != 0) {
	         ScriptWriter.alertAndNext(response, "회원가입 완료", "../member/Login.do");
	      } else {
	         ScriptWriter.alertAndBack(response, "회원가입에 문제가 생겼습니다. 관리자에게 문의해주시기 바랍니다.");
	      }

	   }

	   public String rand4num() {
	      Random random = new Random();
	      int createNum = 0;
	      String ranNum = "";
	      int letter = 4; // 몇 개 생성할건지
	      String result = "";

	      for (int i = 0; i < letter; i++) {
	         createNum = random.nextInt(9);
	         ranNum = Integer.toString(createNum); // 형변환
	         result += ranNum;
	      }

	      return result;
	   }

	/* user page */
	// 개인정보(마이페이지)
	@GetMapping("/Mypage.do")
	public String mypage(HttpSession session, Model model) throws Exception {

		String loggedCode = (String) session.getAttribute("loggedCode");
		memberDto = memberDao.getSelectOne(loggedCode);
//		System.out.println(memberDto.toString());
		String temp = memberDto.getCode();
		memberDto.setPosition(temp.substring(0, 1));
		model.addAttribute("member", memberDto);
		return "member/mypage";
	}

	// 개인정보 수정 페이지
	@RequestMapping("/EditMypage.do")
	public String editmypage(HttpSession session, Model model) throws Exception {

		String loggedCode = (String) session.getAttribute("loggedCode");
		memberDto = memberDao.getSelectOne(loggedCode);

		String temp = memberDto.getCode();
		memberDto.setPosition(temp.substring(0, 1));

		String tell = memberDto.getTell();
		String[] tArr = tell.split("-");
		memberDto.setTellFirst(tArr[0]);
		memberDto.setTellMiddle(tArr[1]);
		memberDto.setTellLast(tArr[2]);
		System.out.println(memberDto.toString());
		model.addAttribute("member", memberDto);

		return "member/editMypage";
	}

	// 개인정보 수정(DB)
	@PostMapping("/EditProcess.do")
	public void editProcess(HttpServletRequest request, MemberDto memberDto, HttpServletResponse response,
			HttpSession session) throws Exception {
//		System.out.println(memberDto.toString() + "오류확인");
		String loggedCode = (String) session.getAttribute("loggedCode");
		MemberDto tempMemDto = memberDao.getSelectOne(loggedCode);
		if (!memberDto.getPassword().equals(tempMemDto.getPassword())) {
			ScriptWriter.alertAndBack(response, "비밀번호가 틀립니다.");
			return;
		}

		String first = request.getParameter("tellFirst");
		String middle = request.getParameter("tellMiddle");
		String last = request.getParameter("tellLast");
		memberDto.setTell(first + '-' + middle + '-' + last);

		memberDto.setCode(tempMemDto.getCode());
		memberDto.setRegDate(tempMemDto.getRegDate());
		memberDto.setNo(tempMemDto.getNo());
//		System.out.println(memberDto.toString() + "오류확인22");
		int result = memberDao.updateMember(memberDto);
		if (result != 0) {
			ScriptWriter.alertAndNext(response, "수정 완료", "../member/Mypage.do");
		} else {
			ScriptWriter.alertAndBack(response, "정보 수정에 문제가 생겼습니다. 관리자에게 문의해주시기 바랍니다.");
		}
	}

}