package com.book.warm.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.book.warm.vo.BookVO;
import com.book.warm.vo.LogingBoardVO;
@Service
public class StatisticsFunctionService {

	public int logingPage(ArrayList<LogingBoardVO> list, BookVO bookVO) {
		int total = bookVO.getTotalPage();

		int[] realReadPage = new int[total]; // Ï±ÖÏùò ?ùΩ???éò?ù¥Ïß? 0?úºÎ°? Ï¥àÍ∏∞?ôî
		for (int i = 0; i < total; i++) {
			realReadPage[i] = 0;
		}

		for (int j = 0; j < list.size(); j++) { // ?ùΩ?? ?éò?ù¥Ïß? Ï≤¥ÌÅ¨?ïòÍ∏?
			int readStartPage = list.get(j).getStart_page();
			int readEndPage = list.get(j).getEnd_page();
			for (int i = readStartPage - 1; i < readEndPage; i++) {
				realReadPage[i]++;
			}
		}

		int countPage = 0; // ?ùΩ?? ?éò?ù¥Ïß? ?àò Ïπ¥Ïö¥?ä∏
		for (int i = 0; i < total; i++) {
			if (realReadPage[i] != 0) {
				countPage++;
			}
		}
		return countPage;
	}

}
