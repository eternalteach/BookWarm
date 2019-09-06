package com.book.warm.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.book.warm.vo.UserVO;

public interface RegisterMapper {
	
	@Select("select * from user_info where user_mail=#{user_mail}")
	public UserVO checkUser(@Param("user_mail")String user_mail);

	@Insert("insert into user_info\r\n" + 
			"values(#{user_id}, #{user_pw}, #{user_nickname}, #{user_name}, TO_DATE(#{user_bday}), #{user_sex}, #{user_phone}, #{user_mail}, #{user_zipcode}, #{user_addr}, #{user_addr_detail}, sysdate, '앨리스', 0, 0)")
	public void insertNewUser(UserVO userVO);
	
	
}
