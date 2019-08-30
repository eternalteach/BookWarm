package com.book.warm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.book.warm.vo.CartVO;

public interface ShopMapper {
	
//	@Select("select t1.*, t2.book_title, t2.book_price_for_sale, t2.book_img\r\n" + 
//			"from (select user_id, isbn, count(*) as total\r\n" + 
//			"        from cart\r\n" + 
//			"        group by user_id, isbn\r\n" + 
//			"        order by user_id) t1 inner join book t2\r\n" + 
//			"on t1.isbn = t2.isbn \r\n" + 
//			"where user_id=#{user_id}\r\n" + 
//			"order by t1.user_id")
	@Select("select c.*, b.book_title, b.book_price_for_sale, b.book_img, c.cart_cnt*b.book_price_for_sale as total\r\n" + 
			"		from cart c inner join book b\r\n" + 
			"		on c.isbn = b.isbn\r\n" + 
			"		where c.user_id = #{user_id}")
	public List<CartVO> cartList(@Param("user_id") String user_id);
	
	@Delete("delete from cart where user_id = #{user_id} and isbn = #{isbn}")
	public void removeCart(@Param("user_id") String user_id, @Param("isbn") String isbn);
	
//	@Select("select c.*, b.book_title, b.book_price_for_sale, b.book_img, c.cart_cnt*b.book_price_for_sale as total\r\n" + 
//			"		from cart c inner join book b\r\n" + 
//			"		on c.isbn = b.isbn\r\n" + 
//			"		where c.user_id = #{user_id}\r\n" + 
//			"		and c.cart_no != #{cart_no}")
//	public List<CartVO> removeCart(@Param("user_id") String user_id, @Param("cart_no") String cart_no);
	
	
	
}
