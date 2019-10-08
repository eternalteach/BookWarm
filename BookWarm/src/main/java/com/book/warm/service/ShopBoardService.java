package com.book.warm.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.book.warm.mapper.ShopMapper;
import com.book.warm.vo.CartJoinBookVO;
import com.book.warm.vo.CouponVO;
import com.book.warm.vo.UserVO;

@Service
public class ShopBoardService {
	
	@Inject
	ShopMapper shopMapper;
	
	public List<CartJoinBookVO> cartList(String user_id) {
		return shopMapper.cartList(user_id);
	}
	
	public void removeCart(String user_id, String isbn) {
		shopMapper.removeCart(user_id, isbn);
	}
	
	public void updateCnt(int cart_cnt, String cart_no) {
		shopMapper.updateCnt(cart_cnt, cart_no);
	}
	public CartJoinBookVO getCartOne(String cart_no) {
		return shopMapper.getCartOne(cart_no);
	}

	public UserVO getUserInfo(String user_id) {
		return shopMapper.getUserInfo(user_id);
	}

	public List<CouponVO> getCouponList(String user_id) {
		return shopMapper.getCouponList(user_id);
	}
	
	//====================추가코드==========================
	public void insertcart(CartJoinBookVO cartvo) {
		shopMapper.insertcart(cartvo);
	}
	public int countcart(String isbn, String user_id) {
		return shopMapper.countcart(isbn, user_id);
	}
	public void updatecart(CartJoinBookVO cartvo) {
		shopMapper.updatecart(cartvo);
	}
	public void delete(int cart_no) {
		shopMapper.delete(cart_no);
	}
	//==================================================

	public void addOrder(String orders_payment, String user_id, int orders_total, String refund_account, String refund_bank,
			String orders_pay_date, String coupon_no, String post_no, int orders_pay_total, int delivery_fee, int discounted_point) {
		shopMapper.addOrder(orders_payment, user_id, orders_total, refund_account, refund_bank, orders_pay_date, coupon_no, post_no, orders_pay_total, delivery_fee, discounted_point);
	}

	public String getOrders_no() {
		return shopMapper.getOrders_no();
	}

	public void addOrderItems(String isbn, String cart_cnt, String orders_no) {
		shopMapper.addOrderItems(isbn, cart_cnt, orders_no);
	}

	public void addPost(String user_id, String post_name, String post_phone, int post_zipcode, String post_addr,
			String post_addr_detail) {
		shopMapper.addPost(user_id, post_name, post_phone, post_zipcode, post_addr, post_addr_detail);
	}

	public String getPost_no() {
		return shopMapper.getPost_no();
	}

	public String limitDepositTime(String orders_no) {
		return shopMapper.limitDepositTime(orders_no);
	}

	public void removeCoupon(String user_id, String useCoupon) {
		shopMapper.removeCoupon(user_id, useCoupon);
	}

	public void setUserPoint(String user_id, int point) {
		shopMapper.setUserPoint(user_id, point);
	}

	public void addTotalPrice(String user_id, int orders_pay_total) {
		shopMapper.addTotalPrice(user_id, orders_pay_total);
	}

	
	
}
