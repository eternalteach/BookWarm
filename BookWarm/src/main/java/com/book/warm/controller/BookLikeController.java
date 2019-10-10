package com.book.warm.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.book.warm.service.BookLikeService;
import com.book.warm.vo.BookLikeVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("BookLike/")
@RestController
@Log4j
@AllArgsConstructor
public class BookLikeController {

	private BookLikeService service;

	@PostMapping(value = "/add", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> addBookLike(@RequestBody BookLikeVO bookLikeVO, Principal principal) {
		log.info("=============== addBookLike() ===============");
		String user_id=principal.getName();
		bookLikeVO.setUser_id(user_id);
		log.info(bookLikeVO.getIsbn());
		return service.addBookLike(bookLikeVO) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping(value = "/getMyBookLike", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<BookLikeVO>> getListMyBookLike(Principal principal) {
		log.info("==================== getListMyBookLike() ====================");
		return new ResponseEntity<>(service.getListMyBookLike(principal.getName()), HttpStatus.OK);
	}
	
	@GetMapping(value="{isbn}", produces= {MediaType.APPLICATION_ATOM_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Integer> checkBookLikeAboutISBN(@PathVariable("isbn") String isbn,Principal principal){
		log.info("==================== checkBookLikeAboutISBN() ====================");
		String user_id=principal.getName();
		BookLikeVO checkBookLike = new BookLikeVO();
		checkBookLike.setIsbn(isbn);
		checkBookLike.setUser_id(user_id);
		return new ResponseEntity<>(service.checkBookLikeAboutISBN(checkBookLike),HttpStatus.OK);
	}
	
	@DeleteMapping(value="/remove/{isbn}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> removeBookLikeAboutISBN(@PathVariable("isbn") String isbn,Principal principal){
		log.info("==================== removeBookLikeAboutISBN() ====================");
		String user_id=principal.getName();
		BookLikeVO checkBookLike = new BookLikeVO();
		checkBookLike.setIsbn(isbn);
		checkBookLike.setUser_id(user_id);
		return service.removeBookLikeAboutISBN(checkBookLike)==1 ? new ResponseEntity<>("success",HttpStatus.OK):new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
