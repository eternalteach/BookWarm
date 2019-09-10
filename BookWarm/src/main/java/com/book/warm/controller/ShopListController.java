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
	

	
	
}
