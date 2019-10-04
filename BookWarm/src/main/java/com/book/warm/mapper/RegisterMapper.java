package com.book.warm.mapper;

import org.apache.ibatis.annotations.Param;

import com.book.warm.vo.UserVO;

public interface RegisterMapper {
	
	public UserVO checkUser(@Param("user_mail")String user_mail);

	public void insertNewUser(UserVO userVO);

	public int checkDuplicatedId(@Param("user_id") String user_id);

	public int checkDuplicatedNickname(@Param("user_nickname") String user_nickname);
}
