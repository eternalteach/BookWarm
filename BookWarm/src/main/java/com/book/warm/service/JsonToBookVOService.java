package com.book.warm.service;

import java.util.List;

import com.book.warm.json.ParsingJson;
import com.book.warm.vo.BookVO;


public interface JsonToBookVOService {

	public List<BookVO> JsonToBookVO(ParsingJson parsingJson);
	// 그 메서드에서 document받아오고
	// document 사이즈 알아와서
	// 정보를 bookVO객체에 setting하고 
	// 세팅한것을 list에 저장
	// 그 다음 list에서 하나씩 bookVO를 받아와서
	// DB에 isbn으로 검색해서 있는지 확인하기
	// 있으면 저장 안하고, 없으면 저장하기.
	
	// 책 정보 등록할때
	// 카카오에서 검색해서 책 정보 받아오기
	// 받아온 정보 DB에 저장
	
}
