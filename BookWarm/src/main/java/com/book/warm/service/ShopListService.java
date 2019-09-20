package com.book.warm.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.book.warm.mapper.ShopListMapper;
import com.book.warm.vo.BookListVO;
import com.book.warm.vo.BookVO;

@Service
public class ShopListService {

	@Inject
	ShopListMapper shoplistmapper;
	
	//제목순으로 불러오기
	public List<BookListVO> shoptitlelist() throws Exception{
		return shoplistmapper.shoptitlelist();
	}
	
	//가격(저렴한순)으로 불러오기
	public List<BookListVO> bookpricelist() throws Exception{
		return shoplistmapper.bookpricelist();
	}
	
	//가격(비싼순)
	public List<BookListVO> bookpricelist2() throws Exception{
		return shoplistmapper.bookpricelist2();
	}
	
	//isbn 으로 책 상세정보 불러오기
	public BookListVO bookdetail(String isbn) throws Exception{
		return  shoplistmapper.bookdetail(isbn);
	}
	
	//author이 같은 다른 책들 불러오기
	public List<BookListVO> bookwritername(String author) throws Exception{
		return shoplistmapper.bookwritername(author);
	}

}
