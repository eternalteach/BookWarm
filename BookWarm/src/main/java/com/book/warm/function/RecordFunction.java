package com.book.warm.function;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.book.warm.service.RecordService;
import com.book.warm.service.StatisticsFunctionService;
import com.book.warm.vo.BookVO;
import com.book.warm.vo.LogingBoardVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class RecordFunction {
	@Inject
	StatisticsFunctionService statisticsFunctionService;
	@Inject
	RecordService recordService;

	private int startPage;
	private int endPage;
	private int readPageNum;
	private double reading;
	private int bookTotalPage;
	private int recordNum;
	private int logingCount;

	public RecordFunction(int startPage, int endPage, int readPageNum, double reading, int bookTotalPage,
			int recordNum) {
		super();
		this.startPage = startPage;
		this.endPage = endPage;
		this.readPageNum = readPageNum;
		this.reading = reading;
		this.bookTotalPage = bookTotalPage;
		this.recordNum = recordNum;
	}

	public RecordFunction() {
		super();
	}

	public int getLogingCount() {
		return logingCount;
	}

	public void setLogingCount(int logingCount) {
		this.logingCount = logingCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getReadPageNum() {
		return readPageNum;
	}

	public void setReadPageNum(int readPageNum) {
		this.readPageNum = readPageNum;
	}

	public double getReading() {
		return reading;
	}

	public void setReading(double reading) {
		this.reading = reading;
	}

	public int getBookTotalPage() {
		return bookTotalPage;
	}

	public void setBookTotalPage(int bookTotalPage) {
		this.bookTotalPage = bookTotalPage;
	}

	public int getRecordNum() {
		return recordNum;
	}

	public void setRecordNum(int recordNum) {
		this.recordNum = recordNum;
	}

	public void setRecordFunction(List<LogingBoardVO> logingList, BookVO bookVO, String user_id) {
		
		log.info("====================RecordFunction INIT");

		this.startPage = statisticsFunctionService.firstPage(logingList);
		this.endPage = statisticsFunctionService.endPage(logingList);
		this.readPageNum = statisticsFunctionService.logingPage(logingList, bookVO);
		int bookTotalPage = bookVO.getBook_tot_page();
		this.reading = ((double) readPageNum / (double) bookTotalPage) * 100;
		this.logingCount = recordService.getCount(bookVO, user_id);

	}

}
