package com.book.warm.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.book.warm.service.ReviewBoardService;
import com.book.warm.vo.Criteria;
import com.book.warm.vo.PageDTO;
import com.book.warm.vo.ReviewBoardVO;

@Controller
public class ReviewBoardController {
	
	@Inject
	ReviewBoardService rbs;
	
	// 내가 쓴 모든 리뷰가 최근 수정일 순 - 책별로 나타남
	@RequestMapping("/reviewMain")
	public String recordMain(@RequestParam("user_id") String user_id, Model model) {
		
		model.addAttribute("list", rbs.selectBoardList(user_id));
		
		return "reviewMain";
	}
	
	// 책별 감상 목록
	@RequestMapping("/reviewPerBook2")
	public String reviewPerBook2(ReviewBoardVO rbVO, Criteria cri, Model model) {
		
		model.addAttribute("list", rbs.getListPerBook(rbVO.getIsbn(), rbVO.getUser_id(), cri));
		model.addAttribute("thumbnail", rbs.showBookThumbnail(rbVO.getIsbn()));
		return "reviewPerBook2";
	}
	
	// 책별 감상 목록
	@RequestMapping("/reviewPerBook")
	public String reviewPerBook(ReviewBoardVO rbVO, Criteria cri, Model model) {

		model.addAttribute("list", rbs.getListPerBook(rbVO.getIsbn(), rbVO.getUser_id(), cri));
		model.addAttribute("thumbnail", rbs.showBookThumbnail(rbVO.getIsbn()));
		int total = rbs.getTotal(cri, rbVO.getIsbn(), rbVO.getUser_id());
		System.out.println("total : " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "reviewPerBook";
	}
	
	// 감상 하나만 보기
	@RequestMapping("/reviewSelectOne")
	public String reviewSelectOne(@RequestParam("review_no") int review_no, 
										@RequestParam("user_id") String user_id,
									    @RequestParam("isbn") String isbn, 
									    @ModelAttribute("cri") Criteria cri, Model model) {
		
		model.addAttribute("review", rbs.selectedReview(review_no, user_id));
		model.addAttribute("book", rbs.bookInfo(isbn));
		return "reviewSelectOne";
	}
	
	// review 작성 페이지
	@RequestMapping("/reviewWrite")
	public String reviewWrite(ReviewBoardVO rbVO, Model model) {
		
		model.addAttribute("review", rbVO);
		
		return "reviewWrite";
	}
	
	// 작성 페이지에서 등록 버튼 클릭시
	@RequestMapping("/register")
	public String write(ReviewBoardVO rbVO, RedirectAttributes rttr) {
		rbs.registerReview(rbVO);
		rttr.addAttribute("isbn", rbVO.getIsbn());
		rttr.addAttribute("user_id", rbVO.getUser_id());
		
		return "redirect:/reviewPerBook";
	}
	
	@RequestMapping("/delete")
	public String delete(ReviewBoardVO rbVO, RedirectAttributes rttr) {
		
		// 삭제하는 데 필요한 건 review_no. id도 필요한가...?
		rbs.deleteReview(rbVO);
		
		rttr.addAttribute("isbn", rbVO.getIsbn());
		rttr.addAttribute("user_id", rbVO.getUser_id());
		
		return "redirect:/reviewPerBook";
	}
	
	@RequestMapping("/modifyReview")
	public String modify(ReviewBoardVO rbVO, @ModelAttribute("cri") Criteria cri, Model model) {
		
		rbVO = rbs.selectedReview(rbVO.getReview_no(), rbVO.getUser_id());
		
		model.addAttribute("review", rbVO);
		
		return "reviewModify";
	}
	
	@RequestMapping("/modify")
	public String modify(ReviewBoardVO rbVO, Criteria cri, RedirectAttributes rttr) {
		
		rbs.modifyReview(rbVO);
		rttr.addAttribute("user_id", rbVO.getUser_id());
		rttr.addAttribute("review_no", rbVO.getReview_no());
		rttr.addAttribute("isbn", rbVO.getIsbn());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/reviewSelectOne";
	}
	
}
