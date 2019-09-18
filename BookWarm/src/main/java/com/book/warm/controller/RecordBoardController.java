package com.book.warm.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.book.warm.page.CommunityCommentPageDTO;
import com.book.warm.page.Criteria;
import com.book.warm.page.PageDTO;
import com.book.warm.service.RecordService;
import com.book.warm.service.StatisticsFunctionService;
import com.book.warm.vo.BookVO;
import com.book.warm.vo.CommunityBoardCommentVO;
import com.book.warm.vo.LogingBoardVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class RecordBoardController {
	
	@Inject
	RecordService recordService;

	@Inject
	StatisticsFunctionService statisticsFunctionService;

	@RequestMapping(value = "/record", method = RequestMethod.GET)
	// add task - get book command(need total page)
	public String boardLog(Model model, @Param("bookVO") BookVO bookVO, Criteria criteria, HttpServletRequest req,HttpSession session)
			throws Exception {
		log.info("===== record() =====");
		String user_id=(String)session.getAttribute("user_id");
		log.info(user_id);
		bookVO = recordService.getBook(bookVO.getIsbn());// get isbn and set all bookVO attr
		List<LogingBoardVO> logingList = recordService.getList(criteria, bookVO,user_id);
		model.addAttribute("loginglist", logingList);
		model.addAttribute("pageMaker", new PageDTO(criteria, 123)); // inject totalPageNum

		int readPageNum = statisticsFunctionService.logingPage(logingList, bookVO); //
		int logingCount = recordService.getCount(bookVO,user_id); 
		int bookTotalPage = bookVO.getBook_tot_page(); /* tmp value, please modify this code */
		double reading = ((double) readPageNum / (double) bookTotalPage) * 100; // 
		model.addAttribute("startPage", statisticsFunctionService.firstPage(logingList));
		model.addAttribute("endPage", statisticsFunctionService.endPage(logingList));
		model.addAttribute("readPageNum", readPageNum);
		model.addAttribute("reading", reading);
		model.addAttribute("recordNum", logingCount);
		model.addAttribute("bookVO", bookVO);
		model.addAttribute("modalOpen", req.getParameter("modalOpen"));
		return "/record";
	}

	@PostMapping(value = "/recordwrite", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> recordWrite(HttpSession session, @RequestBody LogingBoardVO logingBoardVO) {
		log.info("========== recordWrite ==========");
		String user_id=(String)session.getAttribute("user_id");
		logingBoardVO.setUser_id(user_id);
		int insertCount = recordService.addRecord(logingBoardVO);
		log.info("Comment INSERT COUNT : " + insertCount);
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// record 수정시 write_no 하나로 그 record 가져오기
	@GetMapping(value = "recordModify/{write_no}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<LogingBoardVO> get(@PathVariable("write_no") String write_no) {
		log.info("==================== get ====================");
		log.info("write_no : " + write_no);
		log.info("user id in getList : "+recordService.getRecord(write_no).getUser_id());
		return new ResponseEntity<>(recordService.getRecord(write_no), HttpStatus.OK);
	}
	
	// record 수정시 write_no 하나로 그 record 가져오기
	@GetMapping(value = "recordRemove/{write_no}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<Integer> recordRemove(@PathVariable("write_no") String write_no) {
		log.info("==================== recordRemove ====================");
		log.info("write_no : " + write_no);
		return new ResponseEntity<>(recordService.deleteRecord(write_no), HttpStatus.OK);
	}

	@RequestMapping(value = "/recordDelete", method = RequestMethod.GET)
	public String recordDelete(@Param("write_no") String write_no, Criteria cri, RedirectAttributes rttr)
			throws Exception {
		log.info("===== recordDelete() =====");
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("modalOpen", "open");

		LogingBoardVO willDeleteLoging = recordService.getRecord(write_no);
		recordService.deleteRecord(write_no);
		String isbn = willDeleteLoging.getIsbn();
		return "redirect:record?isbn=" + isbn;
	}

	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH}, value="recordModifySave/{write_no}",consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody LogingBoardVO logingBoardVO, @PathVariable("write_no")int write_no){
		log.info("========================= modify =========================");
		logingBoardVO.setWrite_no(write_no);
		log.info("write_no : "+write_no);
		return recordService.modifyRecord(logingBoardVO)==1 ? new ResponseEntity<>("success",HttpStatus.OK): new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); 
	}
}
