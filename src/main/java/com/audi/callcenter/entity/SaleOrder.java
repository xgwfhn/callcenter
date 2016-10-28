package com.audi.callcenter.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "SS_ORDER", uniqueConstraints = { @UniqueConstraint(columnNames = { "ORDER_NO" }) })
@AggregateEntityRoot
public class SaleOrder  extends IdEntity{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String orderNo;//订单号
	private String createPerson;//创建人
	private Date createDate;//创建时间
	private OrderStatus orderStatus;//状态    枚举已in类型存入数据库   值为枚举中的顺序值
	private OrderType orderType;//订单类型
	private OrderArea orderArea;//订单区域
	private String des;//订单描述
	private String remark;//备注
	
	@Column( name = "ORDER_NO",unique = true )
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	
	@Column( name = "CREATE_PERSON" )
	public String getCreatePerson() {
		return createPerson;
	}
	public void setCreatePerson(String createPerson) {
		this.createPerson = createPerson;
	}
	
	@Column( name = "CREATE_DATE")
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	@Column( name = "ORDER_TYPE" )
	public OrderType getOrderType() {
		return orderType;
	}
	public void setOrderType(OrderType orderType) {
		this.orderType = orderType;
	}
	
	@Column( name = "ORDER_AREA" )
	public OrderArea getOrderArea() {
		return orderArea;
	}
	public void setOrderArea(OrderArea orderArea) {
		this.orderArea = orderArea;
	}
	
	@Column( name = "ORDER_STATUS" )
	public OrderStatus getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(OrderStatus orderStatus) {
		this.orderStatus = orderStatus;
	}
	
	@Column( name = "ORDER_DES" )
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	
	@Column( name = "REMARK")
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	/** 订单状态 */
	public enum OrderStatus {
		UNVERIFIER("已提交未审核"), 
		UNPAY("已确认未支付"), 
		PAY("已确认正在支付"), 
		PAYSUCCESS("里程支付成功"), // 里程兑换须经过此步骤
		PAYFAIL("支付失败"), 
		UNBILL("已支付未出票"), 
		BILL("已支付已出票"), 
		CANCEL("已取消"), 
		VERIFIER("审核不通过"), 
		APPLYREFUND("已申请调账"), 
		REFUNDED("已退款"), 
		CHANGED("已改期"), 
		UNSUBMIT("暂提交"),
		REVOKE("已撤销票款"),
		ADJUST("已差错调账"),
		TOVOID("已作废"),
		SUBMITAUTHOPRIZATION("已提交预授权");

		private String orderStatusName;

		OrderStatus(String orderStatusName) {
			this.orderStatusName = orderStatusName;
		}

		public String getOrderStatusName() {
			return orderStatusName;
		}

		public void setOrderStatusName(String orderStatusName) {
			this.orderStatusName = orderStatusName;
		}

		public String getName() {
			return this.name();
		}
	}
	
	
	/** 订单类型 */
	public enum OrderType {
		ORDINARY("普通"), CHANGEDATE("改期"), UPGRADE("升舱");

		private String orderTypeName;

		OrderType(String orderTypeName) {
			this.orderTypeName = orderTypeName;
		}

		public String getOrderTypeName() {
			return orderTypeName;
		}

		public void setOrderTypeName(String orderTypeName) {
			this.orderTypeName = orderTypeName;
		}

		public String getName() {
			return this.name();
		}
	}
	
	/** 订单区域 */
	public enum OrderArea {
		INLAND("国内"), FOREIGN("国际");
		private String orderAreaName;

		OrderArea(String orderAreaName) {

			this.orderAreaName = orderAreaName;
		}

		public String getOrderAreaName() {
			return orderAreaName;
		}

		public void setOrderAreaName(String orderAreaName) {
			this.orderAreaName = orderAreaName;
		}

		public String getName() {
			return this.name();
		}
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return null;
	}

}
