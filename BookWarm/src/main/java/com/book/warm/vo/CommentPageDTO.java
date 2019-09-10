package com.book.warm.vo;

import java.util.List;

import com.book.warm.vo.ReviewCommentVO;

public class CommentPageDTO {
	
	private int commentCnt;
	private List<ReviewCommentVO> list;
	
	
	public CommentPageDTO() {
		super();
	}

	public CommentPageDTO(int commentCnt, List<ReviewCommentVO> list) {
		super();
		this.commentCnt = commentCnt;
		this.list = list;
	}

	public int getCommentCnt() {
		return commentCnt;
	}

	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}

	public List<ReviewCommentVO> getList() {
		return list;
	}

	public void setList(List<ReviewCommentVO> list) {
		this.list = list;
	}
	
	
}
