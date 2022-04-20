package com.tis.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tis.util.ScriptWriter;
import com.tis.model.MemberDto;
import com.tis.model.MemberService;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	@Autowired
	MemberDto logmemberDto;
	@Autowired
	MemberDto memberDto;
	@Autowired
	MemberService memberDao;
	/* manager page */
	@GetMapping("/ManageList.do")
	public String list(HttpServletRequest request, Model model) {
		String search_position = request.getParameter("search_position");
		String search_subject = request.getParameter("search_subject");
		String search_name = request.getParameter("search_name");
		List<MemberDto> memberList = memberDao.getAllMemberList(search_position, search_subject, search_name);

		for (MemberDto md : memberList) {
			md.setPosition(md.getCode().substring(0, 1));
			System.out.println(md.toString());
		}
		model.addAttribute("memberList", memberList);
//		model.addAttribute("page", page);
//		model.addAttribute("totalPage", 10);
		return "manager/List"; // jsp 페이지 설정
	}

	@GetMapping("/Create.do")
	public String join(HttpServletRequest request) {
		return "manager/create";
	}

	@PostMapping("/CreateProcess.do")
	public void joinProcess(MemberDto memberDto, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		memberDto.setTell(memberDto.getTellFirst() + "-" + memberDto.getTellMiddle() + "-" + memberDto.getTellLast());

		String position = memberDto.getPosition();
		MemberDto tempMemDto = null;
		String code = null;
		do {
			code = position + rand4num();
			tempMemDto = memberDao.getSelectOne(code);
//			if (tempMemDto != null)
//				System.out.println(code + "//" + tempMemDto.getCode());
		} while (tempMemDto != null);
		memberDto.setCode(code);
		int result = memberDao.insertMember(memberDto);
		if (result > 0) {
			ScriptWriter.alertAndNext(response, "등록되었습니다.", "../manager/ManageList.do");
		} else {
			ScriptWriter.alertAndBack(response, "시스템 오류입니다. 다시 시도해 주세요.");
		}
	}

	public String rand4num() {
		Random random = new Random();
		int createNum = 0;
		String ranNum = "";
		int letter = 4;
		String result = "";

		for (int i = 0; i < letter; i++) {
			createNum = random.nextInt(9); // 0부터 9까지 올 수 있는 1자리 난수 생성
			ranNum = Integer.toString(createNum); // 1자리 난수를 String으로 형변환
			result += ranNum; // 생성된 난수(문자열)을 원하는 수(letter)만큼 더하며 나열
		}

		return result;
	}

	@GetMapping("/Info.do")
	public String information(String code, Model model) {
		memberDto = memberDao.getSelectOne(code);

		String temp = memberDto.getCode();
		memberDto.setPosition(temp.substring(0, 1));
		String tell = memberDto.getTell();
		String[] tArr = tell.split("-");
		memberDto.setTellFirst(tArr[0]);
		memberDto.setTellMiddle(tArr[1]);
		memberDto.setTellLast(tArr[2]);

		model.addAttribute("memberDto", memberDto);
		return "manager/info";
	}

	@GetMapping("/InfoUpdate.do")
	public String update(String code, Model model) {
		memberDto = memberDao.getSelectOne(code);

		String temp = memberDto.getCode();
		memberDto.setPosition(temp.substring(0, 1));

		String tell = memberDto.getTell();
		String[] tArr = tell.split("-");
		memberDto.setTellFirst(tArr[0]);
		memberDto.setTellMiddle(tArr[1]);
		memberDto.setTellLast(tArr[2]);
		model.addAttribute("memberDto", memberDto);
		return "manager/infoUpdate";
	}

	@RequestMapping("/InfoUpdateProcess.do")
	public void updateProcess(MemberDto memberDto, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String code = request.getParameter("code");
		// 빈값 채우기
		memberDto.setTell(memberDto.getTellFirst() + "-" + memberDto.getTellMiddle() + "-" + memberDto.getTellLast());
		// 비밀번호 확인
		MemberDto tempMemDto = memberDao.getSelectOne(code);
		if (!memberDto.getPassword().equals(tempMemDto.getPassword())) {
			ScriptWriter.alertAndBack(response, "비밀번호가 틀립니다.");
			return;
		}

		int result = memberDao.updateMember(memberDto);
		if (result > 0) {
			ScriptWriter.alertAndNext(response, "회원정보가 수정되었습니다.", "../manager/ManageList.do");

		} else {
			ScriptWriter.alertAndBack(response, "시스템 오류 입니다. 잠시 후 다시 시도해주세요.");
		}
	}

	@RequestMapping("/DeleteProcess.do")
	public void deleteProcess(String code, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		ScriptWriter.confirm(response, "정말 삭제하시겠습니까?","../member/Info.do?code="+code);
		int result = memberDao.deleteMember(code);
		if (result > 0) {
			ScriptWriter.alertAndNext(response, "삭제되었습니다.", "../manager/ManageList.do");
		} else {
			ScriptWriter.alertAndBack(response, "시스템 오류입니다. 잠시 후 다시 시도해주세요.");
		}
	}

	@RequestMapping("/DeleteListProcess.do")
	public void deleteListProcess(Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String[] list = request.getParameterValues("selected");
		if (list == null) {
			ScriptWriter.alertAndBack(response, "삭제할 사람을 선택해주세요.");
			return;
		}
//		ScriptWriter.confirm(response, "정말 삭제하시겠습니까?", "../member/ManageList.do");
		int result = 0;
		for (String code : list) {
//			System.out.println(code);
			result += memberDao.deleteMember(code);
		}
		if (result > 0) {
			ScriptWriter.alertAndNext(response, "삭제되었습니다.", "../manager/ManageList.do");
		} else {
			ScriptWriter.alertAndBack(response, "시스템 오류입니다. 잠시 후 다시 시도해주세요.");
		}
	}
}
