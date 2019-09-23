package com.book.warm.controller;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.book.warm.function.RecordFunction;
import com.book.warm.service.RecordService;
import com.book.warm.service.StatisticsFunctionService;
import com.book.warm.vo.BookVO;
import com.book.warm.vo.LogingBoardVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class RecordBoardController {
	
	@Inject
	RecordService recordService;

	@Inject
	RecordFunction recordFunction;
	
	@Inject
	StatisticsFunctionService statisticsFunctionService;

	@RequestMapping(value = "/record", method = RequestMethod.GET)
	public String record(Model model, @Param("bookVO") BookVO bookVO, Principal principal)
			throws Exception {
		log.info("===== record() =====");
		String user_id = principal.getName();
		bookVO = recordService.getBook(bookVO.getIsbn());// get isbn and set all bookVO attr
		List<LogingBoardVO> logingList = recordService.getList(user_id, bookVO.getIsbn());
		int recordNum= recordService.getCount(bookVO, user_id);
		
		recordFunction.setRecordFunction(logingList, bookVO, user_id);
		model.addAttribute("bookVO", bookVO);
		model.addAttribute("user_id",user_id);
		model.addAttribute("recordNum", recordNum);
		model.addAttribute("recordInfo",recordFunction);
		return "/record";
	}

		@GetMapping(value = "/reload/{user_id}/{isbn}", produces = { MediaType.APPLICATION_XML_VALUE,
				MediaType.APPLICATION_JSON_UTF8_VALUE })
		public ResponseEntity<RecordFunction> recordGetList(Model model, @PathVariable("user_id") String user_id,
				@PathVariable("isbn") String isbn) {
			log.info("====================get List====================");
			BookVO bookVO = recordService.getBook(isbn);
			List<LogingBoardVO> logingList = recordService.getList(user_id, bookVO.getIsbn());
			 
			recordFunction.setRecordFunction(logingList, bookVO, user_id);
			log.info("recordInfo.getRecordNum ================"+recordFunction.getRecordNum());
			model.addAttribute("bookVO", bookVO);
			model.addAttribute("user_id",user_id);
			return new ResponseEntity<>(recordFunction, HttpStatus.OK);
		}
		
	
	
	@PostMapping(value = "/recordwrite", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> recordWrite(Principal principal, @RequestBody LogingBoardVO logingBoardVO) {
		log.info("========== recordWrite ==========");
		String user_id = principal.getName();
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

	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH}, value="recordModifySave/{write_no}",consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody LogingBoardVO logingBoardVO, @PathVariable("write_no")int write_no){
		log.info("========================= modify =========================");
		logingBoardVO.setWrite_no(write_no);
		log.info("write_no : "+write_no);
		return recordService.modifyRecord(logingBoardVO)==1 ? new ResponseEntity<>("success",HttpStatus.OK): new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); 
	}
	
	//check comm_no's comment
		@GetMapping(value = "getRecordList/{user_id}/{isbn}", produces = { MediaType.APPLICATION_XML_VALUE,
				MediaType.APPLICATION_JSON_UTF8_VALUE })
		public ResponseEntity<List<LogingBoardVO>> getList(@PathVariable("user_id") String user_id,
				@PathVariable("isbn") String isbn) {
			log.info("====================get List====================");
			return new ResponseEntity<>(recordService.getList(user_id, isbn), HttpStatus.OK);
		}
}
