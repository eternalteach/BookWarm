package com.book.warm.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.book.warm.page.Criteria;
import com.book.warm.service.ShopListService;
import com.book.warm.vo.PagingBoardVO;

@Controller
public class ShopListController {
	
	@Inject
	ShopListService shoplistservice;
	
	//å ��� �ҷ�����
	@RequestMapping(value = "/shop_list", method = RequestMethod.GET)
	public String shop_list(Model model, Criteria criteria) throws Exception {
		System.out.println("å ����Ʈ");
		model.addAttribute("list", shoplistservice.shoplist());
		model.addAttribute("list_title", shoplistservice.shoplist2());
		
		
		
		 System.out.println(criteria.getAmount() + " : "+ criteria.getPageNum());
		
		//����¡ ó��
		model.addAttribute("shoplistpage", shoplistservice.shoplistpage(criteria));
		
		
		int total = shoplistservice.gettotalcount(criteria);
		System.out.println("��Ż:"+total);
		
		model.addAttribute("pageMaker", new PagingBoardVO(criteria, total));
		
		
		System.out.println("list:=====" + criteria);
		return "shop_list";
	}
	
	//å �������� �̵�
	@RequestMapping(value = "/shop_product", method = RequestMethod.GET)
	public String shop_product(HttpServletRequest req, Model model) throws Exception {
		
		System.out.println("å ��������");
		
		String isbn = req.getParameter("isbn");
		String wname = req.getParameter("writer_name");
		
		//String wname="����.K.�Ѹ�";
		System.out.println("=========================================================");
		System.out.println(wname);
		
		
		//å ������ ��������
		model.addAttribute("shop_product", shoplistservice.bookdetail(isbn));
		//å �帣 ��������
		model.addAttribute("bookgenre", shoplistservice.bookgenre(isbn));
		//������ �ٸ� å �ҷ�����
		model.addAttribute("bookwriter", shoplistservice.bookwriter(wname));
		System.out.println("�̰͵� ������");
		
		return "shop_product";
	}
	
	
	
}
