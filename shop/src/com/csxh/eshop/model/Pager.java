package com.csxh.eshop.model;

public class Pager {
	// 总的记录数：从数据库查询等到
	private long totalRows;

	// 每页最多显示的记录数
	private int pageRows;

	// 共多少页
	private int pageCount;

	// 当前是第几页，从1开始计算
	private int currentPage = 1;

	public Pager(long totalRows, int pageRows) {
		super();
		this.totalRows = totalRows;
		this.pageRows = pageRows;
		this.pageCount = (int) Math.ceil((double)this.totalRows/(double)this.pageRows);
	}
	
	// 当前页第一条记录在数据库的编号：以0开始的
	public int getFirstRow(){
		return (this.currentPage -1) * this.pageRows;
	}
	public long getLastRow() {
		long rows = getFirstRow() + this.pageRows-1;
		return rows > this.totalRows ? this.totalRows-1 : rows;
	}
	
	public long getTotalRows() {
		return totalRows;
	}
	public int getPageRows() {
		return pageRows;
	}
	public int getPageCount() {
		return pageCount;
	}
	public int getCurrentPage() {
		return currentPage;
	}

	public void setTotalRows(long totalRows) {
		this.totalRows = totalRows;
	}
	public void setPageRows(int pageRows) {
		this.pageRows = pageRows;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	public boolean isHasPrev() {
		return this.currentPage - 1 > 0;
	}

	public boolean isHasNext() {
		return this.currentPage + 1 <= this.pageCount;
	}


}
