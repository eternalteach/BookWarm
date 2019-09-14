package com.book.warm.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.book.warm.mapper.ShopMapper;
import com.book.warm.vo.CartVO;

@Service
public class ShopBoardService {
	
	@Inject
	ShopMapper shopMapper;
	
	public List<CartVO> cartList(String user_id) {
		return shopMapper.cartList(user_id);
	}
	
	public void removeCart(String user_id, String isbn) {
		shopMapper.removeCart(user_id, isbn);
	}
	
	public void updateCnt(int cart_cnt, String cart_no) {
		shopMapper.updateCnt(cart_cnt, cart_no);
	}
	
	public CartVO getCartOne(String cart_no) {
		return shopMapper.getCartOne(cart_no);
	}
	
	
	
	
//	@Inject
//	SqlSessionTemplate sqlSession;
//	
////	public List<CartVO> cartList(String user_id) {
////		return sqlSession.selectList("shopping.listCart", user_id);
////	}
//	
//	public List<CartVO> cartList(String user_id) {
//		return sqlSession.selectList("shopping.listCart", user_id);
//	}
//	
//	public List<CartVO> removeCart(CartVO cartVO) {
//		return sqlSession.selectList("shopping.removeCart", cartVO);
//	}
	
}
