package com.book.warm.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.book.warm.service.ReviewBoardService;
import com.book.warm.vo.Criteria;
import com.book.warm.vo.PageDTO;
import com.book.warm.vo.ReviewAttachFileDTO;
import com.book.warm.vo.ReviewBoardVO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
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
										// 여기서 리뷰 조회시 작성자의 id를 굳이 param으로 받아올 필요는 없음.
										// 
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
	
}
