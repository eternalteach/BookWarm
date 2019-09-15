package com.book.warm.mapper;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.book.warm.vo.BookVO;
import com.book.warm.vo.LibraryVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class LibraryMapperTest {

	@Inject
	private LibraryMapper LibraryMapper;

	@Inject
	private AddBookDetailInfoMapper addBookDetailInfoMapper;

	@Test
	public void addLibraryTest() {
		// 실행 전 BOOK 등록하고 진행하기(20개 책 등록 이상 필요) 
		// 실행전 user_id가 SQL에 있는지 확인하고 진행하기

		List<BookVO> bookList = addBookDetailInfoMapper.getBookList();

		for (int bookNum = 0; bookNum < bookList.size() && bookNum<20; bookNum++) {
			LibraryVO libraryVO = new LibraryVO();
			String isbn = bookList.get(bookNum).getIsbn();
			String list_img_src = bookList.get(bookNum).getBook_img();
			String user_id = "aaa";
			// 리스트 개수 확인하는 쿼리 필요하다
			// 이미 등록된 책은 등록되지 않도록 한다.
			int list_no = 1; // 리스트 개수 확인 후 등록하게 해야한다. 한 페이지당 리스트 20개
			String list_type = "장르01";
			libraryVO.setUser_id(user_id);
			libraryVO.setIsbn(isbn);
			libraryVO.setList_img_src(list_img_src);
			libraryVO.setList_no(list_no);
			libraryVO.setList_type(list_type);
			
			int listNoNum = LibraryMapper.getListNoCnt(list_no);
			if(listNoNum<20) {
				LibraryMapper.addMyBook(libraryVO);
			}else {
				// 기존에 등록된 20개 
			}
		}
	}

	@Test
	public void listNoNumTest() {
		int listNoNum = LibraryMapper.getListNoCnt(1);
		System.out.println("=========================================================== : "+listNoNum);
	}

}
