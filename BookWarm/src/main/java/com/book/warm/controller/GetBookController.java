package com.book.warm.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.book.warm.json.ParsingJson;
import com.book.warm.service.JsonToBookVOService;

import lombok.extern.log4j.Log4j;
@Service
@Log4j
@RequestMapping("getbook/")
public class GetBookController {
	
	@Inject
	JsonToBookVOService jsonToBookVOService;
	@PostMapping(value = "/bookinfo", consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody ParsingJson parsingJson) {
		log.info("parsingJson : " + parsingJson);
		
		log.info("parsingJson.getDocuments().get(0).getIsbn()"+parsingJson.getDocuments().get(0).getIsbn().substring(11)); // get isbn(13char)
		log.info("parsingJson.getDocuments().get(0).getIsbn()"+parsingJson.getDocuments().get(0).getAuthors()); // get isbn(13char)
		return parsingJson!=null ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
