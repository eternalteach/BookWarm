package com.book.warm.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.book.warm.service.MsgService;
import com.book.warm.vo.MsgTableVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/replies/")
@Log4j
@AllArgsConstructor
public class MsgtestController {
	
	@Inject
	MsgService msgservice;
	
	@PostMapping(value="/new", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody MsgTableVO msgvo) throws Exception{
		log.info("MsgTableVO:" + msgvo);
		int msginsert = msgservice.msginsert(msgvo);
		log.info("MsgTableVO insert count:" + msginsert);
		
		return msginsert == 1
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	
}
