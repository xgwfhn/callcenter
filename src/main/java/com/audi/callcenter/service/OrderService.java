package com.audi.callcenter.service;

import java.util.Date;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.audi.callcenter.entity.SaleOrder;


public interface OrderService {
	public Page<SaleOrder> findOrderPageData(Date startTime,Date endTime,Pageable page) throws Exception;
}
