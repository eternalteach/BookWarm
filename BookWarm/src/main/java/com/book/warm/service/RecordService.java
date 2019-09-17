package com.book.warm.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.book.warm.mapper.LogingBoardMapper;
import com.book.warm.page.Criteria;
import com.book.warm.vo.BookVO;
import com.book.warm.vo.LogingBoardVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class RecordService {

	@Inject
	LogingBoardMapper mapper;

	public BookVO getBook(String isbn) {
		log.info("========== getBook() ==========");
		return mapper.getBookVO(isbn);
	}

	public List<LogingBoardVO> getList(Criteria criteria, BookVO bookVO, String user_id) {
		log.info("========== getList() ==========");
		return mapper.getListWithPaging(criteria, bookVO, user_id);
	}

	public Integer getCount(BookVO bookVO, String user_id) {
		log.info("========== getCount() ==========");
		return mapper.CountWriteNo(bookVO, user_id);
	}

	public LogingBoardVO getRecord(String write_no) {
		log.info("========== getRecord() ==========");
		return mapper.getLogingVOForWriteNo(write_no);
	}
	
	public int deleteRecord(String write_no) {
		log.info("========== deleteRecord() ==========");
		return mapper.deleteLoging(write_no);
	}
	public int addRecord(LogingBoardVO logingBoardVO) {
		log.info("========== addRecord() ==========");
		return mapper.logingBoard(logingBoardVO);
	}
	public int modifyRecord(LogingBoardVO logingBoardVO) {
		log.info("========== modifyRecord() ==========");
		return mapper.modifyLoging(logingBoardVO);
	}
}
