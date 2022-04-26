package com.tis.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tis.model.BoardDto;
import com.tis.model.BoardService;
import com.tis.model.MemberDto;
import com.tis.model.MemberService;
import com.tis.model.ReplyDto;
import com.tis.model.ReplyService;
import com.tis.util.PageWriter;
import com.tis.util.ScriptWriter;

@Controller
@RequestMapping("/board")  //now
public class BoardController {
	@Autowired
	MemberService memberDao;
	
	@Autowired
	BoardService boardDao;
	
	@Autowired
	BoardDto boardDto;
	
	@Autowired
	ReplyDto replyDto;
	
	@Autowired
	ReplyService replyDao;
		
	@GetMapping("/List.do")
	public String list(HttpServletRequest request, Model model) {
		// 데이터 받기
		String tempClickPage = request.getParameter("clickPage");
		String search_select = request.getParameter("search_select");
		String search_word = request.getParameter("search_word");
		String cate_select = request.getParameter("cate_select");
		
		// url 설정
		String queryStr = request.getQueryString();
		String reqURL = "../board/List.do";
			
		// 쿼리스트링 있으면 url 수정
		if(queryStr!=null) {
			reqURL = "../board/List.do?" + queryStr;	
		}
		
		// 기존 clickPage 삭제해주기 ( 중복 방지 )
		//../board/List.do?clickPage=2?clickPage=3
		if(reqURL.contains("&click")||reqURL.contains("?click")) {
			String tempUrl = reqURL.split("click")[0];
			
			// String 의 0번 텍스트부터 길이 -1 의 데이터까지 (맨뒤텍스트 삭제)
			reqURL = tempUrl.substring(0, tempUrl.length()-1); 
		}			
		
		// 페이지 번호 지정 없으면 1번 페이지로 ( 있으면 그대로 )
		if (tempClickPage == null) tempClickPage = "1";
		int clickPage = Integer.parseInt(tempClickPage);
		
		// pagination 만들기
		// 글전체 갯수
		int listTotal = boardDao.getTotal(search_select, search_word, cate_select);
		int listPerPage = 3; // 한 페이지에 출력 할 글 수
		int pageBlock = 3;   // 아래쪽 page number 칸 갯수 
		int start = (clickPage - 1) * listPerPage + 1;
		int end = start + listPerPage - 1;
		String page = PageWriter.pageWrite(listTotal, listPerPage, pageBlock, clickPage, reqURL);
		
		List<BoardDto> boardList = boardDao.getCateBoard(start, end, search_select, search_word, cate_select);
		
		//데이터 보내기
		model.addAttribute("boardList", boardList);
		model.addAttribute("page", page);
		model.addAttribute("totalPage", listTotal);
		model.addAttribute("listPerPage", listPerPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("clickPage", clickPage);
		
		// 페이지 리턴
		return "board/list";
	}

	@GetMapping("/Write.do")
	public String write(HttpSession session, Model model) {
		String loggedCode = (String)session.getAttribute("loggedCode");
		
		MemberDto memberDto = memberDao.getSelectOne(loggedCode);
		
		model.addAttribute("memberDto",memberDto);
		
		return "board/write";
	}
	
	@RequestMapping("/WriteProcess.do")
	public void writeProcess(BoardDto boardDto, HttpServletResponse response)  throws Exception {
		// 입력
		int result = boardDao.insertBoard(boardDto);
		
		// 결과 & 페이지 연결
		if(result > 0) {
			ScriptWriter.alertAndNext(response, "저장되었습니다.", "../board/List.do");
		} else {
			ScriptWriter.alertAndBack(response, "시스템 오류입니다. 잠시 후 다시 시도해 주세요");
		}
	}

	// 일반 게시판 사용할 뷰
	@GetMapping("/View.do")
	public String view(HttpServletRequest request, Model model) {
		int no = Integer.parseInt(request.getParameter("no"));
		int num = Integer.parseInt(request.getParameter("num"));
		String search_select = request.getParameter("search_select");
		String search_word = request.getParameter("search_word");
		String cate_select = request.getParameter("cate_select");
		
		// 조회수 +1
		boardDao.updateHit(no);
		
		// 게시글 정보 가져오기
		boardDto = boardDao.getSelectOne(no);
		
		// 댓글리스트 가져오기
		List<ReplyDto> replyList = replyDao.getReplyList(no);
		System.out.println(replyList.size());
		boolean isNull = true;
		if(replyList.size()>=0) isNull = false;
		
		// 앞뒤글 정보 가져오기
		int prevNum = num - 1;
		int nextNum = num + 1;
		BoardDto prevBoard = boardDao.getTarget(prevNum, search_select, search_word, cate_select);
		BoardDto nextBoard = boardDao.getTarget(nextNum, search_select, search_word, cate_select);
		
		// 정보 담기
		model.addAttribute("boardDto",boardDto);
		model.addAttribute("prevBoard",prevBoard);
		model.addAttribute("nextBoard",nextBoard);
		model.addAttribute("search_select",search_select);
		model.addAttribute("search_word",search_word);
		model.addAttribute("cate_select",cate_select);
		model.addAttribute("replyList",replyList);
		model.addAttribute("isNull",isNull);
		
		// 페이지 연결
		return "board/view"; 
	}
	
	@GetMapping("/Update.do")
	public void update(HttpServletRequest request, Model model, HttpServletResponse response, HttpSession session) throws Exception{
		// 게시글 정보 가져오기
		int no = Integer.parseInt(request.getParameter("no"));
		boardDto = boardDao.getSelectOne(no);
		String dtoCode = boardDto.getCode();
		String loggedCode = (String)session.getAttribute("loggedCode");
		System.out.println(loggedCode.trim().equals(dtoCode.trim()));
		
		if(loggedCode.trim().equals(dtoCode.trim())) {
			ScriptWriter.goNext(response, "../board/GoUpdate.do?no="+no);
		} else {
			System.out.println("다른사람이야");
			ScriptWriter.alertAndBack(response, "작성자 본인만 수정 가능 합니다.");
		}
	}
	
	@GetMapping("/GoUpdate.do")
	public String goUpdate(HttpServletRequest request, Model model) {
			// 게시글 정보 가져오기
			int no = Integer.parseInt(request.getParameter("no"));
			boardDto = boardDao.getSelectOne(no);
		
			// 정보 담기
			model.addAttribute("boardDto",boardDto);
			
			// 페이지 연결
			return "board/update";
	}
	
	
	@RequestMapping("/UpdateProcess.do")
	public void UpdateProcess(BoardDto boardDto, HttpServletResponse response)  throws Exception {
		// 입력 (Dto 정보는 보내기 전에 정리해서 보내주기..)
		int result = boardDao.updateBoard(boardDto);
		
		// 결과 & 페이지 연결
		if(result > 0) {
			ScriptWriter.alertAndNext(response, "수정되었습니다.", "../board/List.do");
		} else {
			ScriptWriter.alertAndBack(response, "시스템 오류입니다. 잠시 후 다시 시도해 주세요.");
		}
	}
	
	@GetMapping("/Delete.do")
	public void delete(HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model) throws Exception {
		
		// 게시글 정보 가져오기
		int no = Integer.parseInt(request.getParameter("no"));
		boardDto = boardDao.getSelectOne(no);
		String dtoCode = boardDto.getCode();
		String loggedCode = (String)session.getAttribute("loggedCode");
		
		System.out.println("no="+no);
		
		if(loggedCode.trim().equals(dtoCode.trim())) {
			ScriptWriter.confirm(response, "정말로 삭제합니까?", "../board/DeleteProcess.do?no="+no);
		} else {
			System.out.println("다른사람이야");
			ScriptWriter.alertAndBack(response, "작성자 본인만 삭제 가능 합니다.");
		}
	}

	@RequestMapping("/DeleteProcess.do")
	public void deleteProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int result = 0;			
		System.out.println("no="+request.getParameter("no"));
		
		int no = Integer.parseInt(request.getParameter("no"));
		result = boardDao.deleteBoard(no);
		
		if (result > 0) {
			ScriptWriter.alertAndNext(response, "삭제 완료", "../board/List.do");
		} else {
			ScriptWriter.alertAndBack(response, "시스템 오류입니다. 잠시 후 다시 시도해 주세요");
		}
	}
	
	@RequestMapping("/DeleteReply.do")
	@ResponseBody
	public Map<String, Object> deleteReply(int no, Integer boardID, HttpSession session){
		Map<String, Object> turnData = new HashMap<>();
		int result= 0;

		String code = (String)session.getAttribute("loggedCode");
		replyDto.setNo(no);
		replyDto.setCode(code);

		result = replyDao.deleteReply(replyDto);
		List<ReplyDto> replyList = replyDao.getReplyList(boardID);
				
		turnData.put("result", result);
		turnData.put("replyList", replyList);
		
		return turnData;
	}
	
	@RequestMapping("/InsertReply.do")
	@ResponseBody
	public Map<String, Object> insertReply(String txt, Integer boardID, HttpSession session){
		Map<String, Object> turnData = new HashMap<>();
		int result= 0;
		
		String code = (String)session.getAttribute("loggedCode");
		String name = (String)session.getAttribute("loggedName");
		
		replyDto.setName(name);
		replyDto.setCode(code);
		replyDto.setTxt(txt);
		replyDto.setBoardId(boardID);

		result = replyDao.insertReply(replyDto);
		List<ReplyDto> replyList = replyDao.getReplyList(boardID);
				
		turnData.put("result", result);
		turnData.put("replyList", replyList);
		
		return turnData;
	}
	
	
	@RequestMapping("/UpdateReply.do")
	   @ResponseBody
	   public Map<String, Object> updateReply(int no, String txt, Integer boardID, HttpSession session) {
	      Map<String, Object> turnData = new HashMap<>();
	      int result = 0;

	      String code = (String) session.getAttribute("loggedCode");
	      replyDto.setTxt(txt);
	      replyDto.setNo(no);
	      replyDto.setBoardId(boardID);

	      result = replyDao.updateReply(replyDto);
	      List<ReplyDto> replyList = replyDao.getReplyList(boardID);

	      turnData.put("result", result);
	      turnData.put("replyList", replyList);

	      return turnData;
	   }

	
	
}