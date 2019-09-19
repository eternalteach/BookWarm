package com.book.warm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.book.warm.vo.CartJoinBookVO;
import com.book.warm.vo.CouponVO;
import com.book.warm.vo.UserVO;

public interface ShopMapper {
	
//	@Select("select t1.*, t2.book_title, t2.book_price_for_sale, t2.book_img\r\n" + 
//			"from (select user_id, isbn, count(*) as total\r\n" + 
//			"        from cart\r\n" + 
//			"        group by user_id, isbn\r\n" + 
//			"        order by user_id) t1 inner join book t2\r\n" + 
//			"on t1.isbn = t2.isbn \r\n" + 
//			"where user_id=#{user_id}\r\n" + 
//			"order by t1.user_id")
	public List<CartJoinBookVO> cartList(@Param("user_id") String user_id);
	
	public void removeCart(@Param("user_id") String user_id, @Param("isbn") String isbn);
	
	public void updateCnt(@Param("cart_cnt") int cart_cnt, @Param("cart_no") String cart_no);
	
	public CartJoinBookVO getCartOne(@Param("cart_no") String cart_no);

	public UserVO getUserInfo(@Param("user_id") String user_id);

	public List<CouponVO> getCouponList(@Param("user_id") String user_id);
	
	//추가코드
	public void insertcart(CartJoinBookVO cartvo);
	public void updatecart(CartJoinBookVO cartvo);
	
}
