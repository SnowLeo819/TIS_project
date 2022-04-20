package com.tis.controller;

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

		if (logmemberDto != null) {
			String temp = logmemberDto.getCode();
			logmemberDto.setPosition(temp.substring(0, 1));
			String position = logmemberDto.getPosition();

			session.setAttribute("loggedMember", logmemberDto);
			session.setAttribute("loggedId", logmemberDto.getId());
			session.setAttribute("loggedName", logmemberDto.getName());
			session.setAttribute("loggedCode", logmemberDto.getCode());
			session.setAttribute("loggedPosition", position);
			if (position.equals("M")) {
				ScriptWriter.alertAndNext(response, logmemberDto.getName() + " 관리자님 환영합니다.",
						"../manager/ManageList.do");
			} else {
				ScriptWriter.alertAndNext(response, logmemberDto.getName() + "님 환영합니다.", "../lecture/Main.do");
			}
		} else {
			ScriptWriter.alertAndBack(response, "아이디와 비밀번호를 확인 해주세요!");
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

		String first = request.getParameter("phoneFirst");
		String middle = request.getParameter("phoneMiddle");
		String last = request.getParameter("phoneLast");

		memberDto.setTell(first + '-' + middle + '-' + last);

		int result = memberDao.insertMember(memberDto);

		if (result != 0) {
			ScriptWriter.alertAndNext(response, "회원가입 완료", "../member/Login.do");
		} else {
			ScriptWriter.alertAndBack(response, "회원가입에 문제가 생겼습니다. 관리자에게 문의해주시기 바랍니다.");
		}

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