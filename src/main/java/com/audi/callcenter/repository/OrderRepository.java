package com.audi.callcenter.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.audi.callcenter.entity.SaleOrder;


//PagingAndSortingRepository用法参考  http://www.ibm.com/developerworks/cn/opensource/os-cn-spring-jpa/
public interface OrderRepository  extends PagingAndSortingRepository<SaleOrder, Long> {
	/**订单分页
	 * @param page
	 * @return
	 */
	@Query(value = "select s from SaleOrder s where s.createDate between ?1 and ?2 ", countQuery = " select count(s) from SaleOrder s  where s.createDate between ?1 and ?2" )
	public Page<SaleOrder> findOrderPageData(Date startTime,Date endTime,Pageable page) throws Exception;
}
