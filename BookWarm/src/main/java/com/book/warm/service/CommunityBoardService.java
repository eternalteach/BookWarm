package com.book.warm.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.book.warm.vo.CommunityBoardVO;

@Service
public interface CommunityBoardService {

	public ArrayList<CommunityBoardVO> getCommunityBoardList();

	public CommunityBoardVO getCommunityBoardOne(String commNo);

	public int getCommunityBoardOneDelete(String commNo);

}
