package com.book.warm.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.book.warm.mapper.UserInfoMapper;
import com.book.warm.page.Criteria;
import com.book.warm.vo.CouponVO;
import com.book.warm.vo.OrderListVO;
import com.book.warm.vo.OrdersVO;
import com.book.warm.vo.PostVO;
import com.book.warm.vo.UserVO;

import lombok.extern.log4j.Log4j;
@Log4j
@Service
public class UserInfoService {
	
	@Inject
	UserInfoMapper userInfoMapper;

	public List<OrderListVO> getMyOrders(String user_id, Criteria criteria) {
		return userInfoMapper.getMyOrders(user_id, criteria);
	}

	public List<OrdersVO> getOrderList(String user_id) {
		return userInfoMapper.getOrderList(user_id);
	}

	public int getOrderCnt(String user_id) {
		return userInfoMapper.getOrderCnt(user_id);
	}

	public int getPoint(String user_id) {
		return userInfoMapper.getPoint(user_id);
	}

	public int getCouponCnt(String user_id) {
		return userInfoMapper.getCouponCnt(user_id);
	}

	public void removeUser(String user_id) {
		userInfoMapper.removeUser(user_id);
	}

	public void removeUserFromAuthorities(String user_id) {
		userInfoMapper.removeUserFromAuthorities(user_id);
	}

	public void removeUserFromBook_star(String user_id) {
		userInfoMapper.removeUserFromBook_star(user_id);
	}

	public void removeUserFromCart(String user_id) {
		userInfoMapper.removeUserFromCart(user_id);
	}

	public void removeUserFromCoupon_no(String user_id) {
		userInfoMapper.removeUserFromCoupon_no(user_id);
	}

	public void removeUserFromFriend(String user_id) {
		userInfoMapper.removeUserFromFriend(user_id);
	}

	public void removeUserFromLibrary(String user_id) {
		userInfoMapper.removeUserFromLibrary(user_id);
	}

	public void removeUserFromLoging_board(String user_id) {
		userInfoMapper.removeUserFromLoging_board(user_id);
	}

	public void removeUserFromMsg_table1(String user_id) {
		userInfoMapper.removeUserFromMsg_table1(user_id);
	}

	public void removeUserFromMsg_table2(String user_id) {
		userInfoMapper.removeUserFromMsg_table2(user_id);
	}

	public void removeUserFromOrders(String user_id) {
		userInfoMapper.removeUserFromOrders(user_id);
	}

	public void removeUserFromPost(String user_id) {
		userInfoMapper.removeUserFromPost(user_id);
	}

	public void removeUserFromReview_board(String user_id) {
		userInfoMapper.removeUserFromReview_board(user_id);
	}

	public OrdersVO getOrderDetails(String orders_no) {
		return userInfoMapper.getOrderDetails(orders_no);
	}

	public CouponVO getUsedCoupon(String coupon_no) {
		return userInfoMapper.getUsedCoupon(coupon_no);
	}

	public PostVO getPostInfo(String post_no) {
		return userInfoMapper.getPostInfo(post_no);
	}
	
	public UserVO getUserInfo(String user_id) {
		log.info("========== getUserInfo() ==========");
		
		return userInfoMapper.getUserInfo(user_id);
	}

	public int modifyUserInfo(UserVO userInfo) {
		return userInfoMapper.modifyUserInfo(userInfo);
	}

	public CouponVO getCoupon(String coupon_no) {
		return userInfoMapper.getCoupon(coupon_no);
	}

	public void setCoupon(String user_id, String coupon_no) {
		userInfoMapper.setCoupon(user_id, coupon_no);
	}

	

	
	
}
