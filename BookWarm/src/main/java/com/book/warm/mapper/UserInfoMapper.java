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


}
