package cn.second_hand.query;

public abstract class QueryObject {

	private Integer currentPage =1;
	private Integer pageSize = 6;
	
	public int getStart() {
		return (currentPage -1) * pageSize;
	}
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
}
