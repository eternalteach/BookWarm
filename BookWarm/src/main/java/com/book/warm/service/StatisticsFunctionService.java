package com.book.warm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.book.warm.vo.BookVO;
import com.book.warm.vo.LogingBoardVO;

@Service
public class StatisticsFunctionService {

	public int logingPage(List<LogingBoardVO> list, BookVO bookVO) {
		if(list.size()==-1||list.size()==0) {
			System.out.println("list.size() : "+list.size());
			return 0;
		}
		int total = bookVO.getBook_tot_page();

		int[] realReadPage = new int[total]; // 책의 ?��???��?���? 0?���? 초기?��
		for (int i = 0; i < total; i++) {
			realReadPage[i] = 0;
		}

		for (int j = 0; j < list.size(); j++) { // ?��?? ?��?���? 체크?���?
			int readStartPage = list.get(j).getStart_page();
			int readEndPage = list.get(j).getEnd_page();
			for (int i = readStartPage - 1; i < readEndPage; i++) {
				realReadPage[i]++;
			}
		}

		int countPage = 0; // ?��?? ?��?���? ?�� 카운?��
		for (int i = 0; i < total; i++) {
			if (realReadPage[i] != 0) {
				countPage++;
			}
		}
		return countPage;
	}

	public int firstPage(List<LogingBoardVO> list) {
		if(list.size()==-1||list.size()==0) {
			System.out.println("list.size() : "+list.size());
			return 0;
		}
		int listSize = list.size();
		int firstpage = list.get(0).getStart_page();
		for (int i = 0; i < listSize; i++) {
			if (firstpage > list.get(i).getStart_page()) {
				firstpage = list.get(i).getStart_page();
			}
		}
		return firstpage;
	}

	public int endPage(List<LogingBoardVO> list) {
		if(list.size()==-1||list.size()==0) {
			System.out.println("list.size() : "+list.size());
			return 0;
		}
		int listSize = list.size();
		int endpage = list.get(0).getEnd_page();
		for (int i = 0; i < listSize; i++) {
			if (endpage < list.get(i).getEnd_page()) {
				endpage = list.get(i).getEnd_page();
			}
		}
		return endpage;
	}

}
