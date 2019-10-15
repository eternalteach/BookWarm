package com.book.warm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.book.warm.page.Criteria;
import com.book.warm.vo.CouponVO;
import com.book.warm.vo.OrderListVO;
import com.book.warm.vo.OrdersVO;
import com.book.warm.vo.PostVO;
import com.book.warm.vo.UserVO;

public interface UserInfoMapper {

	List<OrderListVO> getMyOrders(String user_id, Criteria criteria);

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
	// 회원 탈퇴 끝
	
	OrdersVO getOrderDetails(@Param("orders_no") String orders_no);

	CouponVO getUsedCoupon(@Param("coupon_no") String coupon_no);

	PostVO getPostInfo(@Param("post_no") String post_no);
	
	UserVO getUserInfo(String user_id);

	int modifyUserInfo(UserVO userInfo);

	CouponVO getCoupon(@Param("user_id") String user_id, @Param("coupon_no") String coupon_no);

	void setCoupon(@Param("user_id") String user_id, @Param("coupon_no") String coupon_no);

	int getUserLevel(@Param("user_id") String user_id);

	CouponVO chkHaveCoupon(@Param("coupon_no") String coupon_no, @Param("user_id") String user_id);


}
