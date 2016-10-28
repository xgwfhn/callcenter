package com.audi.callcenter.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.audi.callcenter.entity.SaleOrder;
import com.audi.callcenter.repository.OrderRepository;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderRepository	orderRepository;
	
	@Override
	public Page<SaleOrder> findOrderPageData(Date startTime,Date endTime,Pageable page) throws Exception {
		return orderRepository.findOrderPageData(startTime,endTime,page);
	}

}
