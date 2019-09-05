package com.book.warm.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.book.warm.service.ShopListService;
import com.book.warm.vo.Criteria;
import com.book.warm.vo.PagingBoardVO;

@Controller
public class ShopListController {
	
	@Inject
	ShopListService shoplistservice;
	
	//책 목록 불러오기
	@RequestMapping(value = "/shop_list", method = RequestMethod.GET)
	public String shop_list(Model model, Criteria criteria) throws Exception {
		
		System.out.println("책 리스트");
		//model.addAttribute("list", shoplistservice.shoplist());
		//model.addAttribute("list_title", shoplistservice.shoplist2());
		
		
		
		 System.out.println(criteria.getAmount() + " : "+ criteria.getPageNum());
		
		//페이징 처리
		model.addAttribute("shoplistpage", shoplistservice.shoplistpage(criteria));
		model.addAttribute("shoplistpage2", shoplistservice.shoplistpage2(criteria));
		
		
		int total = shoplistservice.gettotalcount(criteria);
		System.out.println("토탈:"+total);
		
		model.addAttribute("pageMaker", new PagingBoardVO(criteria, total));
		model.addAttribute("pageMaker2", new PagingBoardVO(criteria, total));
		
		
		System.out.println("list:=====" + criteria);
		return "shop_list";
	}
	
	//책 상세페이지 이동
	@RequestMapping(value = "/shop_product", method = RequestMethod.GET)
	public String shop_product(HttpServletRequest req, Model model) throws Exception {
		
		System.out.println("책 상세페이지");
		
		String isbn = req.getParameter("isbn");
		String wname = req.getParameter("writer_name");
		
		//String wname="조앤.K.롤링";
		System.out.println("=========================================================");
		System.out.println(wname);
		
		
		//책 상세정보 가져오기
		model.addAttribute("shop_product", shoplistservice.bookdetail(isbn));
		//책 장르 가져오기
		model.addAttribute("bookgenre", shoplistservice.bookgenre(isbn));
		//저자의 다른 책 불러오기
		model.addAttribute("bookwriter", shoplistservice.bookwriter(wname));
		System.out.println("이것도 나오나");
		
		return "shop_product";
	}
	
	
	
}
