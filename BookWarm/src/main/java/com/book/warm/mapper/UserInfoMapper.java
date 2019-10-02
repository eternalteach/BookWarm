package com.book.warm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.book.warm.vo.OrderListVO;
import com.book.warm.vo.OrdersVO;

public interface UserInfoMapper {

	List<OrderListVO> getMyOrders(@Param("user_id") String user_id);

	List<OrdersVO> getOrderList(@Param("user_id") String user_id);

	int getOrderCnt(@Param("user_id") String user_id);

	int getPoint(@Param("user_id") String user_id);

	int getCouponCnt(@Param("user_id") String user_id);
	
	// 회원탈퇴
	void removeUser(@Param("user_id") String user_id);

	void removeUserFromAuthorities(@Param("user_id") String user_id);

	void removeUserFromBook_star(@Param("user_id") String user_id);

	void removeUserFromCart(@Param("user_id") String user_id);

	void removeUserFromCoupon_no(@Param("user_id") String user_id);

	void removeUserFromFriend(@Param("user_id") String user_id);

	void removeUserFromLibrary(@Param("user_id") String user_id);

	void removeUserFromLoging_board(@Param("user_id") String user_id);

	void removeUserFromMsg_table1(@Param("user_id") String user_id);

	void removeUserFromMsg_table2(@Param("user_id") String user_id);

	void removeUserFromOrders(@Param("user_id") String user_id);

	void removeUserFromPost(@Param("user_id") String user_id);

	void removeUserFromReview_board(@Param("user_id") String user_id);



}
