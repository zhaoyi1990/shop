package com.csxh.eshop.model;

public class Pager {
	// �ܵļ�¼���������ݿ��ѯ�ȵ�
	private long totalRows;

	// ÿҳ�����ʾ�ļ�¼��
	private int pageRows;

	// ������ҳ
	private int pageCount;

	// ��ǰ�ǵڼ�ҳ����1��ʼ����
	private int currentPage = 1;

	public Pager(long totalRows, int pageRows) {
		super();
		this.totalRows = totalRows;
		this.pageRows = pageRows;
		this.pageCount = (int) Math.ceil((double)this.totalRows/(double)this.pageRows);
	}
	
	// ��ǰҳ��һ����¼�����ݿ�ı�ţ���0��ʼ��
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
