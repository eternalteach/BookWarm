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

	public List<CouponVO> getCouponList(@Param("user_id") String user_id, @Param("coupon_use_req") int coupon_use_req);
	
	//=================추가코드==========================================
	public void insertcart(CartJoinBookVO cartvo);
	public int  countcart(@Param("isbn")String isbn, @Param("user_id") String user_id);
	public void updatecart(CartJoinBookVO cartvo);
	public void delete(int cart_no);
	//===============================================================

	public void addOrder(@Param("orders_payment") String orders_payment, @Param("user_id") String user_id, @Param("orders_total") int orders_total,
			@Param("refund_account") String refund_account, @Param("refund_bank") String refund_bank,
			@Param("orders_pay_date") String orders_pay_date, @Param("coupon_no") String coupon_no, @Param("post_no") String post_no,
			@Param("orders_pay_total") int orders_pay_total, @Param("delivery_fee") int delivery_fee, @Param("discounted_point") int discounted_point);

	public String getOrders_no();

	public void addOrderItems(@Param("isbn") String isbn, @Param("cart_cnt") String cart_cnt, 
			@Param("orders_no") String orders_no);

	public void addPost(@Param("user_id") String user_id, @Param("post_name") String post_name, @Param("post_phone") String post_phone,
			@Param("post_zipcode") int post_zipcode, @Param("post_addr") String post_addr, @Param("post_addr_detail") String post_addr_detail);

	public String getPost_no();

	public String limitDepositTime(@Param("orders_no") String orders_no);

	public void removeCoupon(@Param("user_id") String user_id, @Param("useCoupon") String useCoupon);

	public void setUserPoint(@Param("user_id") String user_id, @Param("point") int point);

	public void addTotalPrice(@Param("user_id") String user_id, @Param("orders_pay_total") int orders_pay_total);

	public String getBookTitles(@Param("isbn") String isbn);

	
}
