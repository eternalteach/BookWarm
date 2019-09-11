package com.book.warm.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.book.warm.function.Function;
import com.book.warm.json.ParsingJson;
import com.book.warm.vo.AuthorsVO;
import com.book.warm.vo.BookVO;
import com.book.warm.vo.TranslatorsVO;

@Service
public class JsonToBookVOService {

	public List<BookVO> JsonToBookVO(ParsingJson parsingJson) {
		List<BookVO> bookVOList = new ArrayList<BookVO>();
		for (int BookCnt = 0; BookCnt < parsingJson.getDocuments().size(); BookCnt++) {
			BookVO bookVO = new BookVO(); // BOOKVO에 추가할 것들
			String isbn=parsingJson.getDocuments().get(BookCnt).getIsbn();
			String book_title=parsingJson.getDocuments().get(BookCnt).getTitle();
			String writer_name=parsingJson.getDocuments().get(BookCnt).getAuthors().toString();// list tostring으로 저장
			String translator_name=parsingJson.getDocuments().get(BookCnt).getTranslators().toString();// list toString으로 저장
			String publisher_name=parsingJson.getDocuments().get(BookCnt).getPublisher();
			int book_tot_page = 1000;
			Timestamp book_published_date=Function.StringToTimestamp(parsingJson.getDocuments().get(BookCnt).getDatetime());
			int book_price=parsingJson.getDocuments().get(BookCnt).getPrice();
			int book_price_for_sale=parsingJson.getDocuments().get(BookCnt).getSalePrice();
			String book_stock=parsingJson.getDocuments().get(BookCnt).getStatus();
			String book_story=parsingJson.getDocuments().get(BookCnt).getContents();
			String book_img=parsingJson.getDocuments().get(BookCnt).getThumbnail();
			bookVO.setIsbn(isbn);
			bookVO.setBook_title(book_title);
			bookVO.setWriter_name(writer_name);
			bookVO.setTranslator_name(translator_name);
			bookVO.setPublisher_name(publisher_name);
			bookVO.setBook_tot_page(book_tot_page);
			bookVO.setBook_published_date(book_published_date);
			bookVO.setBook_price(book_price);
			bookVO.setBook_price_for_sale(book_price_for_sale);
			bookVO.setBook_stock(book_stock);
			bookVO.setBook_story(book_story);
			bookVO.setBook_img(book_img);
			bookVOList.add(bookVO);
		}
		return bookVOList;
	}

	public List<AuthorsVO> JsonToAuthorsVO(ParsingJson parsingJson) {
		List<AuthorsVO> authrosVOList = new ArrayList<AuthorsVO>();
		for (int BookCnt = 0; BookCnt < parsingJson.getDocuments().size(); BookCnt++) {
			AuthorsVO authorsVO = new AuthorsVO();
			parsingJson.getDocuments().get(BookCnt).getAuthors();// list
			parsingJson.getDocuments().get(BookCnt).getIsbn();
		}

		return authrosVOList;
	}

	public List<TranslatorsVO> JsonToTranslatorsVO(ParsingJson parsingJson) {
		List<TranslatorsVO> translatorsVOList = new ArrayList<TranslatorsVO>();
		for (int BookCnt = 0; BookCnt < parsingJson.getDocuments().size(); BookCnt++) {
			parsingJson.getDocuments().get(BookCnt).getIsbn();
			parsingJson.getDocuments().get(BookCnt).getTranslators();// list
		}
		return translatorsVOList;
	}
	
	

	

}
