package cn.second_hand.product.domain;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.bson.types.ObjectId;

import com.alibaba.fastjson.JSONObject;

public class Order {
	private ObjectId oId;//订单号
	private int uId;//用户Id
	private int userTypeId;//用户类型 买家：1 卖家：2
	private String category;//种类
	private double money;//价格
	private int number;//数量
	private int payType;//支付类型
	private String description;//描述
	private int orderState;//订单状态
	private String deliveryAddress;//送货地址
	private String logistic;//物流
	private Date createTime;//创建时间
	private Date updateTime;//修改时间
	public ObjectId getoId() {
		return oId;
	}
	public void setoId(ObjectId oId) {
		this.oId = oId;
	}
	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	public int getUserTypeId() {
		return userTypeId;
	}
	public void setUserTypeId(int userTypeId) {
		this.userTypeId = userTypeId;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getPayType() {
		return payType;
	}
	public void setPayType(int payType) {
		this.payType = payType;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getOrderState() {
		return orderState;
	}
	public void setOrderState(int orderState) {
		this.orderState = orderState;
	}
	public String getDeliveryAddress() {
		return deliveryAddress;
	}
	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}
	public String getLogistic() {
		return logistic;
	}
	public void setLogistic(String logistic) {
		this.logistic = logistic;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	@Override
	public String toString() {
		return "Order [oId=" + oId + ", uId=" + uId + ", userTypeId=" + userTypeId + ", category=" + category
				+ ", money=" + money + ", number=" + number + ", payType=" + payType + ", description=" + description
				+ ", orderState=" + orderState + ", deliveryAddress=" + deliveryAddress + ", logistic=" + logistic
				+ ", createTime=" + createTime + ", updateTime=" + updateTime + "]";
	}
	public String getJsonString() {
		Map<String, Object> jsonOrder = new HashMap<String, Object>();
		jsonOrder.put("oid", oId);
		jsonOrder.put("uid", uId);
		jsonOrder.put("userTypeId", userTypeId);
		jsonOrder.put("category", category);
		jsonOrder.put("money", money);
		jsonOrder.put("number", number);
		jsonOrder.put("description", description);
		jsonOrder.put("payType", payType);
		jsonOrder.put("orderState", orderState);
		jsonOrder.put("deliveryAddress", deliveryAddress);
		jsonOrder.put("logistic", logistic);
		jsonOrder.put("createTime", createTime);
		jsonOrder.put("updateTime", updateTime);
		return JSONObject.toJSONString(jsonOrder);
	}
}
