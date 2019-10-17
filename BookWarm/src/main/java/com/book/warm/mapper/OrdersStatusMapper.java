package com.book.warm.mapper;

import org.apache.ibatis.annotations.Param;

import com.book.warm.vo.OrdersStatusVO;

public interface OrdersStatusMapper {

	int modifyStatus(@Param("ordersStatusVO") OrdersStatusVO ordersStatusVO);

}
