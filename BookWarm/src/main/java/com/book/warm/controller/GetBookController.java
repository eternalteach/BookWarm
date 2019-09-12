package com.book.warm.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.book.warm.json.ParsingJson;
import com.book.warm.mapper.AddBookDetailInfoMapper;
import com.book.warm.service.JsonToBookVOService;
import com.book.warm.vo.AuthorsVO;
import com.book.warm.vo.BookVO;
import com.book.warm.vo.TranslatorsVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("getbook/")
public class GetBookController {
	@Inject
	JsonToBookVOService jsonToBookVOService;

	@Inject
	AddBookDetailInfoMapper mapper;
	
	@PostMapping(value = "/bookinfo", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> saveBookInfo(@RequestBody ParsingJson parsingJson) {
		log.info("parsingJson : " + parsingJson);
		List<AuthorsVO> authorsVOList = jsonToBookVOService.JsonToAuthorsVO(parsingJson);
		List<BookVO> bookVOList = jsonToBookVOService.JsonToBookVO(parsingJson);
		List<TranslatorsVO> translatorsVOList = jsonToBookVOService.JsonToTranslatorsVO(parsingJson);
		mapper.addBook(bookVOList);
		mapper.addAuthors(authorsVOList);
		mapper.addTranslators(translatorsVOList);
		return parsingJson != null ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
