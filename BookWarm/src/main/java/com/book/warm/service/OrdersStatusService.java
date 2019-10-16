package com.book.warm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.book.warm.mapper.AuthenticationMapper;
import com.book.warm.mapper.OrdersStatusMapper;
import com.book.warm.vo.AuthVO;
import com.book.warm.vo.OrdersStatusVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class OrdersStatusService {

	@Autowired
	OrdersStatusMapper ordersStatusMapper;

	public int modifyOrdersStatus(OrdersStatusVO ordersStatusVO) {
		log.info("========== modifyOrdersStatus()");
		log.info("ordersStatusVO.modifyOrdersStatus()"+ordersStatusVO.getOrders_status());
		return ordersStatusMapper.modifyStatus(ordersStatusVO);
	}

}
