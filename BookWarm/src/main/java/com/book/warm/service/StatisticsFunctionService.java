package com.book.warm.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.book.warm.vo.BookVO;
import com.book.warm.vo.LogingBoardVO;
@Service
public class StatisticsFunctionService {

	public int logingPage(ArrayList<LogingBoardVO> list, BookVO bookVO) {
		int total = bookVO.getTotalPage();

		int[] realReadPage = new int[total]; // 책의 읽은페이지 0으로 초기화
		for (int i = 0; i < total; i++) {
			realReadPage[i] = 0;
		}

		for (int j = 0; j < list.size(); j++) { // 읽은 페이지 체크하기
			int readStartPage = list.get(j).getStartPage();
			int readEndPage = list.get(j).getEndPage();
			for (int i = readStartPage - 1; i < readEndPage; i++) {
				realReadPage[i]++;
			}
		}

		int countPage = 0; // 읽은 페이지 수 카운트
		for (int i = 0; i < total; i++) {
			if (realReadPage[i] != 0) {
				countPage++;
			}
		}
		return countPage;
	}

}
