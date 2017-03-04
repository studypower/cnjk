package com.disease_control.core.page;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * 分页对象.
 * 包含当前页数据及分页信息.
 *
 * @author yakov
 */
@SuppressWarnings("serial")
public class Page implements Serializable {

	static private int DEFAULT_PAGE_SIZE = 20;

	/**
	 * 每页的记录数
	 */
	private int pageSize = DEFAULT_PAGE_SIZE;

	/**
	 * 当前页数
	 */
	private int pageIndex;

	/**
	 * 当前页中存放的记录,类型一般为List
	 */
	private Object data;

	/**
	 * 总记录数
	 */
	private int totalCount;

	
	public Page() {
		this(1, DEFAULT_PAGE_SIZE, new ArrayList(),0);
	}

	/**
	 * 默认构造方法
	 * @param totalSize 数据库中总记录条数
	 * @param pageSize  本页容量
	 * @param data	  本页包含的数据
	 */
	public Page( int pageIndex,int pageSize, Object data,int totalSize ) {
		this.pageSize = pageSize;
		this.pageIndex = pageIndex;
		this.totalCount = totalSize;
		this.data = data;
	}

	/**
	 * 取数据库中包含的总记录数
	 */
	public int getTotalCount() {
		return this.totalCount;
	}

	/**
	 * 取总页数
	 */
	public int getTotalPageCount() {
		if (totalCount % pageSize == 0)
			return totalCount / pageSize;
		else
			return totalCount / pageSize + 1;
	}

	/**
	 * 取每页数据容量
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * 当前页中的记录
	 */
	public Object getResult() {
		return data;
	}

	/**
	 * 取当前页码,页码从1开始
	 */
	public int getCurrentPageNo() {
		return pageIndex;
	}

	/**
	 * 是否有下一页
	 */
	public boolean hasNextPage() {
		return this.getCurrentPageNo() < this.getTotalPageCount();
	}
	
	/**
	 * 获取下一页号码
	 * @return
	 */
	public long getNextPage(){
		if(this.getCurrentPageNo()>=getTotalPageCount()){
			return getTotalPageCount();
		}
		return this.getCurrentPageNo() + 1;
	}

	/**
	 * 是否有上一页
	 */
	public boolean hasPreviousPage() {
		return this.getCurrentPageNo() > 1;
	}
	
	/**
	 * 获取上一页号码
	 * @return
	 */
	public long getPreviousPage(){
		if(this.getCurrentPageNo()<=1){
			return 1;
		}
		return this.getCurrentPageNo() - 1;
	}

	/**
	 * 获取任一页第一条数据的位置，每页条数使用默认值
	 */
	protected static int getStartOfPage(int pageNo) {
		return getStartOfPage(pageNo, DEFAULT_PAGE_SIZE);
	}

	/**
	 * 获取任一页第一条数据的位置,startIndex从0开始
	 */
	public static int getStartOfPage(int pageNo, int pageSize) {
		return (pageNo - 1) * pageSize;
	}
	
	public Map getPagerMap(){
		Map pagerMap = new HashMap();
		pagerMap.put("firstPage", 1); // 第一页页码
		pagerMap.put("prevPage", getPreviousPage()); // 上一页页码
		pagerMap.put("nextPage", getNextPage()); // 下一页页码
		pagerMap.put("lastPage", getTotalPageCount()); // 最后一页页码
		pagerMap.put("pageTotal", getTotalPageCount()); // 总页数
		pagerMap.put("pageIndex", getCurrentPageNo()); // 当前页数
		pagerMap.put("retTotal", getTotalCount()); // 总数据条数
		pagerMap.put("result", getResult()); // 结果集
		return pagerMap;
	}
}
