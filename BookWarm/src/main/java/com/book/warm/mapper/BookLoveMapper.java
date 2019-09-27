package com.book.warm.mapper;

import com.book.warm.vo.BookLoveVO;

public interface BookLoveMapper {
	//하트눌렀을때 추가
	public void insertlove(BookLoveVO bookloveco);
	//하트눌렀을때 제거
	public void deletelove(int book_love);
	//하트눌린 목록 추출(리스트로 뿌려주기)
}
