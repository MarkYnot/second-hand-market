package cn.second_hand.query;

import java.util.Date;


import cn.second_hand.user.utils.DateUtil;

public class AuditQueryObject  extends QueryObject{

	private Date beginDate;
	private Date endDate;
//	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}
	
	public Date getBeginDate() {
		return beginDate;
	}
	public Date getEndDate() {
		return endDate ==null ? null: DateUtil.endOfDay(endDate);
	}
//	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
}
