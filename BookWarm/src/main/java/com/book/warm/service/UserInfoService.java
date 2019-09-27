package com.book.warm.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.book.warm.mapper.UserInfoMapper;
import com.book.warm.vo.OrderListVO;
import com.book.warm.vo.OrdersVO;

@Service
public class UserInfoService {
	
	@Inject
	UserInfoMapper userInfoMapper;

	public List<OrderListVO> getMyOrders(String user_id) {
		return userInfoMapper.getMyOrders(user_id);
	}

	public List<OrdersVO> getOrderList(String user_id) {
		return userInfoMapper.getOrderList(user_id);
	}

	public int getOrderCnt(String user_id) {
		return userInfoMapper.getOrderCnt(user_id);
	}

	
	
}
