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

	public void makePayment(String pay_way, int pay_total, String pay_refund_account, String pay_refund_bank,
			String orders_pay_date, String coupon_no) {
		shopMapper.makePayment(pay_way, pay_total, pay_refund_account, pay_refund_bank, orders_pay_date, coupon_no);
	}

	public int getPay_no() {
		return shopMapper.getPay_no();
	}

	public void makeOrder(String user_id, String isbn, String cart_cnt, int pay_no) {
		shopMapper.makeOrder(user_id, isbn, cart_cnt, pay_no);
		
	}

	
	
}
