package com.book.warm.controller;

import java.security.Principal;

import javax.inject.Inject;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.book.warm.mapper.LibraryMapper;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class LibraryController {

	@Inject
	LibraryMapper mapper;
	
	@RequestMapping(value = "/library", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public String library(Principal principal, Model model) throws Exception {
		
		System.out.println(principal);
		System.out.println("principal.getName(): " + principal.getName());
		
		model.addAttribute("libraryBooks",mapper.getLibraryBooks(principal.getName()));
		
		return "library";
	}

}
