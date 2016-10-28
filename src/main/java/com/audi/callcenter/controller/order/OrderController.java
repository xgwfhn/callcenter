package com.audi.callcenter.controller.order;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.audi.callcenter.entity.QueryPage;
import com.audi.callcenter.entity.SaleOrder;
import com.audi.callcenter.service.OrderService;
import com.audi.callcenter.utils.DateUtil;

@Controller
@RequestMapping(value = "/order")
public class OrderController {
	
	private static Logger logger = Logger.getLogger(OrderController.class);

	@Autowired
	private OrderService  orderService;
	/**跳转到订单列表页面
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/orderList")
	public String orderList(HttpServletRequest request, Model model) {
		//return "order/orderList"; 
		return "order/orderList4dataTables"; 
	}
	
	@RequestMapping(value = "/findOrderList",method=RequestMethod.GET)
	@ResponseBody
	public List<SaleOrder> findOrderList(HttpServletRequest request, Model model) {
		System.out.println("findOrderList");
		try {
			//return userService.findUsersByName("坎坎坷坷");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; 
	}
	
	// bootstrap-table 分页插件 初始化时 加载数据方法 
	@RequestMapping(value = "/findOrderPageData",method=RequestMethod.GET)
	@ResponseBody
	public  Map<String,Object>  findOrderPageData(HttpServletRequest request, Model model){
		try {
			Order order = new Order(Direction.DESC,"id"); //字段排序O
			PageRequest pageRequest = new PageRequest(0, 10, new Sort(order));//当前页码从0开始
			Page<SaleOrder> pages= orderService.findOrderPageData(null,null,pageRequest);
			
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("rows", pages.getContent());//记录数据及总记录数   key  必须为写死为rows,total   由插件所决定
			map.put("total", 10);
			return map; 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**datatables插件分页  初始化时 加载数据方法 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/findOrderPageData1", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject  findOrderPageData1(HttpServletRequest request, QueryPage<SaleOrder> page,Model model) {
		logger.info("---------------sortNum:"+request.getParameter("iSortCol_0"));//被排序的列
		logger.info("---------------sortOrder:"+request.getParameter("sSortDir_0"));////排序的方向 "desc" 或者 "asc".
		logger.info("---------------pageNumber:"+request.getParameter("iDisplayStart"));//当前页的第一条纪录的索引号
		logger.info("---------------iDisplayLength:"+request.getParameter("iDisplayLength"));//每页记录数
		
		logger.info("---------------sSearch:"+request.getParameter("sSearch"));//获取参数  具体参数名称  可以设置断点观察  requst 便知道
		
		int pageSize=Integer.parseInt(request.getParameter("iDisplayLength"));//每页记录数
		int pageNumber=Integer.parseInt(request.getParameter("iDisplayStart"))/pageSize;//当前页
		
		String arg=request.getParameter("sSearch");//获取查询条件
		Date sartTime=null;
		Date endTime=null;
		if(StringUtils.isNotEmpty(arg)){
			  String[] str=arg.split("&&");
			 sartTime=DateUtil.StringToDate(str[0]);
			 endTime=DateUtil.StringToDate(str[1]);
		}
		
		logger.info("------pageNumber:"+pageNumber+" pageSize:"+pageSize);//每页记录数
		Order order = new Order(Direction.DESC,"id"); //字段排序O
		PageRequest pageRequest = new PageRequest(pageNumber, pageSize, new Sort(order));//spring data jpa 的分页接口 当前页码从0开始
		Page<SaleOrder> pages=null;
		try {
			pages = orderService.findOrderPageData(sartTime,endTime,pageRequest);
			logger.info("-----:"+pages.getContent().size());
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("aaData", pages.getContent());//记录数据及总记录数   key  必须为写死为aaData,iTotalRecords   由插件所决定
			map.put("iTotalDisplayRecords", pages.getTotalElements());//要显示的总记录数
			map.put("iTotalRecords", pages.getSize());//总记录数
			//String aa="{\"aaData\":[{\"first_name\":\"Airi\",\"last_name\":\"Satou\",\"position\":\"Accountant\",\"office\":\"Tokyo\",\"start_date\":\"28th Nov 08\",\"salary\":\"$162,700\"},{\"first_name\":\"Angelica\",\"last_name\":\"Ramos\",\"position\":\"Chief Executive Officer (CEO)\",\"office\":\"London\",\"start_date\":\"9th Oct 09\",\"salary\":\"$1,200,000\"},{\"first_name\":\"Ashton\",\"last_name\":\"Cox\",\"position\":\"Junior Technical Author\",\"office\":\"San Francisco\",\"start_date\":\"12th Jan 09\",\"salary\":\"$86,000\"},{\"first_name\":\"Bradley\",\"last_name\":\"Greer\",\"position\":\"Software Engineer\",\"office\":\"London\",\"start_date\":\"13th Oct 12\",\"salary\":\"$132,000\"},{\"first_name\":\"Brenden\",\"last_name\":\"Wagner\",\"position\":\"Software Engineer\",\"office\":\"San Francisco\",\"start_date\":\"7th Jun 11\",\"salary\":\"$206,850\"},{\"first_name\":\"Brielle\",\"last_name\":\"Williamson\",\"position\":\"Integration Specialist\",\"office\":\"New York\",\"start_date\":\"2nd Dec 12\",\"salary\":\"$372,000\"},{\"first_name\":\"Bruno\",\"last_name\":\"Nash\",\"position\":\"Software Engineer\",\"office\":\"London\",\"start_date\":\"3rd May 11\",\"salary\":\"$163,500\"},{\"first_name\":\"Caesar\",\"last_name\":\"Vance\",\"position\":\"Pre-Sales Support\",\"office\":\"New York\",\"start_date\":\"12th Dec 11\",\"salary\":\"$106,450\"},{\"first_name\":\"Cara\",\"last_name\":\"Stevens\",\"position\":\"Sales Assistant\",\"office\":\"New York\",\"start_date\":\"6th Dec 11\",\"salary\":\"$145,600\"},{\"first_name\":\"Cedric\",\"last_name\":\"Kelly\",\"position\":\"Senior Javascript Developer\",\"office\":\"Edinburgh\",\"start_date\":\"29th Mar 12\",\"salary\":\"$433,060\"},{\"first_name\":\"Cara\",\"last_name\":\"Stevens\",\"position\":\"Sales Assistant\",\"office\":\"New York\",\"start_date\":\"6th Dec 11\",\"salary\":\"$145,600\"},{\"first_name\":\"Cedric\",\"last_name\":\"Kelly\",\"position\":\"Senior Javascript Developer\",\"office\":\"Edinburgh\",\"start_date\":\"29th Mar 12\",\"salary\":\"$433,060\"}]}";
			return JSONObject.fromObject(map);  //转换的集合里的对象 的枚举 属性  对应的数据库 值不能为空
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
				
	}
}
