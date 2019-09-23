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
	
	
}
