package com.book.warm.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.book.warm.function.Function;
import com.book.warm.json.ParsingJson;
import com.book.warm.mapper.AddBookDetailInfoMapper;
import com.book.warm.vo.AuthorsVO;
import com.book.warm.vo.BookVO;
import com.book.warm.vo.TranslatorsVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class JsonToBookVOService {
	public List<BookVO> JsonToBookVO(ParsingJson parsingJson) {
		log.info("=============== JsonToBookVO ===============");
		List<BookVO> bookVOList = new ArrayList<BookVO>();
		for (int BookCnt = 0; BookCnt < parsingJson.getDocuments().size(); BookCnt++) {
			String isbn = parsingJson.getDocuments().get(BookCnt).getIsbn().split(" ")[1];
			String book_title = parsingJson.getDocuments().get(BookCnt).getTitle();
			String writer_name = parsingJson.getDocuments().get(BookCnt).getAuthors().toString();
			String translator_name = parsingJson.getDocuments().get(BookCnt).getTranslators().toString();
			String publisher_name = parsingJson.getDocuments().get(BookCnt).getPublisher();
			Integer book_tot_page = 1000;
			Timestamp book_published_date = Function.StringToTimestampForAPI(parsingJson.getDocuments().get(BookCnt).getDatetime());
			Integer book_price = parsingJson.getDocuments().get(BookCnt).getPrice();
			Integer book_price_for_sale = parsingJson.getDocuments().get(BookCnt).getSalePrice()!=null?parsingJson.getDocuments().get(BookCnt).getSalePrice():0;
			String book_stock = parsingJson.getDocuments().get(BookCnt).getStatus();
			String book_story = parsingJson.getDocuments().get(BookCnt).getContents();
			String book_img = parsingJson.getDocuments().get(BookCnt).getThumbnail();
			BookVO bookVO = new BookVO(isbn,book_title,writer_name,translator_name,publisher_name,book_tot_page,book_published_date,book_price,book_price_for_sale,book_stock,book_story,book_img);
			bookVOList.add(bookVO);
		}
		return bookVOList;
	}

	public List<AuthorsVO> JsonToAuthorsVO(ParsingJson parsingJson) {
		log.info("=============== JsonToAuthorsVO ===============");
		List<AuthorsVO> authrosVOList = new ArrayList<AuthorsVO>();
		int numOfBooks = parsingJson.getDocuments().size();
		for (int BookIndex = 0; BookIndex < numOfBooks; BookIndex++) {
			int numOfAuthors = parsingJson.getDocuments().get(BookIndex).getAuthors().size();
			for (int authorsNum = 0; authorsNum < numOfAuthors; authorsNum++) {
				String author = parsingJson.getDocuments().get(BookIndex).getAuthors().get(authorsNum);
				String isbnTo13Char = parsingJson.getDocuments().get(BookIndex).getIsbn().split(" ")[1];
				authrosVOList.add(new AuthorsVO(isbnTo13Char, author));
			}
		}
		return authrosVOList;
	}

	public List<TranslatorsVO> JsonToTranslatorsVO(ParsingJson parsingJson) {
		log.info("=============== JsonToTranslatorsVO ===============");
		List<TranslatorsVO> translatorsVOList = new ArrayList<TranslatorsVO>();
		int numOfBooks = parsingJson.getDocuments().size();
		for (int BookIndex = 0; BookIndex < numOfBooks; BookIndex++) {
			if (!(parsingJson.getDocuments().get(BookIndex).getTranslators().size()==0)) {
				int numOfTranslators = parsingJson.getDocuments().get(BookIndex).getTranslators().size();
				for (int translatorsNum = 0; translatorsNum < numOfTranslators; translatorsNum++) {
					String translator = parsingJson.getDocuments().get(BookIndex).getTranslators().get(translatorsNum);
					String isbnTo13Char = parsingJson.getDocuments().get(BookIndex).getIsbn().split(" ")[1];
					translatorsVOList.add(new TranslatorsVO(isbnTo13Char, translator));
				}
			}
		}
		return translatorsVOList;
	}
}
