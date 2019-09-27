package com.book.warm.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.book.warm.mapper.BookLoveMapper;

@Service
public class BookLoveService {

	@Inject
	BookLoveMapper booklovemapper;

}
