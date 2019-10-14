package com.book.warm.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.book.warm.function.RecordFunction;
import com.book.warm.mapper.LibraryMapper;
import com.book.warm.page.Criteria;
import com.book.warm.page.PageDTO;
import com.book.warm.service.RecordService;
import com.book.warm.service.ReviewBoardService;
import com.book.warm.vo.BookVO;
import com.book.warm.vo.FinishedBookVO;
import com.book.warm.vo.LogingBoardVO;
import com.book.warm.vo.ReviewAttachFileDTO;
import com.book.warm.vo.ReviewAttachVO;
import com.book.warm.vo.ReviewBoardVO;
import com.book.warm.vo.ReviewMainVO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class ReviewBoardController {
	
	@Inject
	ReviewBoardService service;
	
	@Inject
	RecordService recordService;

	@Inject
	RecordFunction recordFunction;
	
	@Inject
	LibraryMapper mapper;
	
	@GetMapping("/reviewMain")
	public void recordMain(Principal principal, Model model) {
		model.addAttribute("libNewbie", service.getLibNewbie(principal.getName()));
		model.addAttribute("logCPM", recordService.getCPM(principal.getName()));
		model.addAttribute("total", service.getTotal(principal.getName()));
	}
	
	// 책별 감상 목록
	@RequestMapping("/reviewPerBook")
	public String reviewPerBook(Principal principal, ReviewBoardVO rbVO, Criteria cri, Model model) {
		
		String user_id = principal.getName();
		
		// 한 책에 대한 리뷰를 모두 가져온다.
		List<ReviewBoardVO> reviewList = service.getListPerBook(rbVO.getIsbn(), user_id, cri);
		
		// 리뷰에 해당하는 책 정보를 가져온다.
		BookVO bookVO = service.bookInfo(rbVO.getIsbn());
		
		// 책 얼마나 읽었는지 등등에 대한 정보
		List<LogingBoardVO> logingList = recordService.getList(user_id, rbVO.getIsbn());
		int recordNum= recordService.getCount(bookVO, user_id);
		recordFunction.setRecordFunction(logingList, bookVO, user_id);
		
		// 총 몇개의 리뷰가 있는지
		int total = service.getTotal(cri,  rbVO.getIsbn(), user_id);
		
		model.addAttribute("list", reviewList);
		model.addAttribute("bookVO", bookVO);
		model.addAttribute("recordNum", recordNum);
		model.addAttribute("recordInfo",recordFunction);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "reviewPerBook";
	}
	
	// 감상 하나만 보기
	@RequestMapping("/reviewSelectOne")
	public String reviewSelectOne(@RequestParam("review_no") int review_no, 
									    @RequestParam("isbn") String isbn, 
									    @ModelAttribute("cri") Criteria cri, Model model) {
		
		model.addAttribute("review", service.selectedReview(review_no));
		model.addAttribute("book", service.bookInfo(isbn));
		return "reviewSelectOne";
	}
	
	// review 작성 페이지
	@RequestMapping("/reviewWrite")
	public String reviewWrite(Principal principal, ReviewBoardVO rbVO, Model model) {
		
		// 작성 페이지로 넘어갈 때 내 서재에 있는 책 목록도 함께 넘어가도록.
		
		model.addAttribute("myList", mapper.getMyList(principal.getName()));
		model.addAttribute("review", rbVO);
		
		return "reviewWrite";
	}
	
	// 작성 페이지에서 등록 버튼 클릭시
	@PostMapping("/register")
	public String write(ReviewBoardVO rbVO, RedirectAttributes rttr) {
		
		log.info("==============");
		log.info("register: " + rbVO);
		
		if(rbVO.getAttachList() != null) {
			rbVO.getAttachList().forEach(attach -> log.info(attach));
		}
		log.info("==================");
		
		service.registerReview(rbVO);
		rttr.addAttribute("isbn", rbVO.getIsbn());
		
		return "redirect:/reviewPerBook";
	}
	
	@RequestMapping("/delete")
	public String delete(ReviewBoardVO rbVO, Criteria cri, RedirectAttributes rttr) {
		
		List<ReviewAttachVO> attachList = service.getAttachList(rbVO.getReview_no());
		if(service.deleteReview(rbVO)==1) { // 리뷰 삭제에 성공시
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("isbn", rbVO.getIsbn());
		rttr.addAttribute("user_id", rbVO.getUser_id());
		
		return "redirect:/reviewPerBook" + cri.getListLink();
	}
	
	@RequestMapping("/modifyReview")
	public String modify(ReviewBoardVO rbVO, @ModelAttribute("cri") Criteria cri, Model model) {
		
		rbVO = service.selectedReview(rbVO.getReview_no());
		
		model.addAttribute("review", rbVO);
		
		return "reviewModify";
	}
	
	@RequestMapping("/modify")
	public String modify(ReviewBoardVO rbVO, Criteria cri, RedirectAttributes rttr) {
		
		service.modifyReview(rbVO);
		rttr.addAttribute("user_id", rbVO.getUser_id());
		rttr.addAttribute("review_no", rbVO.getReview_no());
		rttr.addAttribute("isbn", rbVO.getIsbn());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/reviewSelectOne";
	}
	
	// 게시물 번호 이용해 첨부파일 관련 데이터 json으로 반환
		@GetMapping(value = "/getAttachList",
						produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<List<ReviewAttachVO>> getAttachList(int review_no) {
			
			log.info("getAttachList: " + review_no);
			return new ResponseEntity<>(service.getAttachList(review_no), HttpStatus.OK);
		}
		
	
	// =========================== ajax를 이용한 파일 첨부 =======================================
	
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		
		log.info("upload ajax");
	}
	
	@PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ReviewAttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		
		List<ReviewAttachFileDTO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload";
		
		String uploadFolderPath = getFolder();
		// make folder
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		// make yyyy/MM/dd folder
		
		for(MultipartFile multipartFile : uploadFile) {
			
			ReviewAttachFileDTO attachDTO = new ReviewAttachFileDTO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			// IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);
			attachDTO.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				
				// check image type file
				if(checkImageType(saveFile)) {
					
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
				}
				
				// add to List
				list.add(attachDTO);
			} catch(Exception e) {
				log.error(e.getMessage());
			} // end catch
			
		} // end for
		return new ResponseEntity<>(list, HttpStatus.OK);
	} // end uploadAjaxPost
	
	// 썸네일 데이터 전송
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
		
		log.info("fileName: " + fileName);
		File file = new File("c:\\upload\\" + fileName);
		log.info("file: " + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 서버에서 첨부파일 삭제
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName) {
		
		log.info("deleteFile: " + fileName);
		
		File file;
		
		try {
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			String largeFileName = file.getAbsolutePath().replace("s_", "");
			log.info("largeFileName: " + largeFileName);
			
			file = new File(largeFileName);
			
			file.delete();
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	private String getFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	// 들어오는 파일이 이미지파일인지를 확실히 검사하기 위한 메서드
	private boolean checkImageType(File file) {
		
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	private void deleteFiles(List<ReviewAttachVO> attachList) {
		
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		log.info("delete attach files");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());
				Files.deleteIfExists(file);
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\s_" + attach.getUuid() + "_" + attach.getFileName());
					Files.delete(thumbNail);
				}
			} catch(Exception e) {
				log.error("delete file error" + e.getMessage());
			} // end catch
		}); // end forEach
	}
	
	@GetMapping(value="/calendar",
					produces= {
								MediaType.APPLICATION_XML_VALUE,
								MediaType.APPLICATION_JSON_UTF8_VALUE })
	@ResponseBody
	public ResponseEntity<List<FinishedBookVO>> getMyLogs(Principal principal) {
	
	// end_date(완독여부) 값이 true면 start_date가 가장 최신인 날짜에 책 이미지를 뿌린다.
    String user_id = principal.getName();
	log.info("get LogingBoadVO list : " + recordService.getMyLogs(user_id));
	
		return new ResponseEntity<List<FinishedBookVO>>(recordService.getMyLogs(user_id), HttpStatus.OK);
	}
	
	@RequestMapping("/openreview")
	public void openReview(Model model) {
		List<ReviewBoardVO> reviews = service.getOpenReview();
		
		// 리뷰 목록을 가져와서 각각의 리뷰 번호로 첨부파일 목록을 조회해 reviewVO에 세팅해준다.
		for(ReviewBoardVO review : reviews) {
			if(service.getAttachList(review.getReview_no())!=null) {
				review.setAttachList(service.getAttachList(review.getReview_no()));
			}
		}
		model.addAttribute("openreview", reviews);
	}
	
	@GetMapping(value="/review/{reviewNo}",
					produces = { MediaType.APPLICATION_XML_VALUE,
									MediaType.APPLICATION_JSON_UTF8_VALUE })
		public ResponseEntity<ReviewBoardVO> get(@PathVariable("reviewNo") String reviewNo) {
		
			int review_no = Integer.parseInt(reviewNo);
		
		return new ResponseEntity<>(service.selectedReview(review_no), HttpStatus.OK);
	}
	
	// 최근 리뷰 페이징
	@GetMapping(value="/recentReviews/pages/{page}",
			produces= {
						MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE })
	@ResponseBody
	public ResponseEntity<List<ReviewMainVO>> getRecentReviewWithPaging(@PathVariable("page") int page, Principal principal) {
	
		Criteria cri = new Criteria(page ,3);
		String user_id = principal.getName();
	
	return new ResponseEntity<List<ReviewMainVO>>(service.selectBoardList(user_id, cri), HttpStatus.OK);
	}
	
}
