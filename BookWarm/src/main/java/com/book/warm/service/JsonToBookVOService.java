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

	@Inject
	AddBookDetailInfoMapper mapper;

	public int JsonToBookVO(ParsingJson parsingJson) {
		log.info("=============== JsonToBookVO ===============");
		int addBookNum = 0;
		int bookDataNum = parsingJson.getDocuments().size();
		for (int BookCnt = 0; BookCnt < bookDataNum; BookCnt++) {
			String isbnTo13Char = parsingJson.getDocuments().get(BookCnt).getIsbn().split(" ")[1];
			if (mapper.getBook(isbnTo13Char) == null) {
				String book_title = replaceJSTL(parsingJson.getDocuments().get(BookCnt).getTitle());
				String writer_name = replaceJSTL(parsingJson.getDocuments().get(BookCnt).getAuthors().toString());
				String translator_name = replaceJSTL(
						parsingJson.getDocuments().get(BookCnt).getTranslators().toString());
				String publisher_name = replaceJSTL(parsingJson.getDocuments().get(BookCnt).getPublisher());
				Integer book_tot_page = 1000;
				Timestamp book_published_date = Function
						.StringToTimestampForAPI(parsingJson.getDocuments().get(BookCnt).getDatetime());
				Integer book_price = parsingJson.getDocuments().get(BookCnt).getPrice();
				Integer book_price_for_sale = parsingJson.getDocuments().get(BookCnt).getSalePrice() != null
						? parsingJson.getDocuments().get(BookCnt).getSalePrice()
						: book_price;
				String book_stock = replaceJSTL(parsingJson.getDocuments().get(BookCnt).getStatus());
				String book_story = replaceJSTL(parsingJson.getDocuments().get(BookCnt).getContents());
				String book_img = parsingJson.getDocuments().get(BookCnt).getThumbnail();
				BookVO bookVO = new BookVO(isbnTo13Char, book_title, writer_name, translator_name, publisher_name,
						book_tot_page, book_published_date, book_price, book_price_for_sale, book_stock, book_story,
						book_img);
				mapper.addBook(bookVO);
				addBookNum++;
			}
		}
		return addBookNum;
	}

	public String replaceJSTL(String jstl) {
		return jstl.replaceAll("&gt;", ">").replaceAll("&lt;", "<").replaceAll("&amp;", "&").replaceAll("&apos;", "`")
				.replaceAll("&", " AND ");
	}

	public int JsonToAuthorsVO(ParsingJson parsingJson) {
		log.info("=============== JsonToAuthorsVO ===============");
		int bookDataNum = parsingJson.getDocuments().size();
		int addAuthorsNum = 0;
		for (int BookIndex = 0; BookIndex < bookDataNum; BookIndex++) {
			int numOfAuthors = parsingJson.getDocuments().get(BookIndex).getAuthors().size();
			for (int authorsNum = 0; authorsNum < numOfAuthors; authorsNum++) {
				String isbnTo13Char = parsingJson.getDocuments().get(BookIndex).getIsbn().split(" ")[1];
				String author = parsingJson.getDocuments().get(BookIndex).getAuthors().get(authorsNum);
				AuthorsVO authorVO = new AuthorsVO(isbnTo13Char, author);
				if (mapper.getAuthors(authorVO) == null) {
					mapper.addAuthors(authorVO);
					addAuthorsNum++;
				}
			}
		}
		return addAuthorsNum;
	}

	public int JsonToTranslatorsVO(ParsingJson parsingJson) {
		log.info("=============== JsonToTranslatorsVO ===============");
		int bookDataNum = parsingJson.getDocuments().size();
		int addTranslatorsNum = 0;
		for (int BookIndex = 0; BookIndex < bookDataNum; BookIndex++) {
			if (!(parsingJson.getDocuments().get(BookIndex).getTranslators().size() == 0)) {
				int numOfTranslators = parsingJson.getDocuments().get(BookIndex).getTranslators().size();
				for (int translatorsNum = 0; translatorsNum < numOfTranslators; translatorsNum++) {
					// 유효성 검사 추가하기 ( 이미 같은 값이 있을 때 안 넣게 하기
					String isbnTo13Char = parsingJson.getDocuments().get(BookIndex).getIsbn().split(" ")[1];
					String translator = parsingJson.getDocuments().get(BookIndex).getTranslators().get(translatorsNum);
					TranslatorsVO translatorVO = new TranslatorsVO(isbnTo13Char, translator);
					if (mapper.getTranslators(translatorVO) == null) {
						mapper.addTranslators(translatorVO);
						addTranslatorsNum++;
					}
				}
			}
		}
		return addTranslatorsNum;
	}

	public String saveBookInfoToDB(ParsingJson parsingJson) {
		log.info("=============== saveBookInfoToDB ===============");
		String saveResult = "";
		log.info("BookVO 저장");
		saveResult += "저장된 BookVo 수 : "+JsonToBookVO(parsingJson);
		log.info("AuthorsVO 저장");
		saveResult +="저장된 AuthorsVO 수 : " + JsonToAuthorsVO(parsingJson);
		log.info("TranslatorsVO 저장");
		saveResult += "저장된 TranslatorsVO 수 : "+ JsonToTranslatorsVO(parsingJson);
		return saveResult;
	}
}
