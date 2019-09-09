package com.book.warm.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.book.warm.mapper.ShopListMapper;
import com.book.warm.vo.Criteria;
import com.book.warm.vo.ShopListBoardVO;

@Service
public class ShopListService {

	@Inject
	ShopListMapper shoplistmapper;
	
	//베스트 순서로 불러오기
	public List<ShopListBoardVO> shoplist() throws Exception{
		System.out.println("ShopList 베스트순으로 불러오기");

		return shoplistmapper.shoplist();
	}
	
	//제목순(ㄱㄴㄷㄹ)순으로 불러오기
	public List<ShopListBoardVO> shoplist2() throws Exception{
		System.out.println("shoplist2 제목순으로 불러오기");
		return shoplistmapper.shoplist2();
	}
	
	//책 상세정보 불러오기
	public ShopListBoardVO bookdetail(String isbn) throws Exception{
		System.out.println("책 상세정보 가져오기");
		return shoplistmapper.bookdetail(isbn);
	}
	
	//책의 장르 불러오기
	public List<ShopListBoardVO> bookgenre(String isbn) throws Exception {
		System.out.println("장르 불러오기");
		return shoplistmapper.bookgenre(isbn);
	}
	
	//대표저자의 다른 책들 불러오기
	public List<ShopListBoardVO> bookwriter(String writer_name) throws Exception {
		System.out.println("bookwriter 실행");
		return shoplistmapper.bookwriter(writer_name);
	}
	
	//페이징처리
	public List<ShopListBoardVO> shoplistpage(Criteria criteria) throws Exception{
		System.out.println("페이징 처리");
		return shoplistmapper.shoplistpage(criteria);
	}
	
	
	//전체 페이지개수
	public int gettotalcount(Criteria criteria) {
		System.out.println("전체개수");
		return shoplistmapper.gettotalcount(criteria);
	}
	
}
