package cn.second_hand.product.domain;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.bson.types.ObjectId;

import com.alibaba.fastjson.JSONObject;

public class Product {
	private ObjectId oid;
	public ObjectId getOid() {
		return oid;
	}
	public void setOid(ObjectId oid) {
		this.oid = oid;
	}
	private String title;
	private String category;
	private int price;
	private String description;
	private String picture1;
	private String picture2;
	private boolean bargainStatus =false;
	private String applierEmail;
	private boolean applyStatus;
	private String remark;
	private Date applyTime;
	private Date auditTime;
	private int auditState;
	private boolean isHide;
	public boolean isHide() {
		return isHide;
	}
	public void setHide(boolean isHide) {
		this.isHide = isHide;
	}
	public int getAuditState() {
		return auditState;
	}
	public void setAuditState(int auditState) {
		this.auditState = auditState;
	}
	public String getTitle() {
		return title;
	}
	
	
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPicture1() {
		return picture1;
	}
	public void setPicture1(String picture1) {
		this.picture1 = picture1;
	}
	public String getPicture2() {
		return picture2;
	}
	public void setPicture2(String picture2) {
		this.picture2 = picture2;
	}
	public boolean isBargainStatus() {
		return bargainStatus;
	}
	public void setBargainStatus(boolean bargainStatus) {
		this.bargainStatus = bargainStatus;
	}
	public String getApplierEmail() {
		return applierEmail;
	}
	public void setApplierEmail(String applierEmail) {
		this.applierEmail = applierEmail;
	}
	public boolean isApplyStatus() {
		return applyStatus;
	}
	public void setApplyStatus(boolean applierStatus) {
		this.applyStatus = applierStatus;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Date getApplyTime() {
		return applyTime;
	}
	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}
	public Date getAuditTime() {
		return auditTime;
	}
	public void setAuditTime(Date auditTime) {
		this.auditTime = auditTime;
	}
	
	public String getJsonString() {
		Map<String,Object> json = new HashMap<String,Object>();
		json.put("oid", oid.toString());
		json.put("applierEmail", applierEmail);
		json.put("title", title);
		json.put("price", price);
		json.put("description", description);
		json.put("bargainStatus", bargainStatus);
		json.put("category", category);
		json.put("picture1", picture1);
		json.put("picture2", picture2);
		json.put("remark", remark);
		return JSONObject.toJSONString(json);
	}
	
	@Override
	public String toString() {
		return "Product [oid=" + oid + ", title=" + title + ", category=" + category + ", price=" + price
				+ ", description=" + description + ", picture1=" + picture1 + ", picture2=" + picture2
				+ ", bargainStatus=" + bargainStatus + ", applierEmail=" + applierEmail + ", applyStatus=" + applyStatus
				+ ", remark=" + remark + ", applyTime=" + applyTime + ", auditTime=" + auditTime + ", auditState="
				+ auditState + ", isHide=" + isHide + "]";
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}

}
