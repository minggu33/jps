package com.jps.domain;

public class searchVO {
	
	private int pageNum;
	private int pageSize;
	private String search;
	private String type;
	private String category;
	private int startRow;
	private final int pageBlock = 5;
	private int cnt;
	private int pageCount;
	
	
	
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		if(pageNum == 0) {
			this.pageNum = 1;
		} else {
			this.pageNum = pageNum;
		}
	}
	
	public int getPageBlock() {
		return pageBlock;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		if(pageSize == 0) {
			this.pageSize = 10;
		} else {
			this.pageSize = pageSize;
		}
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int pageNum, int pageSize) {
		this.startRow = (pageNum - 1) * pageSize;
	}
	public int getCnt() {
		return cnt;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount() {
		this.pageCount = cnt/pageSize + (cnt % pageSize == 0? 0 : 1);
	}
	
	public void setPageInfo(searchVO vo, int cnt) {
		setCnt(cnt);
		setPageNum(vo.getPageNum());
		setPageSize(vo.getPageSize());
		setStartRow(pageNum, pageSize);
		setPageCount();
	}

}
