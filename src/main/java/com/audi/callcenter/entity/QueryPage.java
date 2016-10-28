package com.audi.callcenter.entity;

import java.io.Serializable;
import java.sql.Date;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Transient;

import com.google.common.base.Strings;

/**
 * 
 * @author loudyn
 * 
 * @param <T>
 */
public final class QueryPage<T> implements Serializable {

	private static final long serialVersionUID = 1L;

	private long pageNo = 1;
	private long pageSize = 10;

	private long totalCount = -1;

	private List<T> result;
	private Map<String, Object> params = new HashMap<String, Object>();

	/**
	 * @return the pageNo
	 */
	public long getPageNo() {
		return pageNo;
	}

	public QueryPage<T> setPageNo(long pageNo) {
		this.pageNo = pageNo;
		if (this.pageNo < 1) {
			this.pageNo = 1;
		}
		return this;
	}

	/**
	 * @return the pageSize
	 */
	public long getPageSize() {
		return pageSize;
	}

	public QueryPage<T> setPageSize(long pageSize) {
		this.pageSize = pageSize;
		return this;
	}

	public long getTotalCount() {
		return totalCount;
	}

	public QueryPage<T> setTotalCount(long totalCount) {
		this.totalCount = totalCount;
		return this;
	}

	/**
	 * @return the result
	 */
	public List<T> getResult() {
		if (null == result) {
			return Collections.emptyList();
		}

		return result;
	}

	/**
	 * @param result
	 *            the result to set
	 * @return
	 * @return
	 */
	public QueryPage<T> setResult(List<T> result) {
		this.result = result;
		return this;
	}

	public Map<String, Object> getParams() {
		return params;
	}

	public QueryPage<T> setParams(Map<String, Object> params) {
		this.params = params;
		return this;
	}

	/**
	 * 
	 * @param name
	 * @return
	 */
	public boolean containsParam(String name) {
		return getParams().containsKey(name);
	}

	/**
	 * 
	 * @param name
	 * @return
	 */
	public boolean isNotEmptyParam(String name) {
		return containsParam(name) && !Strings.isNullOrEmpty(getParamAsString(name));
	}

	/**
	 * 
	 * @param name
	 * @return
	 */
	public boolean isEmptyParam(String name) {
		return containsParam(name) && Strings.isNullOrEmpty(getParamAsString(name));
	}
	
	/**
	 * 
	 * @param name
	 * @return
	 */
	@Transient
	public Object getParamValue(String name) {
		return getParams().get(name);
	}

	/**
	 * 
	 * @param name
	 * @return
	 */
	@Transient
	public String getParamAsString(String name) {
		return String.valueOf(getParamValue(name));
	}
	/**
	 * 
	 * @param name
	 * @return
	 */
	@Transient
	public Date getParamAsDate(String name) {
		return Date.valueOf(getParamAsString(name));
	}

	/**
	 * 
	 * @param name
	 * @return
	 */
	@Transient
	public byte getParamValueAsByte(String name) {
		return Byte.parseByte(getParamAsString(name));
	}

	/**
	 * 
	 * @param name
	 * @return
	 */
	@Transient
	public short getParamValueAsShort(String name) {
		return Short.parseShort(getParamAsString(name));
	}

	/**
	 * 
	 * @param name
	 * @return
	 */
	@Transient
	public int getParamValueAsInt(String name) {
		return Integer.parseInt(getParamAsString(name));
	}

	/**
	 * 
	 * @param name
	 * @return
	 */
	@Transient
	public long getParamValueAsLong(String name) {
		return Long.parseLong(getParamAsString(name));
	}

	/**
	 * 
	 * @param name
	 * @return
	 */
	@Transient
	public Boolean getParamValueAsBoolean(String name){
		return Boolean.parseBoolean(getParamAsString(name));
	}
	
	public long getTotalPages() {
		if (totalCount < 0) {
			return -1;
		}

		long count = totalCount / pageSize;
		if (totalCount % pageSize > 0) {
			count++;
		}
		return count;
	}

	@Transient
	public long getFirst() {
		return ((pageNo - 1) * pageSize) + 1;
	}
}