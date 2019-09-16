package com.book.warm.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.book.warm.mapper.ShopListMapper;
import com.book.warm.page.Criteria;
import com.book.warm.vo.BookVO;

@Service
public class ShopListService {

	/*
	 * @Inject ShopListMapper shoplistmapper;
	 * 
	 * //제목순으로 불러오기 public List<BookVO> shoptitlelist() throws Exception{ return
	 * shoplistmapper.shoptitlelist(); }
	 * 
	 * //가격(저렴한순)으로 불러오기 public List<BookVO> bookpricelist() throws Exception{
	 * return shoplistmapper.bookpricelist(); }
	 * 
	 * 
	 * //isbn && writer_name으로 책 상세정보 불러오기 public List<BookVO> bookdetail(String
	 * isbn, String writer_name) throws Exception{ return
	 * shoplistmapper.bookdetail(isbn, writer_name); }
	 * 
	 * //writer_name이 같은 다른 책들 불러오기 public List<BookVO> bookwritername(String
	 * writer_name) throws Exception{ return
	 * shoplistmapper.bookwritername(writer_name); }
	 */
	
	/*
	 * 
	 * public int gettotalcount(Criteria criteria) { return
	 * shoplistmapper.gettotalcount(criteria); }
	 */
	
}
