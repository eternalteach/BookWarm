package com.book.warm.page;

import java.util.List;

import com.book.warm.vo.CommunityBoardCommentVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class CommunityCommentPageDTO {

	private int commentCnt;
	private List<CommunityBoardCommentVO> list;
}
