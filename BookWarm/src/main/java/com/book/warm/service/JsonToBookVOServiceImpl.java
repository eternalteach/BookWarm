package com.book.warm.service;

import java.util.ArrayList;
import java.util.List;

import com.book.warm.json.ParsingJson;
import com.book.warm.vo.BookVO;

public class JsonToBookVOServiceImpl implements JsonToBookVOService {

	@Override
	public List<BookVO> JsonToBookVO(ParsingJson parsingJson) {
		List<BookVO> bookVOList = new ArrayList<BookVO>();
		for(int BookCnt=0;BookCnt<parsingJson.getDocuments().size();BookCnt++) {
			BookVO bookVO= new BookVO();
			parsingJson.getDocuments().get(BookCnt).getAuthors();//list
			parsingJson.getDocuments().get(BookCnt).getContents();
			parsingJson.getDocuments().get(BookCnt).getDatetime();
			parsingJson.getDocuments().get(BookCnt).getIsbn();
			parsingJson.getDocuments().get(BookCnt).getPrice();
			parsingJson.getDocuments().get(BookCnt).getPublisher();
			parsingJson.getDocuments().get(BookCnt).getSalePrice();
			parsingJson.getDocuments().get(BookCnt).getThumbnail();
			parsingJson.getDocuments().get(BookCnt).getTitle();
			parsingJson.getDocuments().get(BookCnt).getTranslators();//list
			parsingJson.getDocuments().get(BookCnt).getUrl();
			parsingJson.getDocuments().get(BookCnt).getStatus();
		}
		return bookVOList;
	}

}
