package com.book.warm.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.book.warm.mapper.ShopListMapper;
import com.book.warm.page.Criteria;

@Service
public class ShopListService {

	@Inject
	ShopListMapper shoplistmapper;
	
}
